#include "motion/base_control.h"

BaseControl::BaseControl(double RobotRadius) {
  this->RobotRadius = RobotRadius;
}
BaseControl::~BaseControl() {}

void BaseControl::ForwardKinematics() {
  Target[0] = 0.5 * (RobotV[3] - RobotV[1]);
  Target[1] = 0.5 * (RobotV[0] - RobotV[2]);
  Target[2] =
      (RobotV[0] + RobotV[1] + RobotV[2] + RobotV[3]) / (4 * this->RobotRadius);

#ifdef DEBUG
  printf("ForwardKinematics\ninput :\n");
  printf("v0 = %.2f, v1 = %.2f, v2 = %.2f\n", RobotV[0], RobotV[1], RobotV[2]);
  printf("Output :\n");
  printf("x = %.2f, y = %.2f, yaw = %.2f\n",Target[0], Target[1], Target[2]);
#endif
}

void BaseControl::InverseKinematics() {
  RobotV[0] = Target[1] + this->RobotRadius * Target[2];
  RobotV[1] = -Target[0] + this->RobotRadius * Target[2];
  RobotV[2] = Target[1] + this->RobotRadius * Target[2];
  RobotV[1] = Target[0] + this->RobotRadius * Target[2];

#ifdef DEBUG
  printf("ForwardKinematics\nInput :\n");
  printf("x = %.2f, y = %.2f, yaw = %.2f\n",Target[0], Target[1], Target[2]);
  printf("Output :\n");
  printf("v0 = %.2f, v1 = %.2f, v2 = %.2f\n", RobotV[0], RobotV[1], RobotV[2]);

#endif
}

// void BaseControl ::ForwardKinematics() {

// }
