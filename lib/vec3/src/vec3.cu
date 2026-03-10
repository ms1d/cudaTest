#include <cmath>
#include "vec3.h"

__host__ __device__ vec3::vec3(float x, float y, float z) : x(x), y(y), z(z) {}

__host__ __device__ float vec3::GetMagnitude() const {
    return sqrt(x*x + y*y + z*z);
}

__host__ __device__ vec3 vec3::operator+(const vec3& other) const {
    return vec3{x + other.x, y + other.y, z + other.z};
}

__host__ __device__ vec3 vec3::operator-(const vec3& other) const {
    return vec3{x - other.x, y - other.y, z - other.z};
}

__host__ __device__ bool vec3::operator==(const vec3& other) const {
    return x == other.x && y == other.y && z == other.z;
}

__host__ __device__ vec3 vec3::operator^(const vec3& other) const {
    return vec3{
        y*other.z - z*other.y,
        z*other.x - x*other.z,
        x*other.y - y*other.x
    };
}

__host__ __device__ float vec3::operator*(const vec3& other) const {
    return x*other.x + y*other.y + z*other.z;
}
