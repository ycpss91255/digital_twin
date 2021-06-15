#include <vector>

#include "serial/node_handle.h"
#include "serial/serial.h"

int set_time = 25;  // (ms)

int main(int argc, char **argv) {
  SerialNodeHandle Node(argc, argv, "serial");
  Serial serial("/dev/ttyUSB0", 115200);
  vector<float> speed = {5.098039216, -5.098039216, 50, -50};

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
