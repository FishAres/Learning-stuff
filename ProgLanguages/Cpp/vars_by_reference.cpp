#include <iostream>

// we can circumvent the variable scope problem
// by being cheeky and passing a pointer to the variable instead

void increment(int &input);

int main () {
    int a = 34;
    std::cout << "Before: " << a << "\n";
    increment(a);
    std::cout << "After: " << a << "\n";
    std::cout << &a << "\n";

    return 0;
}

void increment(int &input) {
    input++; // hmmm
    std::cout << input << "\n";
}