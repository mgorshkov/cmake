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

# Optimizations.cmake - CPU optimization settings for C++ projects
#
# This file configures AVX/AMX/SSE optimizations based on compiler and options.

if (NOT CMAKE_BUILD_TYPE STREQUAL "Debug")
    if (ENABLE_SSE2)
        add_compile_definitions(ENABLE_SSE2)
        if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
            message(STATUS "${PROJECT_NAME}: GNU or Clang compiler, SSE2 optimization ON")
            add_compile_options(-O3 -ftree-vectorize -msse2)
        elseif (CMAKE_CXX_COMPILER_ID MATCHES "Intel")
            message(STATUS "${PROJECT_NAME}: Intel compiler, SSE2 optimization ON")
            add_compile_options(-Ofast -axSSE2)
        elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
            message(STATUS "${PROJECT_NAME}: MSVC compiler, SSE2 optimization ON")
            if (NOT CMAKE_CL_64)
                add_compile_options(/O2 /arch:SSE2)
            endif()
        endif()
    endif()
    if (ENABLE_SSE3)
        add_compile_definitions(ENABLE_SSE3)
        if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
            message(STATUS "${PROJECT_NAME}: GNU or Clang compiler, SSE3 optimization ON")
            add_compile_options(-O3 -ftree-vectorize -msse3)
        elseif (CMAKE_CXX_COMPILER_ID STREQUAL "Intel")
            message(STATUS "${PROJECT_NAME}: Intel compiler, SSE3 optimization ON")
            add_compile_options(-Ofast -axSSE3)
        elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
            message(STATUS "${PROJECT_NAME}: MSVC compiler, SSE3 optimization ON")
            add_compile_options(/O2 /arch:SSE2) # VC doesn't support /arch:SSE3
        endif()
    endif()
    if (ENABLE_AVX)
        add_compile_definitions(ENABLE_AVX)
        if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
            message(STATUS "${PROJECT_NAME}: GNU or Clang compiler, AVX optimization ON")
            add_compile_options(-O3 -ftree-vectorize -mavx)
        elseif (CMAKE_CXX_COMPILER_ID MATCHES "Intel")
            message(STATUS "${PROJECT_NAME}: Intel compiler, AVX optimization ON")
            add_compile_options(-Ofast -axAVX)
        elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
            message(STATUS "${PROJECT_NAME}: MSVC compiler, AVX optimization ON")
            add_compile_options(/O2 /arch:AVX)
        endif()
    endif()
    if (ENABLE_AVX2)
        add_compile_definitions(ENABLE_AVX2)
        if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
            message(STATUS "${PROJECT_NAME}: GNU or Clang compiler, AVX2 optimization ON")
            add_compile_options(-O3 -ftree-vectorize -mavx2)
        elseif (CMAKE_CXX_COMPILER_ID MATCHES "Intel")
            message(STATUS "${PROJECT_NAME}: Intel compiler, AVX2 optimization ON")
            add_compile_options(-O3 -msse4.2 -axAVX,core-avx2)
        elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
            message(STATUS "${PROJECT_NAME}: MSVC compiler, AVX2 optimization ON")
            add_compile_options(/O2 /arch:AVX2)
        endif()
    endif()
    if (ENABLE_AVX512)
        add_compile_definitions(ENABLE_AVX512)
        if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
            message(STATUS "${PROJECT_NAME}: GNU or Clang compiler, AVX512 optimization ON")
            add_compile_options(-O3 -ftree-vectorize -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl)
        elseif (CMAKE_CXX_COMPILER_ID MATCHES "Intel")
            message(STATUS "${PROJECT_NAME}: Intel compiler, AVX512 optimization ON")
            add_compile_options(-O3 -mavx512f -mavx512dq -mavx512bw -mavx512vbmi -mavx512vbmi2 -mavx512vl)
        elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
            message(STATUS "${PROJECT_NAME}: MSVC compiler, AVX512 optimization ON")
            add_compile_options(/O2 /arch:AVX512)
        endif()
    endif()
    if (ENABLE_AMX)
        add_compile_definitions(ENABLE_AMX)
        if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
            message(STATUS "${PROJECT_NAME}: GNU or Clang compiler, AMX optimization ON")
            add_compile_options(-O3 -ftree-vectorize -mamx-tile -mamx-int8 -mamx-bf16 -mamx-fp16)
        elseif (CMAKE_CXX_COMPILER_ID MATCHES "Intel")
            message(STATUS "${PROJECT_NAME}: Intel compiler, AMX optimization ON")
            add_compile_options(-O3 -mamx-tile -mamx-int8 -mamx-bf16 -mamx-fp16)
        elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
            message(STATUS "${PROJECT_NAME}: MSVC compiler, AMX optimization ON")
            # MSVC does not yet support AMX flags; use AVX512 as fallback
            add_compile_options(/O2 /arch:AVX512)
        endif()
    endif()
endif()
