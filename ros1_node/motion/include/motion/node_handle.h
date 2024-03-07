#ifndef NodeHandle_H
#define NodeHandle_H
/*******************************
 * Include system header files
 ******************************/
#include <string.h>
#include <cstdio>
#include <iostream>
/*******************************
 * Include ROS header files
 ******************************/
#include "ros/ros.h"
/*******************************
 ** Include msg header files
 ******************************/
#include "geometry_msgs/Twist.h"
#include "motion/FourMotorCmd.h"
/*******************************
 * Include header files
 ******************************/
#include "motion/parameter.h"
/*******************************
 * Define
 ******************************/

// #define DEBUG

class MotionNodeHandle {
 public:
  MotionNodeHandle(int, char**, std::string);
  ~MotionNodeHandle();

 public:
  // variable
  geometry_msgs::Twist MotionCmd;
  motion::FourMotorCmd MotorEnc;

  // function
  void pub_MotorEnc(motion::FourMotorCmd);
  void pub_MotorSpeed(motion::FourMotorCmd);

 private:
  // variable
  ros::NodeHandle* n;
  ros::Publisher MotorEnc_pub;
  ros::Publisher MotorSpeed_pub;
  ros::Subscriber CmdVal_sub;

  // function
  void init();
  void CmdVelBack(const geometry_msgs::Twist::ConstPtr&);
};

#endif  // NodeHandle_H
