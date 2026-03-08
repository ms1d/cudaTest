#include "testkernel.h"
#include <cstdio>

__global__ void kernel() {
    printf("Hello from CUDA\n");
}

void launchTest() {
    kernel<<<1,1>>>();
    cudaDeviceSynchronize();
}
