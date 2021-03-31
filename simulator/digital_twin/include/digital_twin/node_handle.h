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
#define wheel1_cmd_topic_name "omwr/wheel1/command"
#define wheel2_cmd_topic_name "omwr/wheel2/command"
#define wheel3_cmd_topic_name "omwr/wheel3/command"
#define wheel4_cmd_topic_name "omwr/wheel4/command"

#define wheel_pos

// #define DEBUG

class SimNodeHandle {
 public:
  SimNodeHandle(int, char**, std::string);
  ~SimNodeHandle();

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
