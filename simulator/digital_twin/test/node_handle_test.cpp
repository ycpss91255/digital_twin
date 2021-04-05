/*******************************
 * Include system header
 ******************************/
#include <cstdio>
#include <iostream>
/*******************************
 * Include ROS header files
 ******************************/
#include "ros/ros.h"
/*******************************
 ** Include header files
 ******************************/
#include "digital_twin/node_handle.h"



int main(int argc, char **argv) {
  SimNodeHandle Node(argc, argv,"digital_twin");
  ros::Rate loop_rate(1000);
  while (ros::ok()) {

    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}
