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
#   # After creating your target (add_library / add_executable):
#   include(path/to/Target.cmake)
#
# By default, settings are applied to ${PROJECT_NAME}. To target a different
# target, set TARGET_NAME before including:
#   set(TARGET_NAME my_custom_target)
#   include(path/to/Target.cmake)

# Determine which target to configure
if(NOT TARGET_NAME)
    set(TARGET_NAME ${PROJECT_NAME})
endif()

# Set module path
set(_CMAKE_DIR ${CMAKE_CURRENT_LIST_DIR})

# Compiler options
include(${_CMAKE_DIR}/Compiler.cmake)

# CUDA compile definition (PUBLIC so it propagates to consumers via target_link_libraries)
if(ENABLE_CUDA)
    target_compile_definitions(${TARGET_NAME} PUBLIC USE_CUDA)
endif()

# Linker options
include(${_CMAKE_DIR}/Linker.cmake)

# Clean up
unset(_CMAKE_DIR)
unset(TARGET_NAME)
