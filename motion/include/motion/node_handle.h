#ifndef NodeHandle_H
#define NodeHandle_H
/*******************************
 * Include system header
 ******************************/
#include <cstdio>
#include <iostream>
/*******************************
 * Include ROS
 ******************************/
#include "ros/ros.h"
// #include <geometry_msgs/Twist.h>

/*******************************
 * Define
 ******************************/
#define topic_name
// #define DEBUG

class MotionNodeHandle {
public:
  MotionNodeHandle(int, char **);
  ~MotionNodeHandle();

  // function
public:
private:
  // variable
public:
private:
  double RobotRadius;
};

#endif // NodeHandle_H
