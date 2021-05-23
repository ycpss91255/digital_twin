#include "serial/serial.h"

int main(int argc, char **argv) {
  Serial serial("/dev/ttyUSB0", 115200);
  float sp[4] = {100, -100, 50, -50};
  while (1) {
    serial.pub_motor_pwm(sp);
    sleep(1); //
  }
}
