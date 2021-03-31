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
  ros::Rate loop_rate(100);
  while (ros::ok()) {

    Base.InverseKinematics(Node.MotionCmd);

    // ROS_INFO("w1 = %.3f", Base.MotorSpeed.w1);
    // ROS_INFO("w2 = %.3f", Base.MotorSpeed.w2);
    // ROS_INFO("w3 = %.3f", Base.MotorSpeed.w3);
    // ROS_INFO("w4 = %.3f", Base.MotorSpeed.w4);

    Node.pub_MotorSpeed(Base.MotorSpeed);

    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}
