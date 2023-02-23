/*
 * uart.c
 *
 *
 *--------------Uart�������(Host -> Nios) begin-----------
 * Uart���:
 * �_�l�ʥ](1byte): 0xAA
 * ���A�줸(1Byte): bit0: �W�@����RX���CRC����
 * 4�����F��V(1bytes): {4'b0000, MD(1bit), MB(1bit), MC(1bit), MA(1bit)}
 * 4�����F�t��(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
 * CRC(1byte): �H�W10bytes�ۥ[����̧C����Byte���ˬd�X
 * �����줸(1byte): 0xEE
 * �`�@ 13bytes
 *--------------Uart�������(Host -> Nios) end-----------
 *
 *--------------Uart�^�Ǹ��(Nios -> Host) begin-----------
 * �_�l�ʥ](1byte): 0xAA
 * TimeStamp(3Byte): �ɶ��W�O(MSB,...,LSB)
 * ���A�줸(1Byte): bit0: �W�@����Host��TX��� CRC����
 * 4�����FPWM(4bytes): PWMA(1Bytes), PWMB(1Bytes), PWMC(1Bytes), PWMD(1Bytes)
 * 4�����F��V(1bytes): {4'b0000, MD(1bit), MB(1bit), MC(1bit), MA(1bit)}
 * 4�����FEncoder(16bytes): MA(int_4bytes), MB(int_4bytes), MC(int_4bytes), MD(int_4bytes)
 * 4�����F�t��(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
 * 4�����F�q��(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
 * 4�����F�q�y(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
 * IMU Accelerometer(4Bytes): {Z[29:20],Y[19:10],X[9:0]}
 * IMU GyroScope(4Bytes): {Z[29:20],Y[19:10],X[9:0]}
 * IMU Magneticmeter(4Bytes): {Z[29:20],Y[19:10],X[9:0]}
 * CRC(1byte): �H�W61bytes�ۥ[����̧C����Byte���ˬd�X�A���]�t(�ʥ]�Y)
 * �����줸(1byte): 0xEE
 * �H�WNios�ʥ]�`�@64Bytes
 * ------------Uartt�^�Ǹ��(Nios -> Host) end---------
 *-------------------------------------------
 *    date    |   author    |  ver. | comment
 *  2021.5.20 | Shih-An Li  |  0.1  | initial
 *-------------------------------------------
 */

#include "uart.h"


/* UART function */
char SendUart( sUart_s *sUart, unsigned char ucTxData);

/* Enable Timer Interrupt Routine */
void DoEnableUartInterrupt(sUart_s *sUart);
void DoDisableUartInterrupt(sUart_s *sUart);
void UartISRInitial(sUart_s *sUart);
// adjust Freq base on phase
void UartISR(sUart_s *sUart, unsigned int id);


char SendUart( sUart_s *sUart, unsigned char ucTxData)
{   /* return -1: error, 0: uart busy, 1:successful */
    unsigned int uiStatus;
    uiStatus = IORD(sUart->uiBase, 2);              /* read uart0 status register */
    if(uiStatus & ALTERA_AVALON_UART_STATUS_E_MSK){ /* check error flag */
        IOWR(sUart->uiBase, 2, 0);                  /* clear flag, write to status register */
        #ifdef DEBUG_MESSAGE
            LOGD("[MSG]Uart0 have exception condition.");
        #endif
        return -1;
    } else {
        if(uiStatus & ALTERA_AVALON_UART_STATUS_TRDY_MSK){ /* check TRDY flag */
            IOWR(sUart->uiBase, 1, ucTxData);
            return 1; /* send successful */
        } else {
            #ifdef DEBUG_MESSAGE
                LOGD("[MSG]Uart0 is busy to transmit data.\n");
            #endif
            return 0; /* busy */
        }
    }
}

/* Enable Timer Interrupt Routine */
void DoEnableUartInterrupt(sUart_s *sUart) {
    int i, flag;
#ifdef UART0_NAME
    /* Set UART0 ISR*/
    i = alt_irq_register( sUart->uiIRQ, sUart, sUart->ISRFun_p);
    /* activate uart0 interrupt and set control register */
    flag = ALTERA_AVALON_UART_CONTROL_RRDY_MSK   /* set ie */  \
           | ALTERA_AVALON_UART_CONTROL_E_MSK;   /* set irrdy */
    IOWR(sUart->uiBase, 3, flag); /* set control register */
    /* clear status flag*/
    IOWR(sUart->uiBase, 2, 0);    /* clear status register  */
    LOGD("[MSG]Uart0 interrupt is activated.\n");
#else
    LOGD("[MSG]Can't find Uart0 peripheral. \n");
#endif
}

void DoDisableUartInterrupt(sUart_s *sUart)
{
     alt_irq_register(sUart->uiIRQ, 0, 0); /* disable timer */
     IOWR(sUart->uiBase, 3, 0); /* set control register to 0, Stop uart0 Interrupt */
     LOGD("[MSG]sUart0 interrupt is disabled.\n");
}



void UartISRInitial(sUart_s *sUart){
    // initial timer0
    #ifdef UART0_NAME
        LOGD("[MSG]Uart0 initialization..\n");
        sUart->uiBase = UART0_BASE;     /* Uart address base */
        sUart->uiIRQ = UART0_IRQ;       /* Uart irq */
        sUart->uiBaud = UART0_BAUD;     /* Uart baud rate */
        sUart->ucParity = UART0_PARITY; /* Uart parity */
        sUart->uiRxBuf_Head = 0;       /* reset uart0 buffer head index */
        sUart->uiRxBuf_End = 0;        /* reset uart0 buffer end index */
        sUart->uiTxBuf_Head = 0;       /* reset uart0 buffer head index */
        sUart->uiTxBuf_End = 0;        /* reset uart0 buffer end index */
        sUart->uiStatus = 0;            /* uart0 status */
        sUart->ISRFun_p = UartISR;      /* set interrupt ISR function */
        DoEnableUartInterrupt(sUart);         /* Enable interrupt */
    #else
        LOGD("[MSG]Can't find Uart0 peripheral.\n");
    #endif
}


// adjust Freq base on phase
void UartISR(sUart_s *sUart, unsigned int id) {
    unsigned char ucRxdata;
#ifdef UART0_NAME
    ucRxdata = IORD(sUart->uiBase, 0);
    IOWR(sUart->uiBase, 2, 0);  /* Clear uart0 flag */

//    LOGD("Rcv=0x%x\n ", ucRxdata);
    sUart->ucRxBuf[sUart->uiRxBuf_End] = ucRxdata; /* receive rxdata to buffer[end]*/
    sUart->uiRxBuf_End++; /* move to next index */
#else
    LOGD("[MSG]Can't find Uart0 peripheral.\n");
#endif
}

