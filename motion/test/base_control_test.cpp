#include "motion/base_control.h"
#include "ros/ros.h"

#include <iostream>

using namespace std;

int main(int argc, char ** argv) {
  BaseControl car(0.0955);

  ros::init(argc, argv, "talker");
  ros::NodeHandle nh;
  ros::Rate loop_rate(10);

  while (ros::ok()) {
    ROS_INFO("123");

    ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}
