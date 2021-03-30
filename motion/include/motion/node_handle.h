#ifndef NodeHandle_H
#define NodeHandle_H
/*******************************
 * Include system header
 ******************************/
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
#include "motion/base_control.h"
#include "motion/motor_data.h"
/*******************************
 * Define
 ******************************/
#define motion_topic_name "motion/cmd_val"
#define motor_enc_topic_name "motion/motor_enc"

// #define DEBUG

class MotionNodeHandle {
 public:
  MotionNodeHandle(int, char**);
  ~MotionNodeHandle();

 public:
  // variable
  RobotCommand MotionCmd;
  RobotSpeed MotorEnc;

  // function

 private:
  // variable
  ros::NodeHandle* n;
  ros::Publisher MotorEnc_pub;
  ros::Subscriber CmdVal_sub;

  // function
  void pub_MotorEnc();
  void CmdVelBack(const geometry_msgs::Twist::ConstPtr&);
};

#endif  // NodeHandle_H
