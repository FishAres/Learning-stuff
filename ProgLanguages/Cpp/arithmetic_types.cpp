#include <cmath>
#include <iostream>

float a = 3.12;
int b = 4;

int main () {

int meow = std::pow(a, b);
// C++ can do type inference to some extent
std::string TorF[] = {"False", "True"}; 
// boolean (0) gets 0th element of dictionary
// true (1) gets 1st

int c = 2.3;
int d = meow;
float meow2 = c*d;
std::cout << meow <<"\n"; 
std::cout << meow2 <<"\n";
std::cout << TorF[meow < meow2];

if (meow < meow2) {
    std::cout << "\n lelele \n" << meow;
} else {
    std::cout << "\noh no!" ;
}

for (int i = 0; i < 10; i++) {
    std::cout << TorF[i > 5] << "\n";
}
int count = 0;
do {
    std::cout << "My hovercraft is full of eels\n";
    count++;
} while (count < 5);

count = 0; // we can re-assign variables, but not re-define them
while (count < 10) {
    count++;
    std::cout << count;
    if (count == 4) {
        std::cout << "Que paso";
        continue;
    }
}
return 0;
}

