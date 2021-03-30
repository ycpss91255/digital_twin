#ifndef MOTOR_DATA_H
#define MOTOR_DATA_H
typedef struct {
  double x;
  double y;
  double yaw;
} RobotCommand;

typedef struct {
  double w1;
  double w2;
  double w3;
  double w4;
} RobotSpeed;

#endif // MOTOR_DATA_H
