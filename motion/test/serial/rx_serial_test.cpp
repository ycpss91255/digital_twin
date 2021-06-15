#include <vector>

#include "serial/serial.h"

int main(int argc, char** argv) {
  Serial serial("/dev/ttyUSB0", 115200);

  while (1) {
    // linux clock(us), windows clock(ms)
    int status = serial.sub_feedback();
    if (status == 1) {
      vector<uint8_t> msg = serial.get_sub_msg();
      // for (int i = 0; i < msg.size(); i++) {
      //   printf("%02X ", (uint8_t)msg.at(i));
      // }
      // printf("\n\n");
    } else {
      // printf("status = %d\n", status);
    }
  }
}
