/*
 * nios.h
 *
 *  Created on: 2021/5/11
 *      Author: Iclab
 */

#ifndef NIOS_H_
#define NIOS_H_

/* system library */
#include <stdio.h>  /* standard IO head file  */
#include <system.h> /* Nios system parameter head file */
#include <unistd.h> /* Unix Standard head file*/
#include <io.h>     /* IO function, (IORD, IOWR,...)*/


/* motor relate header file */
#include ".\syslib\wheel.h"
#include ".\syslib\motor.h"

#include ".\syslib\motor\motordriver.h"	/* motor library */
#include ".\syslib\uart\uart.h"			/* uart library */
#include ".\syslib\timer\timer.h"		/* timer library */
#include ".\syslib\IMU\imu.h"			/* IMU library */

/* choice controller */
#include ".\syslib\controller\controller.h"

/**/
//#define UART_TX_Test 0 /* test UAR tx function */
#define TimerInterruptTime 0.001    /* set timer interrupt time, and this is time unit  */
#define Thread1TimeUnit 1           /* set execute Thread1 trigger time unit */
#define Thread2TimeUnit 30          /* set execute Thread2 trigger time unit */

/* UART　data package parameters*/
#define UartPackageRXLengthFromHost 13      /* Host to Nios data package length */
#define UartPackageLengthToHost     63      /* Nios to Host data package length */
#define UartPackageFrameHead        0xAA    /* Nios to Host data package Head */
#define UartPackageFrameEnd         0xEE    /* Nios to Host data package End */

/* Controller parameters */
#define HostCmdTimeUnit             30      /* update host command time unit */
#define PIDControlTimeUnit          1       /* set PID control time unit */

typedef struct {
//     unsigned int uiHostCmdTimeUnit;

     sMotor_s sMotor;       /* declare motor structure structure */
     sTimer_s sTimer0;      /* declare timer0 structure structure */
     sUart_s  sUart0;       /* declare Uart0 structure structure */
     sIMU_s   sIMU;         /* declare IMU structure */
     sPIDCtrl_s  sPID_MA,      /* declare Motor A PID controller structure */
                 sPID_MB,      /* declare Motor B PID controller structure */
                 sPID_MC,      /* declare Motor C PID controller structure */
                 sPID_MD;      /* declare Motor D PID controller structure */

}sNios_s;


    /* 宣告以下函數為 extern */
            extern void NiosProcessMain(sNios_s *sNios); /* nios main process */
            extern void PackUartDataToHost(sNios_s *sNios);

        /* Choice control method */
            extern  void PIDinit(sPIDCtrl_s *sCtrl, unsigned int uiCtrlTimeUnit);
            extern  void PIDctrl(sPIDCtrl_s *sCtrl, float fSensorValue);

        /* timer function */
            extern void ReadIMU(sIMU_s *sIMU);

        /* timer function */
            extern void TimerISRInitial(sTimer_s *sTimer, float fIntTime ); /* in timer.c */
        /* UART function */
            extern void UartISRInitial(sUart_s *sUart); /* in uart.c */
        /* motor function */
            extern void Send4XwheelPwm(sMotor_s *sMotor, unsigned int PWM1, unsigned int PWM2,  \
                               unsigned int PWM3, unsigned int PWM4);  /* send 4 wheel pwm */
            extern void Send4XwheelDir(sMotor_s *sMotor, unsigned int uiWheelDir1, unsigned int uiWheelDir2, \
                               unsigned int uiWheelDir3, unsigned int uiWheelDir4); /* send 4 wheel direction  */
            extern void Send2XMotorDriverEnable(sMotor_s *sMotor, unsigned int uiDriver1, unsigned int uiDriver2);  /* send motor driver enable */
            extern void Send4XClrMotorEncoder(sMotor_s *sMotor, unsigned int uiME1, unsigned int uiME2, \
                                     unsigned int uiME3, unsigned int uiME4); /* send clear command for 4 wheel encoder counter */
            /* read motor sensor */
            extern void Read4XMotorDir(sMotor_s *sMotor);    /* read motor direction */
            extern void Read4XMotorEncoder(sMotor_s *sMotor);/* read motor feedback encoder */
            extern void Read4XMotorSpeed(sMotor_s *sMotor);  /* read motor speed */
            extern void Read4XMotorSensor(sMotor_s *sMotor); /* read motor voltage and current */
            extern void MotorTestFun(sMotor_s *sMotor );     /* test motor fundamental function. */




#endif /* NIOS_H_ */
