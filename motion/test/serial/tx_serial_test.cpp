#include <vector>

#include "serial/serial.h"

int set_time = 25;  // (ms)

int main(int argc, char **argv) {
  SerialInit("/dev/ttyUSB0", 115200);
  vector<float> speed = {2,8,-2,9};

  clock_t start = clock(), end;
  while (1) {
    end = clock();
    // linux clock(us), windows clock(ms)
    if ((double)(end - start) >= (set_time * 1000)) {
      pub_MotorSpeed(speed);
      start = end;
    }

  }
}
