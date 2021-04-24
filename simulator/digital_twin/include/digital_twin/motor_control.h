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
#define MotorEncSum 102.8
class MotorControl {
 public:
  MotorControl();
  // ~MotorControl();

 public:
  // variable

  // function
  void PosControl(float, float, float, float);
  float getOutput();
  float getEnc();
 private:
  // variable
  float previous_error = 0;
  float output = 0;
  float enc = 0;
  // function
  float enc2m(float);
  float m2enc(float);
};

#endif  // MotorControl_H
