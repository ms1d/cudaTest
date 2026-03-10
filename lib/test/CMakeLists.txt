cmake_minimum_required(VERSION 3.26)

add_library(test src/testkernel.cu)
target_include_directories(test PUBLIC include)

target_link_libraries(test PUBLIC vec3)

set_target_properties(test PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON
)
