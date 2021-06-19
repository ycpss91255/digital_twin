#include <vector>

#include "serial/serial.h"

int main(int argc, char** argv) {
  SerialInit("/dev/ttyUSB0", 115200);

  while (1) {
    // linux clock(us), windows clock(ms)
    int status = sub_FeedBack();
    if (status == 1) {
      vector<uint8_t> msg = get_sub_msg();
      for (int i = 0; i < msg.size(); i++) {
        printf("%02X ", (uint8_t)msg.at(i));
      }
      printf("\n\n");
    } else {
      // printf("status = %d\n", status);
    }
  }
}
