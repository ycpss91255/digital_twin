#include "serial/serial.h"

int main(int argc, char** argv) {
  Serial serial("/dev/ttyUSB0", 115200);

  while (1) {
    // linux clock(us), windows clock(ms)
    int status = serial.sub_feedback(44);
    if (status == 1) {
      char* msg = serial.get_sub_msg();
      for (int i = 0; i < 44; i++) {
        unsigned char u_msg = (unsigned char)msg[i];
        printf("%X ", u_msg);
      }
      printf("\n\n");
    }
  }
}
