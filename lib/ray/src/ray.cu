#include "ray.h"
#include "vec3.h"

__host__ __device__ Ray::Ray(const vec3& origin, const vec3& direction) : origin(origin), direction(direction) {}

__host__ __device__ vec3 Ray::GetPoint(float t) const {
    return origin + t * direction;
}
