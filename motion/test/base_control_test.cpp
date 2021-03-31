/*******************************
 * Include system header
 ******************************/
#include <cstdio>
#include <iostream>
/*******************************
 * Include ros header
 ******************************/
#include "motion/base_control.h"
#include "motion/motor_data.h"
#include "ros/ros.h"

int main(int argc, char **argv) {
  BaseControl car;
  ros::init(argc, argv, "base_control_test");
  ros::NodeHandle nh;
  ROS_INFO("Please uncomment '#define DEBUG', it in base_control.h");

  RobotCommand cmd;
  cmd.x = 10;
  car.InverseKinematics(cmd);
  RobotSpeed enc;
  enc.w2 = -10;
  enc.w4 = 10;
  car.SetMotorEnc(enc);
  car.ForwardKinematics();
  
  ros::shutdown();
  return 0;
}
