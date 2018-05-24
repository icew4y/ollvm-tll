//=== unittests/CodeGen/IncrementalProcessingTest.cpp - IncrementalCodeGen ===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "clang/AST/ASTConsumer.h"
#include "clang/AST/ASTContext.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Basic/TargetInfo.h"
#include "clang/CodeGen/ModuleBuilder.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Lex/Preprocessor.h"
#include "clang/Parse/Parser.h"
#include "clang/Sema/Sema.h"
#include "llvm/ADT/Triple.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/Host.h"
#include "llvm/Support/MemoryBuffer.h"
#include "gtest/gtest.h"

#include <memory>

using namespace llvm;
using namespace clang;

namespace {

// Incremental processing produces several modules, all using the same "main
// file". Make sure CodeGen can cope with that, e.g. for static initializers.
const char TestProgram1[] =
    "extern \"C\" int funcForProg1() { return 17; }\n"
    "struct EmitCXXGlobalInitFunc1 {\n"
    "   EmitCXXGlobalInitFunc1() {}\n"
    "} test1;";

const char TestProgram2[] =
    "extern \"C\" int funcForProg2() { return 42; }\n"
    "struct EmitCXXGlobalInitFunc2 {\n"
    "   EmitCXXGlobalInitFunc2() {}\n"
    "} test2;";


/// An incremental version of ParseAST().
static std::unique_ptr<llvm::Module>
IncrementalParseAST(CompilerInstance& CI, Parser& P,
                    CodeGenerator& CG, const char* code) {
  static int counter = 0;
  struct IncreaseCounterOnRet {
    ~IncreaseCounterOnRet() {
      ++counter;
    }
  } ICOR;

  Sema& S = CI.getSema();
  clang::SourceManager &SM = S.getSourceManager();
  if (!code) {
    // Main file
    SM.setMainFileID(SM.createFileID(
        llvm::MemoryBuffer::getMemBuffer("    "), clang::SrcMgr::C_User));

    S.getPreprocessor().EnterMainSourceFile();
    P.Initialize();
  } else {
    FileID FID = SM.createFileID(
        llvm::MemoryBuffer::getMemBuffer(code), clang::SrcMgr::C_User);
    SourceLocation MainStartLoc = SM.getLocForStartOfFile(SM.getMainFileID());
    SourceLocation InclLoc = MainStartLoc.getLocWithOffset(counter);
    S.getPreprocessor().EnterSourceFile(FID, 0, InclLoc);
  }

  ExternalASTSource *External = S.getASTContext().getExternalSource();
  if (External)
    External->StartTranslationUnit(&CG);

  Parser::DeclGroupPtrTy ADecl;
  for (bool AtEOF = P.ParseFirstTopLevelDecl(ADecl); !AtEOF;
       AtEOF = P.ParseTopLevelDecl(ADecl)) {
    // If we got a null return and something *was* parsed, ignore it.  This
    // is due to a top-level semicolon, an action override, or a parse error
    // skipping something.
    if (ADecl && !CG.HandleTopLevelDecl(ADecl.get()))
      return nullptr;
  }

  // Process any TopLevelDecls generated by #pragma weak.
  for (Decl *D : S.WeakTopLevelDecls())
    CG.HandleTopLevelDecl(DeclGroupRef(D));

  CG.HandleTranslationUnit(S.getASTContext());

  std::unique_ptr<llvm::Module> M(CG.ReleaseModule());
  // Switch to next module.
  CG.StartModule("incremental-module-" + std::to_string(counter),
                 M->getContext());
  return M;
}

const Function* getGlobalInit(llvm::Module& M) {
  for (const auto& Func: M)
    if (Func.hasName() && Func.getName().startswith("_GLOBAL__sub_I_"))
      return &Func;

  return nullptr;
}

TEST(IncrementalProcessing, EmitCXXGlobalInitFunc) {
    LLVMContext Context;
    CompilerInstance compiler;

    compiler.createDiagnostics();
    compiler.getLangOpts().CPlusPlus = 1;
    compiler.getLangOpts().CPlusPlus11 = 1;

    compiler.getTargetOpts().Triple = llvm::Triple::normalize(
        llvm::sys::getProcessTriple());
    compiler.setTarget(clang::TargetInfo::CreateTargetInfo(
      compiler.getDiagnostics(),
      std::make_shared<clang::TargetOptions>(
        compiler.getTargetOpts())));

    compiler.createFileManager();
    compiler.createSourceManager(compiler.getFileManager());
    compiler.createPreprocessor(clang::TU_Prefix);
    compiler.getPreprocessor().enableIncrementalProcessing();

    compiler.createASTContext();

    CodeGenerator* CG =
        CreateLLVMCodeGen(
            compiler.getDiagnostics(),
            "main-module",
            compiler.getHeaderSearchOpts(),
            compiler.getPreprocessorOpts(),
            compiler.getCodeGenOpts(),
            Context);
    compiler.setASTConsumer(std::unique_ptr<ASTConsumer>(CG));
    compiler.createSema(clang::TU_Prefix, nullptr);
    Sema& S = compiler.getSema();

    std::unique_ptr<Parser> ParseOP(new Parser(S.getPreprocessor(), S,
                                               /*SkipFunctionBodies*/ false));
    Parser &P = *ParseOP.get();

    std::array<std::unique_ptr<llvm::Module>, 3> M;
    M[0] = IncrementalParseAST(compiler, P, *CG, nullptr);
    ASSERT_TRUE(M[0]);

    M[1] = IncrementalParseAST(compiler, P, *CG, TestProgram1);
    ASSERT_TRUE(M[1]);
    ASSERT_TRUE(M[1]->getFunction("funcForProg1"));

    M[2] = IncrementalParseAST(compiler, P, *CG, TestProgram2);
    ASSERT_TRUE(M[2]);
    ASSERT_TRUE(M[2]->getFunction("funcForProg2"));
    // First code should not end up in second module:
    ASSERT_FALSE(M[2]->getFunction("funcForProg1"));

    // Make sure global inits exist and are unique:
    const Function* GlobalInit1 = getGlobalInit(*M[1]);
    ASSERT_TRUE(GlobalInit1);

    const Function* GlobalInit2 = getGlobalInit(*M[2]);
    ASSERT_TRUE(GlobalInit2);

    ASSERT_FALSE(GlobalInit1->getName() == GlobalInit2->getName());

}

} // end anonymous namespace
