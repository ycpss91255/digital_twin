/*******************************
 * Include system header files
 ******************************/
#include <cstdio>
#include <iostream>
/*******************************
 * Include ROS header files
 ******************************/
#include "ros/ros.h"
/*******************************
 ** Include msg header files
 ******************************/
#include "geometry_msgs/Twist.h"
#include "motion/FourMotorStates.h"
/*******************************
 ** Include header files
 ******************************/
#include "motion/base_control.h"

int main(int argc, char **argv) {
  BaseControl car;
  ros::init(argc, argv, "base_control_test");
  ros::NodeHandle nh;
  ROS_INFO("Please uncomment '#define DEBUG', it in base_control.h");

  geometry_msgs::Twist cmd;
  cmd.linear.x = 10;
  car.InverseKinematics(cmd);
  motion::FourMotorStates enc;
  enc.w2 = -10;
  enc.w4 = 10;
  car.SetMotorEnc(enc);
  car.ForwardKinematics();

  ros::shutdown();
  return 0;
}
