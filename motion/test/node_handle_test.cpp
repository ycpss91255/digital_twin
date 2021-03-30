/*******************************
 * Include system header
 ******************************/
#include <cstdio>
#include <iostream>
/*******************************
 * Include ros header
 ******************************/
#include "motion/base_control.h"
#include "motion/node_handle.h"
#include "ros/ros.h"

// using namespace std;

int main(int argc, char **argv) {
  MotionNodeHandle Node(argc, argv);
  ros::Rate loop_rate(100);
  while (ros::ok()) {
    ros::spinOnce();
    loop_rate.sleep();
  }
  printf("%f,%f,%f", Node.MotorCmd.x, Node.MotorCmd.y, Node.MotorCmd.yaw);

  return 0;
}
