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
}

void BaseControl::InverseKinematics() {
  RobotV[0] = Target[1] + this->RobotRadius * Target[2];
  RobotV[1] = -Target[0] + this->RobotRadius * Target[2];
  RobotV[2] = Target[1] + this->RobotRadius * Target[2];
  RobotV[1] = Target[0] + this->RobotRadius * Target[2];
}

// void BaseControl ::ForwardKinematics() {

// }
