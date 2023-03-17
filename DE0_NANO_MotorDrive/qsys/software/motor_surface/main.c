/*
 * file : main.c
 * description: 馬達測試主程式
 *
 *-------------------------------------------
 *    date    |   author    |  ver. | comment
 *  2021.5.6  | Shih-An Li  |  0.1  | initial
 *  2021.5.20 | Shih-An Li  |  2.0  | 有加入Fifo的硬體及軟體判斷
 *  2021.5.25 | Shih-An Li  |  2.1  | 測試UART封包傳輸OK
 *  2021.6.1  | Shih-An Li  |  2.5  | 加入IMU.c測試
 *-------------------------------------------
 */

#include "nios.h"  /* all library file */


#define DEBUG_MESSAGE /* open debug message */

extern void MotorDriverInit(sMotor_s *sMotor); /* initial motor driver */

void InitSystem(sNios_s *sNios){
    /* init fifo */

    MotorDriverInit(&sNios->sMotor); /* initial motor driver */

    /* initial PID controller*/
    PIDinit(&sNios->sPID_MA, PIDControlTimeUnit);
    PIDinit(&sNios->sPID_MB, PIDControlTimeUnit);
    PIDinit(&sNios->sPID_MC, PIDControlTimeUnit);
    PIDinit(&sNios->sPID_MD, PIDControlTimeUnit);


    /* final initial */
        /* initial Uart0 */
        UartISRInitial(&sNios->sUart0);
        /* initial timer0 */
        TimerISRInitial(&sNios->sTimer0, TimerInterruptTime); /* timer initial, in timer.c */


    IOWR(SYSREG_BASE,3,0x80000000);  /* clear all fifo */
    IOWR(SYSREG_BASE,3,0x00000000);  /* clear all fisfo */
}


int main()
{
    sNios_s sNios;      /* declare sMotor structure variable */
    InitSystem(&sNios); /* initial system */
//    sNios.sTimer0.sNios_p = (unsigned int)(&sNios); /* store sNios address */
    sNios.sTimer0.sNios_p = &sNios; /* store sNios address */
    printf("Start..\n");
    while(1){

//        MotorTestFun(&sNios.sMotor);    /* Test motor function */
        PackUartDataToHost(&sNios);     /* pack uart data */
//        NiosProcessMain(&sNios);        /* Test Nios send back to host */
//        ReadIMU(&sNios.sIMU);           /* read IMU */
//        usleep(10000);
//        if(sNios.sMotor.sMotorAp.uiMotorFBSpeed != 0xdeadbeef)
//            printf("SPD=%d, PWM=%d.\n", sNios.sMotor.sMotorAp.uiMotorFBSpeed,  sNios.sMotor.sMotorAp.ucMotorPWM);

    }

  return 0;
}
