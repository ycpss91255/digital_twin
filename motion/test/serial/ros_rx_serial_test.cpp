#include <vector>

#include "serial/node_handle.h"
#include "serial/serial.h"

int set_time = 25;  // (ms)

int main(int argc, char **argv) {
  SerialNodeHandle node(argc, argv, "serial_rx",RX_MODE);
  SerialInit("/dev/ttyUSB0", 115200);

  while (ros::ok()) {
    // linux clock(us), windows clock(ms)
    int status = sub_FeedBack();
    if (status == 1) {
      vector<uint8_t> msg = get_sub_msg();
      // TODO : wait done publish rx data node.
    }
  }
  SerialClose();
}
