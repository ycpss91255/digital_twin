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
#include "motion/FourMotorStates.h"
#include "sensor_msgs/JointState.h"
#include "std_msgs/Float64.h"
/*******************************
 ** Include header files
 ******************************/
#include "digital_twin/robot_states.h"
/*******************************
 * Define
 ******************************/
// #define DEBUG

class MotorControl {
 public:
  MotorControl();
  ~MotorControl();

 public:
  // variable
  float MotorPos = 0;
  // function

 private:
  // variable

  // function
  void init();
};

#endif  // MotorControl_H
