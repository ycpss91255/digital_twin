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
#include "geometry_msgs/Twist.h"
#include "ros/ros.h"
/*******************************
 ** Include header files
 ******************************/
#include "motion/MotorData.h"
#include "motion/motor_data.h"
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
  RobotCommand MotionCmd;
  RobotSpeed MotorEnc;

  // function
  void pub_MotorEnc(RobotSpeed);
  void pub_MotorSpeed(RobotSpeed);

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
