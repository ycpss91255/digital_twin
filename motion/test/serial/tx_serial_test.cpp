#include <vector>

#include "serial/serial.h"

int set_time = 25;  // (ms)

int main(int argc, char **argv) {
  Serial serial("/dev/ttyUSB0", 115200);
  vector<float> speed = {5.098039216, -5.098039216, 50, -50};

  clock_t start = clock(), end;
  while (1) {
    end = clock();
    // linux clock(us), windows clock(ms)
    if ((double)(end - start) >= (set_time * 1000)) {
      serial.pub_motor_pwm(speed);
      start = end;
    }

  }
}
