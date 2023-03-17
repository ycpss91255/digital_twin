/*******************************
 ** Include system header files
 ******************************/
#include <stdio.h>

#include <cstdio>
#include <iostream>
/*******************************
 * Include ROS header files
 ******************************/
#include "ros/ros.h"
#include <message_filters/subscriber.h>
#include <message_filters/time_synchronizer.h>
/*******************************
 * Define
 ******************************/
// #define DEBUG
/*******************************
 * Base param
 ******************************/

int main(int argc, char **argv) {
//   ParamHandle(argc, argv);

//   SimNodeHandle Node(argc, argv, RobotName, WheelNum);
//   MotorControl Motor;
//   ros::Rate loop_rate(10);
//   float initpos = Node.getInitPos();
//   while (ros::ok()) {
//     // change to enc
//     float enc = Node.getMotorPos();
//     float renc = Node.getRealMotorPos();
//     // printf("renc = %f, enc = %f\n", renc + initpos, enc);

//     Node.pub_MotorFB(enc);

//     Motor.PosControl((renc + initpos), enc, 3.5, 0.5);
//     // Motor.PosControl(-100, enc, 3.5, 0.5);
//     float output = Motor.getOutput();
//     Node.pub_MotorCmd(output);

//     // printf("motor Pos = %f %f\n", output, enc);

//     ros::spinOnce();
//     loop_rate.sleep();
//   }
//   Node.pub_MotorCmd(0);
  return 0;
}
