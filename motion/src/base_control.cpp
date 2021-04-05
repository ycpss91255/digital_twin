#include "motion/base_control.h"

BaseControl::BaseControl() {}
BaseControl::~BaseControl() {}

void BaseControl::SetRobotRadius(double Radius) { this->RobotRadius = Radius; }

void BaseControl::SetMotorEnc(motion::FourMotorStates Curr) {
  this->MotorCurr.w1 = Curr.w1;
  this->MotorCurr.w2 = Curr.w2;
  this->MotorCurr.w3 = Curr.w3;
  this->MotorCurr.w4 = Curr.w4;
}

void BaseControl::ForwardKinematics() {
  this->MotorCoor.linear.x = 0.5 * (this->MotorCurr.w4 - this->MotorCurr.w2);
  this->MotorCoor.linear.y = 0.5 * (this->MotorCurr.w1 - this->MotorCurr.w3);
  this->MotorCoor.angular.z = (this->MotorCurr.w1 + this->MotorCurr.w2 +
                               this->MotorCurr.w3 + this->MotorCurr.w4) /
                              (4 * this->RobotRadius);

#ifdef DEBUG
  printf("ForwardKinematics(DEBUG)\ninput :\n");
  printf("w1 = %.2f, w2 = %.2f, w3 = %.2f, w4 = %.2f\n", this->MotorCurr.w1,
         this->MotorCurr.w2, this->MotorCurr.w3, this->MotorCurr.w4);
  printf("Output :\n");
  printf("x = %.2f, y = %.2f, yaw = %.2f\n", this->MotorCoor.linear.x,
         this->MotorCoor.linear.y, this->MotorCoor.angular.z);
#endif
}

void BaseControl::InverseKinematics(geometry_msgs::Twist Cmd) {
  MotorSpeed.w1 = Cmd.linear.y + Cmd.angular.z * this->RobotRadius;
  MotorSpeed.w2 = -Cmd.linear.x + Cmd.angular.z * this->RobotRadius;
  MotorSpeed.w3 = Cmd.linear.y + Cmd.angular.z * this->RobotRadius;
  MotorSpeed.w4 = Cmd.linear.x + Cmd.angular.z * this->RobotRadius;

#ifdef DEBUG
  printf("ForwardKinematics(DEBUG)\nInput :\n");
  printf("x = %.2f, y = %.2f, yaw = %.2f\n", Cmd.linear.x, Cmd.linear.y,
         Cmd.angular.z);
  printf("Output :\n");
  printf("w1 = %.2f, w2 = %.2f, w3 = %.2f, w4 = %.2f\n", MotorSpeed.w1,
         MotorSpeed.w2, MotorSpeed.w3, MotorSpeed.w4);
#endif
}
