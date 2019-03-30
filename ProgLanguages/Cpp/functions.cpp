#include <iostream>
using namespace std;

void printMessage(); // has to be included before main()
float calcSum(float m1, float m2);
// the arguments (with their types) must be specified in the beginning

int main() {
    printMessage();
    float m1 = 2.;
    float m2 = 3.;
    float sm;
    sm = calcSum(m1, m2);
    std::cout << sm ;
    return 0;
}

float calcSum(float m1, float m2) 
{
    return m1 + m2;
}
// the function definition can happen anywhere outside of main()
void printMessage() {
    std::cout << "Oh my giddy giddy gosh";
}
