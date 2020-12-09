# Install script for directory: D:/Project/ollvm-tll/tools/clang/lib/Headers

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/LLVM")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xclang-headersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/6.0.0/include" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/adxintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/altivec.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/ammintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/arm_acle.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/armintr.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/arm64intr.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx2intrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512bwintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512bitalgintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vlbitalgintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512cdintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vpopcntdqintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512dqintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512erintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512fintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512ifmaintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512ifmavlintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512pfintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vbmiintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vbmivlintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vbmi2intrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vlvbmi2intrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vlbwintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vlcdintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vldqintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vlintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vpopcntdqvlintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vnniintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avx512vlvnniintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/avxintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/bmi2intrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/bmiintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/__clang_cuda_builtin_vars.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/__clang_cuda_cmath.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/__clang_cuda_complex_builtins.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/__clang_cuda_intrinsics.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/__clang_cuda_math_forward_declares.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/__clang_cuda_runtime_wrapper.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/cetintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/clzerointrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/cpuid.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/clflushoptintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/clwbintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/emmintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/f16cintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/float.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/fma4intrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/fmaintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/fxsrintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/gfniintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/htmintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/htmxlintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/ia32intrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/immintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/intrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/inttypes.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/iso646.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/limits.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/lwpintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/lzcntintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/mm3dnow.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/mmintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/mm_malloc.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/module.modulemap"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/msa.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/mwaitxintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/nmmintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/opencl-c.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/pkuintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/pmmintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/popcntintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/prfchwintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/rdseedintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/rtmintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/s390intrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/shaintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/smmintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/stdalign.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/stdarg.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/stdatomic.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/stdbool.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/stddef.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/__stddef_max_align_t.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/stdint.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/stdnoreturn.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/tbmintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/tgmath.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/tmmintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/unwind.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/vadefs.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/vaesintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/varargs.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/vecintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/vpclmulqdqintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/wmmintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/__wmmintrin_aes.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/__wmmintrin_pclmul.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/x86intrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/xmmintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/xopintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/xsavecintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/xsaveintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/xsaveoptintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/xsavesintrin.h"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/xtestintrin.h"
    "D:/Project/ollvm-tll/build/tools/clang/lib/Headers/arm_neon.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xclang-headersx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/6.0.0/include/cuda_wrappers" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/cuda_wrappers/algorithm"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/cuda_wrappers/complex"
    "D:/Project/ollvm-tll/tools/clang/lib/Headers/cuda_wrappers/new"
    )
endif()

