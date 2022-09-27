/*
 * uart.c
 *
 *
 *--------------Uart接收資料(Host -> Nios) begin-----------
 * Uart資料:
 * 起始封包(1byte): 0xAA
 * 狀態位元(1Byte): bit0: 上一筆的RX資料CRC有錯
 * 4顆馬達方向(1bytes): {4'b0000, MD(1bit), MB(1bit), MC(1bit), MA(1bit)}
 * 4顆馬達速度(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
 * CRC(1byte): 以上10bytes相加後取最低那個Byte當檢查碼
 * 結束位元(1byte): 0xEE
 * 總共 13bytes
 *--------------Uart接收資料(Host -> Nios) end-----------
 *
 *--------------Uart回傳資料(Nios -> Host) begin-----------
 * 起始封包(1byte): 0xAA
 * TimeStamp(3Byte): 時間戳記(MSB,...,LSB)
 * 狀態位元(1Byte): bit0: 上一筆的Host的TX資料 CRC有錯
 * 4顆馬達PWM(4bytes): PWMA(1Bytes), PWMB(1Bytes), PWMC(1Bytes), PWMD(1Bytes)
 * 4顆馬達方向(1bytes): {4'b0000, MD(1bit), MB(1bit), MC(1bit), MA(1bit)}
 * 4顆馬達Encoder(16bytes): MA(int_4bytes), MB(int_4bytes), MC(int_4bytes), MD(int_4bytes)
 * 4顆馬達速度(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
 * 4顆馬達電壓(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
 * 4顆馬達電流(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
 * IMU Accelerometer(4Bytes): {Z[29:20],Y[19:10],X[9:0]}
 * IMU GyroScope(4Bytes): {Z[29:20],Y[19:10],X[9:0]}
 * IMU Magneticmeter(4Bytes): {Z[29:20],Y[19:10],X[9:0]}
 * CRC(1byte): 以上61bytes相加後取最低那個Byte當檢查碼，不包含(封包頭)
 * 結束位元(1byte): 0xEE
 * 以上Nios封包總共64Bytes
 * ------------Uartt回傳資料(Nios -> Host) end---------
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

