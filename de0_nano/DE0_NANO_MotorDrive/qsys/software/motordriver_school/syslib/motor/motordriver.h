/*
 * motordriver.h
 *
 *-------------------------------------------
 *    date    |   author    |  ver. | comment
 *  2021.5.6  | Shih-An Li  |  0.1  | initial
 *  2021.5.20 | Shih-An Li  |  2.0  | 有加入Fifo的硬體及軟體判斷
 *-------------------------------------------
 */

#ifndef MOTORDRIVER_H_
#define MOTORDRIVER_H_
/* nios2 system library */
#include <system.h>
#include <stdio.h>
#include <io.h>
#include <unistd.h>
#include "..\debug.h"
/* motor parameter file */

#define TRIGGER 1<<31 /* give trigger */

typedef struct {
    unsigned int  uiMotorFBDir;      /* motor feedback direction, 0:CW, 1: CCW */
    unsigned int  uiMotorDirCmd;     /* motor direction command , 0:CW, 1: CCW */
    unsigned char ucMotorPWM;        /* motor PWM duty ,0~100 */
    unsigned int  uiMotorFBSpeed;    /* motor feedback speeed0 */
             int  iMotorFBEncoder;   /* motor Encoder accumulate value */
    unsigned int  uiVoltage;         /* motor voltage */
    unsigned int  uiCurrent;         /* motor current */

    /* Host send to Nios command */

    unsigned int  uiHostMotorSpdCmd;	 /* host send to motor speed command, form uart package */
    unsigned int  uiHostMotorDirCmd;	 /* host send to motor direction command, form uart package */

    /* for get average speed and send back to host */
    unsigned int  uiMotorFBSpeedAcc;    /* feedback Speed accumulate */
    unsigned int  uiMotorFBSpeedAccCnt; /* feedback Speed accumulate counter*/

    unsigned int  uiMotorFBVoltageAcc;    /* feedback Voltage accumulate */
    unsigned int  uiMotorFBVoltageAccCnt; /* feedback Voltage accumulate counter*/

    unsigned int  uiMotorFBCurrentAcc;    /* feedback Current accumulate */
    unsigned int  uiMotorFBCurrentAccCnt; /* feedback Current accumulate counter*/


}sMotorPara_s;


/* motor driver register structure variable */
typedef struct {
	unsigned char ucEnPID;  /* PID controller enable */
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

#endif /* MOTORDRIVER_H_ */
