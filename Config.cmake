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

# Set module path
set(_CMAKE_DIR ${CMAKE_CURRENT_LIST_DIR})

# Include options
include(${_CMAKE_DIR}/Options.cmake)

# Apply default settings
include(${_CMAKE_DIR}/Defaults.cmake)

# Clean up
unset(_CMAKE_DIR)
