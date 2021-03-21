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
  std::cout << "ForwardKinematics" << std::endl
            << "input :" << std::endl
            << "v0 :" << RobotV[0] << " v1 :" << RobotV[1]
            << " v2 :" << RobotV[2] << " v3 :" << RobotV[3] << std::endl
            << "output :" << std::endl
            << " x :" << Target[0] << " y :" << Target[1]
            << " yaw :" << Target[2] << std::endl;
#endif
}

void BaseControl::InverseKinematics() {
  RobotV[0] = Target[1] + this->RobotRadius * Target[2];
  RobotV[1] = -Target[0] + this->RobotRadius * Target[2];
  RobotV[2] = Target[1] + this->RobotRadius * Target[2];
  RobotV[1] = Target[0] + this->RobotRadius * Target[2];

#ifdef DEBUG
  std::cout << "InverseKinematics" << std::endl
            << "input :" << std::endl
            << " x :" << Target[0] << " y :" << Target[1]
            << " yaw :" << Target[2] << std::endl
            << "output :" << std::endl
            << "v0 :" << RobotV[0] << " v1 :" << RobotV[1]
            << " v2 :" << RobotV[2] << " v3 :" << RobotV[3] << std::endl;
#endif
}

// void BaseControl ::ForwardKinematics() {

// }
