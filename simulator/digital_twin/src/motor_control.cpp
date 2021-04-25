#include "digital_twin/motor_control.h"

MotorControl::MotorControl() {}

// MotorControl::~MotorControl() {}

void MotorControl::PosControl(float target, float current, float Kp, float Kd) {
  // XXX : fuck !!!!

  float error = target - current;
  float derivative = error - previous_error;
  this->output = Kp * error + Kd * derivative;
  previous_error = error;

  float if_output = abs(this->output);
  this->output = (if_output < (MIN_MOTOR_RPM)) ? 0
                 : (if_output >= (MAX_MOTOR_RPM))
                     ? MAX_MOTOR_RPM / MotorEncSum * (2 * M_PI)
                     : if_output / MotorEncSum * (2 * M_PI);
  // printf("error = %f, derivative = %f, output = %f\n", error, derivative,
  //        this->output);
  this->output = (error <= 0) ? (-this->output) : this->output;
}

float MotorControl::getOutput() { return this->output; }
