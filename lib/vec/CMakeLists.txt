cmake_minimum_required(VERSION 3.26)

add_library(vec src/vec.cu src/vec_io.cpp)
target_include_directories(vec PUBLIC include)
set_target_properties(vec PROPERTIES
	CUDA_SEPARABLE_COMPILATION ON
)
