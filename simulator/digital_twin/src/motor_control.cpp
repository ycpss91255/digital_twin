#include "digital_twin/motor_control.h"

MotorControl::MotorControl() {}

// MotorControl::~MotorControl() {}

float MotorControl::enc2m(float target) {
  return (target / MotorEncSum * (2 * M_PI));
}

float MotorControl::m2enc(float target) {
  return (target / (2 * M_PI) * MotorEncSum);
}

void MotorControl::PosControl(float target, float current, float Kp, float Kd) {
  // target = enc2m(target);
  current = m2enc(current);

  float error = target - current;
  float derivative = error - previous_error;
  this->output = Kp * error + Kd * derivative;
  previous_error = error;
  float if_output = abs(output);
  this->output = (if_output < (MIN_MOTOR_RPM))    ? 0
                 : (if_output >= (MAX_MOTOR_RPM)) ? MAX_MOTOR_RPM
                                                  : if_output;
  this->output = (error <= 0) ? -this->output : this->output;
  this->output = output / MotorEncSum * (2 * M_PI);
}

float MotorControl::getOutput() { return this->output; }
float MotorControl::getEnc() { return this->enc; }
