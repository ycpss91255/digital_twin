#include "serial/serial.h"

int main(int argc, char **argv) {
  Serial serial("/dev/ttyUSB0", 115200);
  while (1) {
    serial.sub_feedback();

  }
}
