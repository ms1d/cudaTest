#pragma once

#include "vec3.h"
#include <__clang_cuda_runtime_wrapper.h>
#ifndef __host__
#define __host__
#endif
#ifndef __device__
#define __device__
#endif

template <size_t r, size_t c>
struct matrix {
	public:
		float data[r][c];
		
		__host__ __device__ float det() const;

		__host__ __device__ matrix<r, c> operator*(float scalar) const;
		
		__host__ __device__ matrix<r, c> operator*(const vec3& vector) const;
};
