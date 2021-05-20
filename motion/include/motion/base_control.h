  #ifndef BaseControl_H
#define BaseControl_H
/*******************************
 * Include system header
 ******************************/
#include <cstdio>
#include <iostream>
/*******************************
 ** Include msg header files
 ******************************/
#include "geometry_msgs/Twist.h"
#include "motion/FourMotorStates.h"
/*******************************
 * Define
 ******************************/
// #define DEBUG

class BaseControl {
 public:
  BaseControl();
  ~BaseControl();

 public:
  // variable
  motion::FourMotorStates MotorSpeed;
  geometry_msgs::Twist MotorCoor;
  motion::FourMotorStates MotorCurr;

  // function
  void SetRobotRadius(double);
  void SetMotorEnc(motion::FourMotorStates);
  void ForwardKinematics();
  void InverseKinematics(geometry_msgs::Twist);

 private:
  // variable
  double RobotRadius = 0.0955;

  // function
};

#endif  // BaseControl_H
