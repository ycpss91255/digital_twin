#ifndef PARAMETER_H
#define PARAMETER_H

#define PUB_MSG_LEN 13
#define PUB_START_PACKET 0xAA
#define PUB_END_PACKET 0xEE

#define PUB_STATUS_ORDER 1              // LEN = 1
#define PUB_MOTOR_DIR_ORDER 2           // LEN = 1
#define PUB_MOTOR_SPEED_ORDER 3         // LEN = 8

#define SUB_START_PACKET 0xAA
#define SUB_END_PACKET 0xEE
#define SUB_MSG_LEN 64

// sub msg buffer order
#define SUB_TIME_STAMP_ORDER 1          // LEN = 3
#define SUB_STATUS_ORDER 4              // LEN = 1
#define SUB_MOTOR_PWM_ORDER 5           // LEN = 4
#define SUB_MOTOR_DIR_ORDER 9           // LEN = 1
#define SUB_MOTOR_ENABLE_ORDER 10       // LEN = 16
#define SUB_MOTOR_SPEED_ORDER 26        // LEN = 8
#define SUB_MOTOR_VOLTAGE_ORDER 34      // LEN = 8
#define SUB_MOTOR_CURRENT_ORDER 42      // LEN = 8
#define SUB_IMU_ACCELEROMETER_ORDER 50  // LEN = 4
#define SUB_IMU_GYROSCOPE_ORDER 54      // LEN = 4
#define SUB_IMU_MAGNETICMETER_ORDER 58  // LEN = 4

#endif  // PARAMETER_H
