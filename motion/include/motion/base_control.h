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
  // RobotCommand MotorCmd;
  RobotSpeed MotorSpeed;
  RobotCommand MotorCoor;
  RobotSpeed MotorCur;

  // function
  void SetRobotRadius(double);
  void SetMotorEnc(RobotSpeed);
  void ForwardKinematics();
  void InverseKinematics(RobotCommand);

 private:
  // variable
  double RobotRadius;

  // function
};

#endif  // BaseControl_H
