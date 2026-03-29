
if (ENABLE_CUDA)
    set_target_properties(${PROJECT_NAME} PROPERTIES
        CUDA_RUNTIME_LIBRARY Shared
        CUDA_ARCHITECTURES "${CMAKE_CUDA_ARCHITECTURES}"
)
endif()

set(LIBS fmt::fmt)
# Add CUDA dependencies
if (ENABLE_CUDA)
    set(LIBS ${LIBS} CUDA::cudart CUDA::cublas CUDA::cusolver CUDA::curand )
endif()

# Add link libraries
target_link_libraries(${PROJECT_NAME} PUBLIC ${LIBS})
