#ifndef NodeHandle_H
#define NodeHandle_H
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

class SimNodeHandle {
 public:
  SimNodeHandle(int, char**, std::string, int);
  ~SimNodeHandle();

 public:
  // variable
  float MotorPos = 0;
  float RealMotorFB = 0;
  // function
  void pub_MotorCmd(float);
  void pub_MotorFB(float);

 private:
  // variable
  ros::NodeHandle* n;
  ros::Publisher MotorCmd_pub;
  ros::Publisher MotorFB_pub;
// TODO : add real motor command feed back subscriber
  ros::Subscriber MotorState_sub;

  // real motor
  ros::Subscriber RealMotorFB_sub;

  int MotorNum;
  float InitPos = 0;
  // function
  void init(std::string, int);
  void MotorStateBack(const sensor_msgs::JointState::ConstPtr&);
  void MotorFBBack(const std_msgs::Float64::ConstPtr&);
};

#endif  // NodeHandle_H
