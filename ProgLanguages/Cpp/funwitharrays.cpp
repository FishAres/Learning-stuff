#include <iostream>

int main () {
    int array2d[2][3] = {0,1,2,3,4,5};
    for (int i=0; i < 2; i++)
        for (int j=0; j < 3; j++)
            std::cout << array2d[i][j] <<"\n";

    return 0;

}