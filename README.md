# cmake
CMake settings for np/pd/scipy/sklearn C++ projects

# Usage:
# Set up project
project(${PROJECT_NAME} VERSION 0.1.5 DESCRIPTION "CUDA optimized NumPy-style arrays in C++" LANGUAGES CXX CUDA)

# Tune up various optimizations
set(ENABLE_CUDA ON)   # Enable CUDA support
set(ENABLE_AVX2 ON)   # Enable AVX2 optimizations


include(FetchContent)

FetchContent_Declare(
    cmake
    GIT_REPOSITORY https://github.com/mgorshkov/cmake.git
    GIT_TAG main
)
FetchContent_MakeAvailable(cmake)

# Apply global cmake options
include(${cmake_SOURCE_DIR}/Config.cmake)

...
# Create the library
add_library(${PROJECT_NAME} ${CUDA_SOURCE_FILES})

# Apply target-dependent cmake options
include(${cmake_SOURCE_DIR}/Target.cmake)