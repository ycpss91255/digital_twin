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

int main(int argc, char **argv) {
  // std::string nn;
  // nn = "motion2";
  // MotionNodeHandle Node(argc, argv, nn);
  MotionNodeHandle Node(argc, argv, "motion");
  ros::Rate loop_rate(5);
  ROS_INFO("Please uncomment '#define DEBUG', it in node_handle.h");

  while (ros::ok()) {
    // printf("123\n");
    motion::FourMotorStates ccc;
    ccc.w1 = ccc.w4 + 1;
    ccc.w2 = ccc.w1 + 1;
    ccc.w3 = ccc.w2 + 1;
    ccc.w4 = ccc.w3 + 1;
    Node.pub_MotorEnc(ccc);
    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}
