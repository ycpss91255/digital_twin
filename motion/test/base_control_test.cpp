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

using namespace std;

int main(int argc, char **argv) {
  BaseControl car;
  // car.SetRobotRadius(0.0955);
  ros::init(argc, argv, "base_control_test");
  ros::NodeHandle nh;
  //   ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME,ros::console::levels::Debug);
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
