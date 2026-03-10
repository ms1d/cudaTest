#pragma once

#ifndef __host__
#define __host__
#endif
#ifndef __device__
#define __device__
#endif

struct vec3 {
	public:
		float x, y, z;

		__host__ __device__ vec3(float x, float y, float z);

		__host__ __device__ float GetMagnitude() const;

		__host__ __device__ vec3 operator+(const vec3& other) const;
		
		__host__ __device__ vec3 operator-(const vec3& other) const;

		__host__ __device__ bool operator==(const vec3& other) const;

		// Cross product
		__host__ __device__ vec3 operator^(const vec3& other) const;

		// Dot product
		__host__ __device__ float operator*(const vec3& other) const;

		// Scalar Multiplication
		__host__ __device__ friend vec3 operator*(const vec3& v, float scalar) {
			return vec3(v.x * scalar, v.y * scalar, v.z * scalar);
		}
		
		__host__ __device__ friend vec3 operator*(float scalar, const vec3& v) {
			return v * scalar;
		}
};
