#include <iostream>

using namespace std;

class test1 {
 public:
  test1(){};
  ~test1(){};
  void DefaultParamFunction(int a, int b = 10) {
    printf("a + b = %d\n", (a + b));
  }
};
class test2 : public test1 {
 public:
  test2(){};
  ~test2(){};
  void DefaultParamFunction2(int a, int b = 10) {
    printf("a + b = %d\n", (a + b));
  }
};

int main() {
  test2 qq;
  qq.DefaultParamFunction(2);
  //   float x[2] = {1, 2};
  //   x[0] = -x[0];
  //   std::cout << x[0] << std::endl;

  return 0;
}
