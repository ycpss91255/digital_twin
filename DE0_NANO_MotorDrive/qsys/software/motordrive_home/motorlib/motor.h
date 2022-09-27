/*
 * motor.h
 *
 *  Created on: 2021/5/11
 *      Author: Shih-An Li
 */

#ifndef MOTOR_H_
#define MOTOR_H_

#define DEBUG_MESSAGE /* open debug message */

#define MotorEncoderOneCycle 483 /* motor encoder one cycle counter */


typedef struct {
    unsigned int  uiMotorFBDir;      /* motor feedback direction, 0:CW, 1: CCW */
    unsigned char ucMotorPWM;        /* motor PWM duty ,0~100 */
    unsigned int  uiMotorFBSpeed;    /* motor feedback speeed0 */
             int  iMotorFBEncoder;   /* motor Encoder accumulate value */
    unsigned int  uiVoltage;         /* motor voltage */
    unsigned int  uiCurrent;         /* motor current */

}sMotorPara_s;


/* motor driver register structure variable */
typedef struct {
    unsigned int uiR00MotorPWMduty, /* motor pwm duty X4
                                        [6:0]: Right Motor PWM 0~100
                                        [13:7]: Bottom Motor PWM 0~100
                                        [20:14]: Left Motor PWM 0~100
                                        [27:21]: Top Motor PWM 0~100
                                        [31]   : pwm duty dval trigger
//                                  */
                 uiR01MotorDriverDirection, /* export to motor driver  direction control,
                                          [1:0]: Right
                                          [3:2]: Bottom
                                          [5:4]: Left
                                          [7:6]: Top
//                                  */
                 uiR02MotorFBDir,    /* motor Feedback direction,
                                          [0]: Motor A
                                          [1]: Motor B
                                          [2]: Motor C
                                          [3]: Motor D
//                                   */
                 uiR03MotorControl;   /* clear 4motor accumulate feedback counter,
                                        [0]: clear right motor feedback Accumulate counter
                                        [1]: clear Bottom motor feedback Accumulate counter
                                        [2]: clear Left motor feedback Accumulate counter
                                        [3]: clear Top motor feedback Accumulate counter
                                     */
     sMotorPara_s sMotorAp, /* motor A structure parameters */
                  sMotorBp, /* motor B structure parameters */
                  sMotorCp, /* motor C structure parameters */
                  sMotorDp; /* motor D structure parameters */
} sMotor_s;



#endif /* MOTOR_H_ */
