# Install script for directory: D:/Project/ollvm-tll/lib

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("D:/Project/ollvm-tll/build/lib/IR/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/FuzzMutate/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/IRReader/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/CodeGen/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/BinaryFormat/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/Bitcode/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/Transforms/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/Linker/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/Analysis/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/LTO/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/MC/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/Object/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/ObjectYAML/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/Option/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/DebugInfo/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/ExecutionEngine/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/Target/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/AsmParser/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/LineEditor/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/ProfileData/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/Passes/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/ToolDrivers/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/XRay/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/Testing/cmake_install.cmake")
  include("D:/Project/ollvm-tll/build/lib/WindowsManifest/cmake_install.cmake")

endif()

