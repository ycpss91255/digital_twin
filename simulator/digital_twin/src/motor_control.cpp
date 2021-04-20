#include <cstdio>
#include <iostream>

#include "digital_twin/node_handle.h"
#include "ros/ros.h"


int main(int argc, char **argv) {
  SimNodeHandle Node(argc, argv, "digital_twin/robot", 1);
  ros::Rate loop_rate(100);

  while (ros::ok()) {
    Node.pub_MotorCmd(10);
    printf("motor Pos = %f\n", Node.MotorPos);
    ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}
