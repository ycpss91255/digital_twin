/*******************************
 * Include system header
 ******************************/
#include <cstdio>
#include <iostream>
/*******************************
 * Include ros header
 ******************************/
#include "ros/ros.h"

#include "motion/base_control.h"

using namespace std;

int main(int argc, char **argv) {
  BaseControl car(0.0955);

  ros::init(argc, argv, "talker");
  ros::NodeHandle nh;
  // ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME,
  //                                ros::console::levels::Debug);
  car.RobotV[0] = 10;
  car.RobotV[1] = 0;
  car.RobotV[2] = -10;
  car.RobotV[3] = 0;
  // car.RobotV[0] = 10;
  car.ForwardKinematics();
  printf("ForwardKinematics\nx = %.2f, y = %.2f, yaw = %.2f\n", car.Target[0],
         car.Target[1], car.Target[2]);
  // x
  car.Target[0] = 10;
  // y
  car.Target[1] = 0;
  // yaw
  car.Target[2] = 0;
  car.InverseKinematics();
  printf("InverseKinematics\nv0 = %.2f, v1 = %.2f, v2 = %.2f, v3 = %.2f\n",
         car.RobotV[0], car.RobotV[1], car.RobotV[2], car.RobotV[3]);
  return 0;
}
