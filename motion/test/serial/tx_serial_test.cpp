#include "serial/serial.h"

int set_time = 1000; // (ms)

int main(int argc, char **argv) {
  Serial serial("/dev/ttyUSB0", 115200);
  float sp[4] = {100, -100, 50, -50};

  clock_t start = clock(), end, end2;
  while (1) {
    end = clock();

    // linux clock(us), windows clock(ms)
    if ((double)(end - start) >= (set_time * 1000)) {
      serial.pub_motor_pwm(sp);
      start = end;
    }
  }
}
