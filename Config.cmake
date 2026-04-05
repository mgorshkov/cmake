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

# Config.cmake - Main configuration file for CMake modules
#
# Include this file in your CMakeLists.txt to apply all default settings.
#
# Usage:
#   include(Config)
#   Or: include(path/to/Config.cmake)
#
# Options can be set before including this file:
#   set(ENABLE_CUDA ON)   # Enable CUDA support
#   set(ENABLE_AVX2 ON)   # Enable AVX2 optimizations
#   etc.
# Complete options list:
# ENABLE_CUDA
# ENABLE_OPENMP
# ENABLE_SSE2
# ENABLE_SSE3
# ENABLE_AVX
# ENABLE_AVX2
# ENABLE_AVX512
# ENABLE_AMX

# Set module path
set(_CMAKE_DIR ${CMAKE_CURRENT_LIST_DIR})

# Include options
include(${_CMAKE_DIR}/Options.cmake)

# Apply global settings
include(${_CMAKE_DIR}/Globals.cmake)

# Include optimization settings
include(${_CMAKE_DIR}/Optimizations.cmake)

# Clean up
unset(_CMAKE_DIR)
