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




extern void MotorDriverInit(sMotor_s *sMotor); /* initial motor driver */

void InitSystem(sNios_s *sNios){
    /* initial Nios parameter*/
    sNios->cFlagHostDataIn = 0;
    sNios->cFlagPackDataToHost = 0;
    sNios->cFlagUnpackHostComplete = 0;
    sNios->ucLedError = 0;
    sNios->ucLedNiosLife = 0;
    sNios->ucLedRcvHostPackage = 0;
    sNios->uiRecvHostPackageTimeCnt = 0;


    /* init motor fifo */
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



void testtest( void ){
    int i;
//    int *stdout_p;

    i=100;
    LOGD("TEst %d", i);
//    stdout_p = stdout;
//    stdout = gc_debug_buf;
//    printf(" 1 2 3 4 5");
//    stdout = stdout_p;
    printf("%s", gc_debug_buf);

//    while(1);
    gi_debug_buf_idx=0;
//    while(1);
    for(i=0;i<10;i++){
        LOGD("Number %d\n", i);
//        gi_debug_buf_idx += LOGD("Number %d\n", i);
    }
    printf("Leng1=%d\n", gi_debug_buf_idx);
    //Printf("%s", gc_debug_buf); gi_debug_buf_idx=0;
    LOGD("second.\n"); gi_debug_buf_idx=0;
    for(i=11;i<20;i++){
        LOGD("N %d\n", i);
//        gi_debug_buf_idx += LOGD("N %d", i);
    }
    printf("%s", gc_debug_buf);
    printf("Leng2=%d\n", gi_debug_buf_idx);

    while(1){
        ShowDebugMesspage();
    }

    while(1);
    log_set_level(1,1); /* set mode & level */
    while(1){
        log_p(1,1, "Start..\n");
    }
}


int main()
{

    int i;
    sNios_s sNios;      /* declare sMotor structure variable */

//    testtest();

    SelfCircleRunTest(&sNios);      /* Test motor & driver etc.*/
    InitSystem(&sNios);             /* initial system */
    sNios.sTimer0.sNios_p = &sNios; /* store sNios address */

    LOGD("Start..\n");

    while(1){
    /* main loop:
     * 1.作給HOST封包的打包.
     * 2.傳輸封包給HOST.
     * 3. */

        PackUartDataToHost(&sNios); /* pack Nios data to Host*/
        UartTxbufProcess(&sNios);   /* send txbuf to host via UART0 */
        UartRxbufProcess(&sNios);   /* receive host data to rxbuf via UART0 */

//        ReadIMU(&sNios.sIMU);
//        LOGD("X=%d, Y=%d, Z=%d\n", sNios.sIMU.iAccX, sNios.sIMU.iAccY, sNios.sIMU.iAccZ);
        ShowStatusLed(&sNios);
        ShowDebugMesspage();
    }

  return 0;
}
