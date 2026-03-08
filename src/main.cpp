#include "testkernel.h"
#include <iostream>

int main() {
	auto res = launchTest();

	for (int i = 0; i < res.arrLength; i++) {
		std::cout << res.A[i] << " + " << res.B[i] << " = " << res.C[i] << "\n";
	}

	return 0;
}
