#include "digital_twin/motor_control.h"

MotorControl::MotorControl() {}

MotorControl::~MotorControl() {}

void MotorControl::init() {}

void MotorControl::PosControl(float target, float Kp, float Kd) {
  // TODO : wait DONE
  float error = target - Pos;
  float derivative = error - previous_error;
  float output = Kp * error + Kd * derivative;
  previous_error = error;
  bool dir = (output <= 0) ? 0 : 1;

  Cmd.DIR = dir;
  ens = abs(ens);
  Cmd.PWM = (ens < 125)     ? 0
            : (ens >= 1250) ? 255
                            : round(ens / 4.902);  // 1250(ens) to 255(gpio max)

  gpio_write(pi, Pin.DIR, Cmd.DIR);
  set_PWM_dutycycle(pi, Pin.PWM, Cmd.PWM);
}
