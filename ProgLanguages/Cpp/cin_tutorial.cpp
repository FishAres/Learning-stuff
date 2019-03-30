#include <iostream>
#include <string>

int main () {
    int year = 0;
    int age = 0;
    std::string pig = " ";

    std::cout<<"When make good? ";

    // get user response & assign to "year"
    std::cin >> year;

    std::cout << "When do pig? ";
    std::cin >> age;

    std::cout << "What good? ";
    std::cin >> pig;
    std::cout << "Mmmmmmm " <<pig<< "!\n";

    return 0;
}