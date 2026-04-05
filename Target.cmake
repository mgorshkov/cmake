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

# Target.cmake - Target-dependent configuration file for CMake modules
#
# Include this file in your CMakeLists.txt to apply target-dependent settings.
#
# Usage:
#   include(Config)
#   Or: include(path/to/Config.cmake)

# Set module path
set(_CMAKE_DIR ${CMAKE_CURRENT_LIST_DIR})

# Compiler options
include(${_CMAKE_DIR}/Compiler.cmake)

# Linker options
include(${_CMAKE_DIR}/Linker.cmake)

# Clean up
unset(_CMAKE_DIR)
