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
  MotionNodeHandle Node(argc, argv,"motion");
  BaseControl Base;
  ros::Rate loop_rate(1000);
  while (ros::ok()) {
    Base.InverseKinematics(Node.MotionCmd);
    Node.pub_MotorSpeed(Base.MotorSpeed);

    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}
