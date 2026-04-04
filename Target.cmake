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
