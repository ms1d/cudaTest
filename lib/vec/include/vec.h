#pragma once

#include <iostream>

#ifndef __host__
#define __host__
#endif
#ifndef __device__
#define __device__
#endif

template<size_t dim>
struct vec {
	public:
		float data[dim];
};
