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
  // function
  void pub_MotorCmd(float);

 private:
  // variable
  ros::NodeHandle* n;
  ros::Publisher MotorCmd_pub;
  ros::Subscriber MotorState_sub;
  int MotorNum;

  // function
  void init(std::string, int);
  void MotorStateBack(const sensor_msgs::JointState::ConstPtr&);
};

#endif  // NodeHandle_H
