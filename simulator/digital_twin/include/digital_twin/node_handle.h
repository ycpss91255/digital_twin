#ifndef NodeHandle_H
#define NodeHandle_H
/*******************************
 * Include system header
 ******************************/
#include <stdint.h>
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
#include "motion/FourMotorCmd.h"
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
using namespace std;
// TODO: wait reset
class SimNodeHandle {
 public:
  SimNodeHandle(int, char **, string, uint64_t);
  ~SimNodeHandle();

 public:
  // variable
  // function
  void pub_MotorCmd(float);
  void pub_MotorFB(float);
  float getMotorPos();
  float getInitPos();
  float getRealMotorPos();

 private:
  // variable
  ros::NodeHandle *n;
  ros::Publisher MotorCmd_pub;
  ros::Publisher MotorFB_pub;
  ros::Subscriber MotorState_sub;
  string MotorNS;
  uint64_t MotorNum;

  ros::Subscriber RealMotorFB_sub;

  float InitPos = 0;
  float MotorPos = 0;
  float RealMotorPos = 0;
  // function
  void init(string);
  void MotorStateBack(const sensor_msgs::JointState::ConstPtr &);
  void RealMotorFBBack(const std_msgs::Float64::ConstPtr &);
};

#endif  // NodeHandle_H
