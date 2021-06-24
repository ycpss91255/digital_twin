#ifndef NodeHandle_H
#define NodeHandle_H
/*******************************
 * Include system header files
 ******************************/
#include <cstdio>
#include <iostream>
#include <string>
#include <vector>
/*******************************
 * Include ROS header fi3les
 ******************************/
#include "ros/ros.h"
/*******************************
 ** Include msg header files
 ******************************/
#include "motion/FourMotorCmd.h"
#include "motion/IMU.h"
#include "motion/MotorStates.h"
/*******************************
 * Include header files
 ******************************/
#include "motion/parameter.h"
/*******************************
 * Define
 ******************************/
#define TX_MODE 0
#define RX_MODE 1
// #define DEBUG
using namespace std;
class SerialNodeHandle {
 public:
  SerialNodeHandle(int, char**, std::string, bool);
  ~SerialNodeHandle();
  /*******************************
   ** Variable
   ******************************/
 public:
  motion::FourMotorCmd Cmd;

 private:
  ros::NodeHandle* n;
  // ROS publisher
  vector<ros::Publisher> MotorState_pub;
  ros::Publisher IMU_State_pub;
  // ROS subscriber
  ros::Subscriber MotorSpeed_sub;
  // Temp Data
  vector<float> MotorCmd;

  /*******************************
   ** Function
   ******************************/
 public:
  // ROS publisher function
  void pub_IMU_State(motion::IMU);
  void pub_MotorState(int, motion::MotorStates);
  // ROS subscriber function
  void sub_MotorSpeed(motion::FourMotorCmd);
  // get functions
  vector<float> get_MotorCmd();

 private:
  void ROS_init(bool);
  void Data_init();
  // ROS subscriber function
  void sub_MotorSpeed(const motion::FourMotorCmd::ConstPtr&);
};

#endif  // NodeHandle_H
