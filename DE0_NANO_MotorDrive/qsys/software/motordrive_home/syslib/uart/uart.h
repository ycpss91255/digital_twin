/*
 * uart.h
 *
 *  Created on: 2021/5/17
 *      Author: lishyhan
 */

#ifndef UART_H_
#define UART_H_
/* nios2 system library */
#include <system.h>
#include <sys/alt_irq.h>
#include <priv/alt_legacy_irq.h> /* define alt_irq_register() */
#include <stdio.h>
#include <io.h>
#include <altera_avalon_pio_regs.h> /**/
#include <altera_avalon_uart_regs.h> /* UART register */

#define BufLength 128

/* uart structure variable */
typedef struct {

    // for uart parameters
    unsigned int   uiBase;        /* Uart address base */
    unsigned int   uiIRQ;         /* Uart irq */
    unsigned int   uiBaud;        /* Uart baud rate */
    unsigned char  ucParity;      /* Uart parity */
    unsigned char  ucRxBuf[BufLength];  /* Uart buffer */
    unsigned int   uiRxBuf_Head;  /* Uart Rx buffer Head index */
    unsigned int   uiRxBuf_End;   /* Uart Rx buffer end index */
    unsigned char  ucTxBuf[BufLength];  /* Uart Tx buffer */
    unsigned int   uiTxBuf_Head;  /* Uart Tx buffer Head index */
    unsigned int   uiTxBuf_End;   /* Uart Tx buffer end index  */
    unsigned int   uiStatus;      /* Uart status */
    unsigned int   uiCrcStatus;   /* bit0: (1) RXBuf CRC error, bit1: (1)TXBuf CRC error */

    void           *ISRFun_p;     /* ISR for timer */

    /* flag */
    char           cTXbufRdy;     /* 1: TX_Buf is ready for transmit data, call UartTxbufProcess() to send data */
    char           cRXbufRdy;     /* 1: RX_Buf is ready for receive data, call UartRxbufProcess() to send data */

} sUart_s;


#endif /* UART_H_ */
