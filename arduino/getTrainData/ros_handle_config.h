#ifndef ROS_HANDLE_CONFIG_H
#define ROS_HANDLE_CONFIG_H

#include <ros.h>
#include <std_msgs/Float32.h>

ros::NodeHandle nh;

std_msgs::Float32 CmdV_msg;
ros::Publisher MotorCmdV_pub("/real/robot/wheel1/motorCmdV", &CmdV_msg);

#endif  // ROS_HANDLE_CONFIG_H
