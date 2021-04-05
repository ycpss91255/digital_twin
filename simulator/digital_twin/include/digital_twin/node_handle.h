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
#include "std_msgs/Float64.h"
#include "geometry_msgs/Twist.h"
#include "sensor_msgs/JointState.h"
#include "motion/FourMotorStates.h"
/*******************************
 ** Include header files
 ******************************/
#include "digital_twin/robot_states.h"
/*******************************
 * Define
 ******************************/
#define motor_speed_topic_name "motion/motor_speed"

#define wheel1_cmd_topic_name "digital_twin/robot/wheel1/command"
#define wheel2_cmd_topic_name "digital_twin/robot/wheel2/command"
#define wheel3_cmd_topic_name "digital_twin/robot/wheel3/command"
#define wheel4_cmd_topic_name "digital_twin/robot/wheel4/command"

#define wheel_pos_topic_name "digital_twin/robot/joint_states"

// #define wheel4_cmd_topic_name "digital_twin/robot/"
// #define motion_topic_name "motion/cmd_val"
// #define motor_enc_topic_name "motion/motor_enc"

// #define DEBUG

class SimNodeHandle {
 public:
  SimNodeHandle(int, char**, std::string);
  ~SimNodeHandle();

 public:
  // variable
  // motion::FourMotorStates MotorCmd;
  // motion::FourMotorStates MotorEnc;

  // function
  void pub_MotorSpeed(motion::FourMotorStates);
  void pub_MotorPos(motion::FourMotorStates);

 private:
  // variable
  ros::NodeHandle* n;

  ros::Subscriber MotorSpeed_sub;

  ros::Publisher WheelCmd1_pub;
  ros::Publisher WheelCmd2_pub;
  ros::Publisher WheelCmd3_pub;
  ros::Publisher WheelCmd4_pub;

  ros::Subscriber MotorPos_sub;
  ros::Publisher MotorPos_pub;

  // function
  void init();
  void MotorSpeedBack(const motion::FourMotorStates::ConstPtr &);
  void MotorPosBack(const sensor_msgs::JointState::ConstPtr &);
};

#endif  // NodeHandle_H
