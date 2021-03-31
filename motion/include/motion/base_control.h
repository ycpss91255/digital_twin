#ifndef BaseControl_H
#define BaseControl_H
/*******************************
 * Include system header
 ******************************/
#include <cstdio>
#include <iostream>
/*******************************
 ** Include header files
 ******************************/
#include "motion/motor_data.h"
/*******************************
 * Define
 ******************************/
#define DEBUG

class BaseControl {
 public:
  BaseControl();
  ~BaseControl();

 public:
  // variable
  RobotSpeed MotorSpeed;
  RobotCommand MotorCoor;
  RobotSpeed MotorCurr;

  // function
  void SetRobotRadius(double);
  void SetMotorEnc(RobotSpeed);
  void ForwardKinematics();
  void InverseKinematics(RobotCommand);

 private:
  // variable
  double RobotRadius = 0.0955;

  // function
};

#endif  // BaseControl_H
