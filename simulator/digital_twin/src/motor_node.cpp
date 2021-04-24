#include <cstdio>
#include <iostream>

#include "digital_twin/motor_control.h"
#include "digital_twin/node_handle.h"
#include "ros/ros.h"

int main(int argc, char **argv) {
  SimNodeHandle Node(argc, argv, "digital/robot", 1);
  MotorControl Motor;
  // ros::Rate loop_rate(10);
  // REVIEW : all code
  while (ros::ok()) {
    Motor.PosControl(Node.RealMotorFB, Node.MotorPos, 20, 0);
    float output = Motor.getOutput();
    Node.pub_MotorCmd(output);
    float enc = Motor.getEnc();
    Node.pub_MotorFB(enc);

    // printf("motor Pos = %f %f\n", output, enc);

    ros::spinOnce();
    // loop_rate.sleep();
  }
  Node.pub_MotorCmd(0);
  return 0;
}
