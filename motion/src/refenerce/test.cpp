#include<iostream>

using namespace std;

int main()
{
    float x[2]={1,2};
    x[0] = -x[0];
    std::cout << x[0] << std::endl;
    return 0;
}
