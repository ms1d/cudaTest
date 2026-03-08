#include <iostream>
#include "test.h"
#include "testkernel.h"

int main() {
	std::cout << SayHello() << "\n";
	launchTest();
	return 0;
}
