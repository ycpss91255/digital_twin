#ifndef BaseControl_H
#define BaseControl_H
/*******************************
 * Include system header
 ******************************/
#include <cstdio>
#include <iostream>
// #include <iomanip>
/*******************************
 * Include header
 ******************************/
// #include <geometry_msgs/Twist.h>
/*******************************
 * Define
 ******************************/
// #define DEBUG

class BaseControl {
public:
  BaseControl(double RobotRadius);
  ~BaseControl();

  // function
public:
  void ForwardKinematics();
  void InverseKinematics();

  // TODO:three wheel kinematics
  // void ForwardKinematics();
  // void InverseKinematics();

private:
  // const float

  // variable
public:
  // geometry_msgs::Twist p;

  // x,y,yaw
  double Target[3];
  // wheel speed
  double RobotV[4];

private:
  double RobotRadius;
};

#endif // BaseControl_H
