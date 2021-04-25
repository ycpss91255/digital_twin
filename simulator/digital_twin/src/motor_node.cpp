#include <cstdio>
#include <iostream>

#include "digital_twin/motor_control.h"
#include "digital_twin/node_handle.h"
#include "ros/ros.h"

int main(int argc, char **argv) {
  SimNodeHandle Node(argc, argv, "/robot", 1);
  MotorControl Motor;
  ros::Rate loop_rate(10);
  float initpos = Node.getInitPos();
  // REVIEW : all code
  while (ros::ok()) {
    // change to enc
    float enc = Node.getMotorPos();
    float renc = Node.getRealMotorPos();
    // printf("renc = %f, enc = %f\n", renc + initpos, enc);

    Node.pub_MotorFB(enc);

    Motor.PosControl((renc + initpos), enc, 3.5, 0.5);
    // Motor.PosControl(-100, enc, 3.5, 0.5);
    float output = Motor.getOutput();
    Node.pub_MotorCmd(output);

    // printf("motor Pos = %f %f\n", output, enc);

    ros::spinOnce();
    loop_rate.sleep();
  }
  Node.pub_MotorCmd(0);
  return 0;
}
