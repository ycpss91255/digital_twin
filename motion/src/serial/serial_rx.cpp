#include <vector>

#include "serial/node_handle.h"
#include "serial/serial.h"

int set_time = 25;  // (ms)

int main(int argc, char **argv) {
  // initialize ROS serial node
  SerialNodeHandle node(argc, argv, "serial_rx", RX_MODE);
  // Instantiate serial class
  // nano_uart ATTRS{serial}=="0002"
  SerialInit("/dev/nano_uart", 115200);

  motion::MotorStates state;

  while (ros::ok()) {
    // linux clock(us), windows clock(ms)
    int status = sub_FeedBack();
    if (status == 1) {
      for (int i = 0; i < 4; i++) {
        state = get_MotorStates(i);
        node.pub_MotorState(i, state);
      }
    }
  }
  SerialClose();
}
