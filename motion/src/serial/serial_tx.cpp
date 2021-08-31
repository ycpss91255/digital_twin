#include <vector>

#include "serial/node_handle.h"
#include "serial/serial.h"

int set_time = 25;  // (ms)

int main(int argc, char **argv) {
  // Initialize ROS serial node
  SerialNodeHandle node(argc, argv, "serial_tx", TX_MODE);
  // Instantiate serial class
  SerialInit("/dev/ttyUSB0", 115200);

  // time variable
  clock_t start = clock(), end;

  while (ros::ok()) {
    end = clock();
    vector<float> speed = node.get_MotorCmd();

    // linux clock(us), windows clock(ms)
    if ((double)(end - start) >= (set_time * 1000)) {
      pub_MotorSpeed(speed);
      start = end;
    }
    ros::spinOnce();
  }
  SerialClose();
}
