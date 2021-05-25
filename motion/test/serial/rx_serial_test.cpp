#include "serial/serial.h"

int main(int argc, char** argv) {
  Serial serial("/dev/ttyUSB0", 115200);

  int msg_len = 44;
  while (1) {
    // linux clock(us), windows clock(ms)
    int status = serial.sub_feedback(msg_len);
    if (status == 1) {
      char* msg = serial.get_sub_msg();
      for (int i = 0; i < msg_len; i++) {
        printf("%02X ", (uint8_t)msg[i]);
      }
      printf("\n\n");
    } else {
      // printf("status = %d\n", status);
    }
  }
}
