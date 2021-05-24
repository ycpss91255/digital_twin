#include "serial/serial.h"

int main(int argc, char **argv) {
  Serial serial("/dev/ttyUSB0", 115200);
  float sp[4] = {100, -100, 50, -50};

  clock_t start = clock(), end;
  while (1) {
    end = clock();
    if ((double)(end - start) >= 25) {
      serial.pub_motor_pwm(sp);
      printf("time = %f\n", (double)(end - start));
      start = end;
    }
  }
}

// int main() {
//   clock_t start, end;  // 儲存時間用的變數
//   start = clock();     // 計算開始時間
//   // 這邊放主要計算
//   ///////////////////
//   double result = pi(1e7);
//   ///////////////////
//   end = clock();                                   // 計算結束時間
//   double cpu_time_used = ((double)(end - start));  // 計算實際花費時間(ms)

//   cout << "pi的估計值為:" << result << endl;
//   cout << "程式執行時間:" << cpu_time_used << endl;
// }
