#include <vector>

#include "serial/node_handle.h"
#include "serial/serial.h"

// int set_time = 100;  // (ms)
int set_time = 25;  // (ms)

int main(int argc, char **argv) {
  SerialNodeHandle node(argc, argv, "serial");
  Serial serial("/dev/ttyUSB0", 115200);
  vector<float> speed = {5.098039216, -5.098039216, 50, -50};

  clock_t start = clock(), end;
  while (ros::ok()) {
    end = clock();
    vector<float> speed = node.get_MotorCmd();

    // linux clock(us), windows clock(ms)
    if ((double)(end - start) >= (set_time * 1000)) {
      serial.pub_motor_pwm(speed);
      start = end;
    }
    ros::spinOnce();
  }
}
