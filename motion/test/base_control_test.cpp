

#include "motion/base_control.h"

// #include <ros/console.h>

#include "ros/ros.h"

#include <iostream>

using namespace std;

int main(int argc, char **argv) {
  BaseControl car(0.0955);

  ros::init(argc, argv, "talker");
  ros::NodeHandle nh;
  // ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug);

  car.ForwardKinematics();
  // ros::Rate loop_rate(10);

  // while (ros::ok()) {
  //   ROS_INFO("123");

  //   ros::spinOnce();
  //   loop_rate.sleep();
  // }
  return 0;
}
