/*
 * uart.h
 *
 *  Created on: 2021/6/2
 *      Author: lishyhan
 */

#ifndef CONTROLLER_H_
#define CONTROLLER_H_
/* nios2 system library */
#include <system.h>
#include <sys/alt_irq.h>
#include <priv/alt_legacy_irq.h> /* define alt_irq_register() */
#include <stdio.h>
#include <io.h>

#define  PwmMaxDuty      100
#define  PwmMinDuty      0

#define  fMaxSensorValue 152

#define  PID_Kp     0.5
#define  PID_Ki     0.25
#define  PID_Kd     0.25
#define  PID_OutX   10.0    /* output scale factor */
#define  PID_Spd_posN  1  /* PID control choice: 1 for speed, 0 for position */

/* uart structure variable */
typedef struct {
/*    PID digital controller formula:
         yo(kT) = KpE(kT) +Ki(sigma{j=0}{k}E(jT))+Kd[E(kT)-E((k-1)T)])
*/

     /* Host command */
    unsigned int uiSpdCntCmd;   /* host speed counter command */

    /* PID control parameter */
     float   fRefCom;            /* Reference command */
     float   fKp,       /* PID proportion parameter (it is a positive value )*/
             fKi,       /* integral parameter (it is a positive value )*/
             fKd;       /* PID differential parameters (it is a positive value )*/

     /* calculate value */
     float   fErrT;              /* Error(t) = fRefCom - FeedbackSensor */
     float   fErrLastTime;       /* Error(t-1) -> Last moment Error */
     float   fDeltaErr;          /* Delta_Error = Error(t) - Error(t-1) */
     float   fIntegralErr;       /* Integral Error = summation all Error(0) to Error(t) */
     unsigned int  uiControlTime;       /* control time*/

     char    cSpd_posN;          /* 1: speed control, 0: position control*/

     /* Speed control: calculate delta_u(k) */

     /* position control: calculate u(k) */


     /*export command*/
     float   fDeltaCmd;          /* Delta Command for Speed controller*/
     int     iCtrlOutCmd;        /* Controller export command */
} sPIDCtrl_s;


#endif /* CONTROLLER_H_ */
