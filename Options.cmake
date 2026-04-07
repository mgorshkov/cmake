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

# Options.cmake - Configuration options for CMake module
#
# This file defines the common options that can be set by projects using
# the CMake configuration module.

# Use CUDA GPU optimizations
option(ENABLE_CUDA "Enable CUDA optimizations" ON)

# Use OPENMP
option(ENABLE_OPENMP "Enable OpenMP" OFF)

# Set up vector CPU optimizations
option(ENABLE_SSE2 "Enable SSE2 optimizations" OFF)
option(ENABLE_SSE3 "Enable SSE3 optimizations" OFF)
option(ENABLE_AVX "Enable AVX optimizations" OFF)
option(ENABLE_AVX2 "Enable AVX2 optimizations" ON)
option(ENABLE_AVX512 "Enable AVX512 optimizations" OFF)
option(ENABLE_AMX "Enable AMX (Advanced Matrix Extensions) optimizations" OFF)

# Build shared libraries
option(BUILD_SHARED_LIBS "Build shared libraries" OFF)

# Enable debug information
option(DEBUG_INFO "Enable debug information" OFF)
