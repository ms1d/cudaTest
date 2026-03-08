#include "testkernel.h"
#include <cmath>
#include <cstdlib>
#include <ctime>

__global__ void kernel(float* A, float* B, float* C, const int arrLength) {
	int id = threadIdx.x + blockDim.x * blockIdx.x;

	if (id >= arrLength) return;

	C[id] = A[id] + B[id];
}


// Basic function which adds numbers via a cuda kernel
testResult launchTest() {
	const int arrLength = 409600;
	const int threads = 256;

	float* A = nullptr;
	float* B = nullptr;
	float* C = nullptr;

	cudaMallocManaged(&A, arrLength*sizeof(float));
    cudaMallocManaged(&B, arrLength*sizeof(float));
    cudaMallocManaged(&C, arrLength*sizeof(float));
	
	// Basic initialisation of arrays
	srand(time(0));
	for (int i = 0; i < arrLength; i++) {
		A[i] = i * rand() % 10001 / 3.14159f;
		B[i] = i * rand() % 10001 / 2.71828f;
	}

	int blocks = ceil((float)arrLength / threads);

	kernel<<<blocks, threads>>>(A, B, C, arrLength);

    cudaDeviceSynchronize();

	testResult res;
	res.A = A;
	res.B = B;
	res.C = C;
	res.arrLength = arrLength;
	return res;
}
