# Defaults.cmake - Default CMake settings for C++ projects
#
# This file implements the common CMake configuration that can be reused
# across multiple projects. Include this file after setting options.

# Include options first
include(${CMAKE_CURRENT_LIST_DIR}/Options.cmake)

# C++ 20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if (ENABLE_CUDA)
    message(STATUS "${PROJECT_NAME}: CUDA Enabled")

    # Enable CUDA language
    enable_language(CUDA)

    # CUDA specific settings
    set(CMAKE_CUDA_STANDARD 20)
    set(CMAKE_CUDA_ARCHITECTURES 75 80 86) # RTX 20xx/30xx/40xx
    set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -O3 --use_fast_math")
    # Avoid "style of line directive is a GCC" nvcc warnings
    set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcompiler -Wno-pedantic -Xcompiler -Wno-gnu-line-marker")
    set(CMAKE_CUDA_FLAGS_DEBUG "-G")

    # Find CUDA package
    find_package(CUDAToolkit REQUIRED)
    add_compile_definitions(USE_CUDA)
else()
    message(STATUS "${PROJECT_NAME}: CUDA Disabled")
endif()

# Default build type is Release
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

if (NOT DEFINED CMAKE_INSTALL_BINDIR)
    set(CMAKE_INSTALL_BINDIR "bin" CACHE PATH "user executables (bin)")
endif()

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    add_compile_options(/W4)
    add_definitions(-DNOMINMAX) # allow using min/max in the project
else()
    add_compile_options(-Wall -Wextra $<$<COMPILE_LANGUAGE:CXX>:-pedantic>)
endif()

# Set up Open MP
if (ENABLE_OPENMP)
    message(STATUS "NP: OpenMP ON")
    find_package(OpenMP)
    if (OPENMP_FOUND)
        set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
        set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
        set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")
        add_compile_definitions(USE_OPENMP)
    endif()
endif()

# Include optimization settings
include(${CMAKE_CURRENT_LIST_DIR}/Optimizations.cmake)

# Include linker settings
include(${CMAKE_CURRENT_LIST_DIR}/Linker.cmake)
