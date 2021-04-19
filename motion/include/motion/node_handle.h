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
#include "motion/FourMotorStates.h"
/*******************************
 * Define
 ******************************/
#define motion_topic_name "motion/cmd_val"
#define motor_enc_topic_name "motion/motor_enc"
#define motor_speed_topic_name "motion/motor_speed"

// #define DEBUG

class MotionNodeHandle {
 public:
  MotionNodeHandle(int, char**, std::string);
  ~MotionNodeHandle();

 public:
  // variable
  geometry_msgs::Twist MotionCmd;
  motion::FourMotorStates MotorEnc;

  // function
  void pub_MotorEnc(motion::FourMotorStates);
  void pub_MotorSpeed(motion::FourMotorStates);

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
