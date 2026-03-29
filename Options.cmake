# Options.cmake - Configuration options for CMake module
#
# This file defines the common options that can be set by projects using
# the NP CMake configuration module.

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

# Build shared libraries
option(BUILD_SHARED_LIBS "Build shared libraries" OFF)
