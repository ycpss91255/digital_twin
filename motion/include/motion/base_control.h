#ifndef BaseControl_H
#define BaseControl_H

#include <cstdio>
#include <iostream>

#include <geometry_msgs/Twist.h>

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
  // x,y,yaw
  geometry_msgs::Twist p;
  double Target[3];
  // wheel speed
  double RobotV[4];

private:
  double RobotRadius;
};

#endif // BaseControl_H
