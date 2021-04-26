/*******************************
 ** Include system header files
 ******************************/
#include <stdio.h>

#include <cstdio>
#include <iostream>
/*******************************
 * Include ROS header files
 ******************************/
#include "digital_twin/motor_control.h"
#include "digital_twin/node_handle.h"
#include "ros/ros.h"
/*******************************
 * Define
 ******************************/
// #define ADJUST
// #define DEBUG
/*******************************
 * Base param
 ******************************/
std::string RobotName;
uint64_t WheelNum;
bool Mode;

void usage();
void ParamHandle(int, char **);

int main(int argc, char **argv) {
  ParamHandle(argc, argv);

  SimNodeHandle Node(argc, argv, RobotName, WheelNum);
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

void usage() {
  fprintf(stderr,
          "\n"
          "Usage : motor_control [options] ...\n"
          "   -r string, robot name\n"
          "   -n value, wheel num\n"
          "   -m boolean, 0 : PosControl Mode, 1 : FeedBack Mode\n");
}

void ParamHandle(int argc, char **argv) {
  if (argc != 9)
    usage();
  else {
    int opt;
    while ((opt = getopt(argc, argv, "r:n:m:")) != -1) switch (opt) {
        case 'r':
          RobotName.assign(optarg);
          break;

        case 'n':
          WheelNum = strtol(optarg, NULL, 0);
          break;

        case 'm':
          Mode = strtol(optarg, NULL, 0);
          break;

        default:
          usage();
          exit(EXIT_FAILURE);
      }
  }
}
