#include "matrix.h"

template<size_t r, size_t c>
__host__ __device__ float matrix<r, c>::det() const {
	static_assert(r == c, "Matrix is not square");

	// Implementation of generic Laplace algorithm if necessary, but probably not needed
	return 0;
}

// Implementation of specific sizes
template<>
__host__ __device__ float matrix<2, 2>::det() const {
	return 0;
}

template<>
__host__ __device__ float matrix<3, 3>::det() const {
	return 0;
}

template<>
__host__ __device__ float matrix<4, 4>::det() const {
	return 0;
}

// Scalar multiplication
template<size_t r, size_t c>
__host__ __device__ matrix<r,c> matrix<r, c>::operator*(float scalar) const {
	for (int i = 0; i < r; i++) {
		for (int j = 0; j < c; j++) {
			data[i][j] *= scalar;
		}
	}
}

// Vector multiplication
template<size_t r, size_t c>
__host__ __device__ matrix<r, c> matrix<r, c>::operator*(const vec3& vector) const {

}
