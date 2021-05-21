#include "serial/serial.h"

int main(int argc, char **argv) {
  Serial serial("/dev/ttyUSB0", 115200);
  float sp[4] = {-10,10,-125,125};
  serial.pub_motor_pwm(sp);
}
