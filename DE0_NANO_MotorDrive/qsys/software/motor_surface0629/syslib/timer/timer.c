/*
 * timer.c
 *
 *  Created on: 2021/5/17
 *      Author: lishyhan
 */

#include "Timer.h"



//Enable Timer Interrupt Routine
void DoEnableTimerInterrupt(sTimer_s *sTimer);
void DoDisableTimerInterrupt(sTimer_s *sTimer);
void TimerISRInitial(sTimer_s *sTimer, float fIntTime );
// adjust Freq base on phase
void TimerISR(sTimer_s *sTimer, unsigned int id);

/* extern function */
//extern void TimerISRmain(sMotor_s *sMotor);

//Enable Timer Interrupt Routine
void DoEnableTimerInterrupt(sTimer_s *sTimer)
{
    unsigned int wCLKValue; // interrupt time counter value
    int i;
#ifdef TIMER0_NAME
    LOGD("[MSG][Timer]Find Timer0 and start initial timer0 interrupt.\n");
    LOGD("[MSG][Timer]Interrupt Time = %1.3f (s)\n", sTimer->fInterruptTime);

    wCLKValue = (unsigned int ) (sTimer->uiFREQ * sTimer->fInterruptTime); /* set Interrupt time */

    i = alt_irq_register( sTimer->uiIRQ, sTimer, sTimer->ISRFun_p);
    /* Setting timer interrupt time register */
    IOWR(sTimer->uiBase,2,(short)(wCLKValue & 0x0000ffff)); /* get low 16-bits */
    IOWR(sTimer->uiBase,3,(short)((wCLKValue >> 16) & 0x0000ffff));/* get high 16-bits */

    IOWR(sTimer->uiBase,1,0x07);    /* Set timer running, looping and interrupting */
    IOWR(sTimer->uiBase, 0, 0); /* Clear Timeout flag */
    LOGD("[MSG][Timer]Timer interrupt is activated.\n");
#else
    LOGD("[MSG][Timer]Can't find Timer0 peripheral. \n");
#endif
}

void DoDisableTimerInterrupt(sTimer_s *sTimer)
{
     alt_irq_register(sTimer->uiIRQ, 0, 0); /* disable timer */
     IOWR(sTimer->uiBase, 1, 0); /* Stop Timer Interrupt */
     LOGD("[MSG][Timer]Timer0 interrupt is disabled.\n");
}


void TimerISRInitial(sTimer_s *sTimer, float fIntTime ){
    // initial timer0
    #ifdef TIMER0_NAME
        LOGD("[MSG][Timer]Find Timer0 and start initial timer0 process.\n");
        sTimer->uiBase = TIMER0_BASE;
        sTimer->uiIRQ  = TIMER0_IRQ;
        sTimer->uiFREQ = TIMER0_FREQ;
        sTimer->fInterruptTime = fIntTime;   /* set interrupt time */
        sTimer->uiTICnt = 0;          /* set interrupt time counter */
        sTimer->ucTimeout = 0;        /* clear timeout */
        sTimer->ISRFun_p = TimerISR;  /* set interrupt ISR function */
        DoEnableTimerInterrupt(sTimer);      /* Enable interrupt */
        sTimer->ucLEDNiosLife = 0;  /* close LED */
    #else
        LOGD("[MSG][Timer]Can't find Timer0.\n");
    #endif
}
extern void NiosProcessMain( );

void SetLed(sTimer_s *sTimer){
    if(((sTimer->uiTICnt % 500) ==0 )&&(sTimer->uiTICnt > 0)){
        if(sTimer->ucLEDNiosLife){
            sTimer->ucLEDNiosLife = 0; /* 4th LED off */
        }else {
            sTimer->ucLEDNiosLife = 1; /* 4th LED on */
        }
    }
}
// adjust Freq base on phase
void TimerISR(sTimer_s *sTimer, unsigned int id) {
    IOWR(sTimer->uiBase, 0, 0); /* Clear Timeout flag */
    sTimer->uiTICnt++;          /* accumulate interrupt times */

    sTimer->ucTimeout = 1;      /* set timeout flag */
    SetLed(sTimer);


//#ifdef LEDG_NAME
//    IOWR(LEDG_BASE, 0, sTimer->ucLED); /* show LED*/
//#endif

    /* Interrupt Serve Routine */
    NiosProcessMain(sTimer->sNios_p); /* 主要執行的中斷福程式 */
}


