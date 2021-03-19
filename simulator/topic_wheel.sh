#!/bin/bash

 rostopic pub -1 /omwr/wheel_joint_1/command std_msgs/Float64 "data: -100.0"
 rostopic pub -1 /omwr/wheel_joint_3/command std_msgs/Float64 "data: 100.0" 
