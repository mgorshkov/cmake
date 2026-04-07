# CMake settings for C++ projects

# Copyright (c) 2026 Mikhail Gorshkov (mikhail.gorshkov@gmail.com)

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Defaults.cmake - Default CMake settings for C++ projects
#
# This file implements the common CMake configuration that can be reused
# across multiple projects. Include this file after setting options.

# C++ 20
set(CMAKE_CXX_STANDARD 20)

# If ON: CMake strictly requires the compiler to support the version set in CMAKE_CXX_STANDARD (e.g., 20). If the compiler is too old to support C++20, CMake will generate an error during configuration.
# If OFF (Default): If the compiler does not support C++20, CMake will "decay" and fall back to the latest standard the compiler does support (e.g., C++17 or C++14) without failing.
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# To get -std=c++20: Set set(CMAKE_CXX_EXTENSIONS OFF). This forces CMake to use the standard-compliant flag.
# To get -std=gnu++20: Set set(CMAKE_CXX_EXTENSIONS ON) (which is typically the default).
set(CMAKE_CXX_EXTENSIONS ON)

# Support debug info in stack trace
if (DEBUG_INFO)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -rdynamic")
    endif()

    if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        add_compile_options(/Zi /Ob0 /Od)
    endif()
endif()

# Tune up CUDA optimizations
if (ENABLE_CUDA)
    message(STATUS "${PROJECT_NAME}: CUDA Enabled")

    # Enable CUDA language
    enable_language(CUDA)

    # CUDA specific settings
    set(CMAKE_CUDA_STANDARD 20)
    set(CMAKE_CUDA_ARCHITECTURES 75 80 86) # RTX 20xx/30xx/40xx
    set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} --use_fast_math")
    # Avoid "style of line directive is a GCC" nvcc warnings
    set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcompiler -Wno-pedantic -Xcompiler -Wno-gnu-line-marker")
    set(CMAKE_CUDA_FLAGS_DEBUG "-G")

    # Find CUDA package
    find_package(CUDAToolkit REQUIRED)
    add_compile_definitions(USE_CUDA)
else()
    message(STATUS "${PROJECT_NAME}: CUDA Disabled")
endif()

# Default build type is Release
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

if (NOT DEFINED CMAKE_INSTALL_BINDIR)
    set(CMAKE_INSTALL_BINDIR "bin" CACHE PATH "user executables (bin)")
endif()

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    add_compile_options(/W4)
    add_definitions(-DNOMINMAX) # allow using min/max in the project
else()
    add_compile_options(-Wall -Wextra $<$<COMPILE_LANGUAGE:CXX>:-pedantic>)
endif()

# Set up Open MP
if (ENABLE_OPENMP)
    message(STATUS "${PROJECT_NAME}: OpenMP ON")
    find_package(OpenMP)
    if (OPENMP_FOUND)
        set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
        set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
        set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")
        add_compile_definitions(USE_OPENMP)
    endif()
endif()

