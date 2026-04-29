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

if(NOT CMAKE_BUILD_TYPE STREQUAL "Debug")
  if(ENABLE_SSE2)
    add_compile_definitions(ENABLE_SSE2)
    message(STATUS "${PROJECT_NAME}: SSE2 ON")
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES
                                               "Clang")
      add_compile_options(-ftree-vectorize -msse2)
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "Intel")
      add_compile_options(-Ofast -axSSE2)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
      if(NOT CMAKE_CL_64)
        add_compile_options(/arch:SSE2)
      endif()
    else()
      message(STATUS "${PROJECT_NAME}: Unknown compiler")
    endif()
  endif()
  if(ENABLE_SSE3)
    add_compile_definitions(ENABLE_SSE3)
    message(STATUS "${PROJECT_NAME}: SSE3 ON")
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES
                                               "Clang")
      add_compile_options(-ftree-vectorize -msse3)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Intel")
      add_compile_options(-Ofast -axSSE3)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
      add_compile_options(/arch:SSE2) # VC doesn't support /arch:SSE3
    else()
      message(STATUS "${PROJECT_NAME}: Unknown compiler")
    endif()
  endif()
  if(ENABLE_AVX)
    add_compile_definitions(ENABLE_AVX)
    message(STATUS "${PROJECT_NAME}: AVX ON")
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES
                                               "Clang")
      add_compile_options(-ftree-vectorize -mavx)
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "Intel")
      add_compile_options(-Ofast -axAVX)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
      add_compile_options(/O2 /arch:AVX)
    else()
      message(STATUS "${PROJECT_NAME}: Unknown compiler")
    endif()
  endif()
  if(ENABLE_AVX2)
    add_compile_definitions(ENABLE_AVX2)
    message(STATUS "${PROJECT_NAME}: AVX2 ON")
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES
                                               "Clang")
      add_compile_options(-ftree-vectorize -mavx2)
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "Intel")
      add_compile_options(-msse4.2 -axAVX,core-avx2)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
      add_compile_options(/arch:AVX2)
    else()
      message(STATUS "${PROJECT_NAME}: Unknown compiler")
    endif()
  endif()
  if(ENABLE_AVX512)
    add_compile_definitions(ENABLE_AVX512)
    message(STATUS "${PROJECT_NAME}: AVX512 ON")
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES
                                               "Clang")
      add_compile_options(
        -ftree-vectorize
        -mavx512f
        -mavx512dq
        -mavx512bw
        -mavx512vbmi
        -mavx512vbmi2
        -mavx512vl)
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "Intel")
      add_compile_options(-mavx512f -mavx512dq -mavx512bw -mavx512vbmi
                          -mavx512vbmi2 -mavx512vl)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
      add_compile_options(/arch:AVX512)
    else()
      message(STATUS "${PROJECT_NAME}: Unknown compiler")
    endif()
  endif()
  if(ENABLE_AMX)
    add_compile_definitions(ENABLE_AMX)
    message(STATUS "${PROJECT_NAME}: AMX ON")
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES
                                               "Clang")
      add_compile_options(-ftree-vectorize -mamx-tile -mamx-int8 -mamx-bf16
                          -mamx-fp16)
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "Intel")
      add_compile_options(-mamx-tile -mamx-int8 -mamx-bf16 -mamx-fp16)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
      # MSVC does not yet support AMX flags; use AVX512 as fallback
      add_compile_options(/arch:AVX512)
    else()
      message(STATUS "${PROJECT_NAME}: Unknown compiler")
    endif()
  endif()
endif()
