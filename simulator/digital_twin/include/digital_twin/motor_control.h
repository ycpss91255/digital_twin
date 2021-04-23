#ifndef MotorControl_H
#define MotorControl_H
/*******************************
 * Include system header
 ******************************/
#include <string.h>

#include <cstdio>
#include <iostream>
/*******************************
 * Include ROS
 ******************************/
#include "ros/ros.h"
/*******************************
 ** Include msg header files
 ******************************/
#include "std_msgs/Float64.h"
/*******************************
 ** Include header files
 ******************************/

/*******************************
 * Define
 ******************************/
// #define DEBUG

#define MAX_MOTOR_RPM 1250
#define MIN_MOTOR_RPM 125
class MotorControl {
 public:
  MotorControl();
  ~MotorControl();

 public:
  // variable
  float Pos = 0;
  // function
  void PosControl(float, float, float);

 private:
  // variable

  // function
  void init();
};

#endif  // MotorControl_H
