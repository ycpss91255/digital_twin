#include <cstdio>
#include <iostream>

#include "digital_twin/node_handle.h"
#include "ros/ros.h"

int main(int argc, char **argv) {
  SimNodeHandle Node(argc, argv, "digital_twin/robot", 1);
  // ros::Rate loop_rate(10);

  while (ros::ok()) {
    Node.pub_MotorCmd(1);
  printf("motor Pos = %f\n", Node.MotorPos);

    if (Node.MotorPos >= 6.28) {
      printf("Bingo\n");
      Node.pub_MotorCmd(0);
      break;
    }
    ros::spinOnce();
    // loop_rate.sleep();
  }

  return 0;
}
