#ifndef BaseControl_H
#define BaseControl_H
/*******************************
 * Include system header
 ******************************/
#include <cstdio>
#include <iostream>
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
