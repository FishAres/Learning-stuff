#include <iostream>

int a = 5324;

int main () {
// this will print the location of the variable "a"
std::cout << &a<<"\n";

//de-referencing indicated with operator * before var. name
int * pointerToA = &a;

std::cout << * pointerToA; // this can be "inverted" too
return 0;
}