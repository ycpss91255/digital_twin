/*
 * file : NiosProcess.c
 * description: Nios 主程式部分式
 *
 *-------------------------------------------
 *    date    |   author    |  ver. | comment
 *  2021.5.6  | Shih-An Li  |  0.1  | initial
 *  2021.6.4  | Shih-An Li  |  0.2  | 增加void UnpackHostPackage( )還未測試。
 *-------------------------------------------
 */
#include "nios.h"

/* declare function */
extern char SendUart( sUart_s *sUart, unsigned char ucTxData);
void UartTxbufProcess( sNios_s *sNios);
void UartRxbufProcess( sNios_s *sNios);
void UnPackUartDataFromHost(sNios_s *sNios);
void Thread1(sNios_s *sNios);
void Thread2(sNios_s *sNios);
void NiosProcessMain(sNios_s *sNios);
void Thread_ReadSensor(sNios_s *sNios);		/* thread for read sensor */
void Thread_UpdataHostCmd(sNios_s *sNios);  /* thread for update host command */
void Thread_Controller(sNios_s *sNios);     /* thread for Controller */
/* put Nios data to uart package */
void PackUartDataToHost(sNios_s *sNios);

/*----------- declare function end ---------*/

void NiosProcessMain(sNios_s *sNios) {
    /* write time process to here */
    if(sNios->sTimer0.ucTimeout == 1){  /* check interrupt timeout */
        sNios->sTimer0.ucTimeout = 0;   /* clear timeout */
        /* read sensor */
        Thread_ReadSensor(sNios);		/* read sensor value*/
        /* update host command */
        Thread_UpdataHostCmd(sNios);	/* process Host package and update command */
        /* controller */
        Thread_Controller(sNios);
    }
}

void Thread_ReadSensor(sNios_s *sNios) {
     Read4XMotorDir(&sNios->sMotor);    /* read motor feed back direction */
     Read4XMotorEncoder(&sNios->sMotor);/* read motor feedback encoder */
     Read4XMotorSpeed(&sNios->sMotor);  /* read motor speed */
     Read4XMotorSensor(&sNios->sMotor); /* read motor voltage and current */
     ReadIMU(&sNios->sIMU);				/* read IMU sensor */
}

void Thread_UpdataHostCmd(sNios_s *sNios) {
    if((sNios->sTimer0.uiTICnt % HostCmdTimeUnit) == 0 ||(sNios->sTimer0.uiTICnt==1)){/* update Host Command time unit */
    	/* update motor Speed command*/
        sNios->sPID_MA.uiSpdCntCmd = 16;
        sNios->sPID_MB.fRefCom = 0;
        sNios->sPID_MC.fRefCom = 0;
        sNios->sPID_MD.fRefCom = 0;
        /* update motor direction command*/

//        printf("MA_SPD=%x\n", sNios->sMotor.sMotorAp.uiMotorFBSpeed);

    }else {   /* do nothing */   }
}

void Thread_Controller(sNios_s *sNios) {
    float fSensor;

    if((sNios->sTimer0.uiTICnt % sNios->sPID_MA.uiControlTime) == 0){
       if(sNios->sMotor.sMotorAp.uiMotorFBSpeed != 0xdeadbeef){
//           printf("MA_SPD=%d\n", sNios->sMotor.sMotorAp.uiMotorFBSpeed);

       /* sensor value normalization */
           fSensor = ((float )sNios->sMotor.sMotorAp.uiMotorFBSpeed) / ((float ) MotorSpeedCnt24V);
           if(fSensor > 1.0 ) fSensor = 1;

           sNios->sPID_MA.fRefCom = ((float)sNios->sPID_MA.uiSpdCntCmd) / ((float ) MotorSpeedCnt24V);
           if(sNios->sPID_MA.fRefCom > 1.0 ) sNios->sPID_MA.fRefCom = 1.0;

        PIDctrl(&sNios->sPID_MA, fSensor); /* PID controller for Motor A*/
        /* update PWM command */
        /** export to motor driver */
        sNios->sMotor.sMotorAp.ucMotorPWM = (unsigned char )sNios->sPID_MA.iCtrlOutCmd; /* export to motor A driver*/
        sNios->sMotor.sMotorBp.ucMotorPWM = (unsigned char )sNios->sPID_MB.iCtrlOutCmd; /* export to motor B driver*/
        sNios->sMotor.sMotorCp.ucMotorPWM = (unsigned char )sNios->sPID_MC.iCtrlOutCmd; /* export to motor C driver*/
        sNios->sMotor.sMotorDp.ucMotorPWM = (unsigned char )sNios->sPID_MD.iCtrlOutCmd; /* export to motor D driver*/

        Send4XwheelPwm(&sNios->sMotor, sNios->sMotor.sMotorAp.ucMotorPWM, 0, 0, 0);  /* Stop 4 wheel PWM */
        Send4XwheelDir(&sNios->sMotor, 0, 1, 1, 1);    /* send motor direction, 0:CW, 1:CCW  */
        Send2XMotorDriverEnable(&sNios->sMotor,1, 1);  /* open motor driver, 1: enable, 0: disable */
       }
//        printf("CMDA=%d\n",sNios->sPID_MA.fRefCom);

    }else {   /* do nothing */   }
}
void Thread1(sNios_s *sNios) {
    if(sNios->sTimer0.uiTICnt%Thread1TimeUnit == 0){
        /* reflash motor data */
        UartTxbufProcess(sNios); 	/* Send data in TXbuf to Host */
        UartRxbufProcess(sNios); 	/* Receive uart data to Nios */
    } else { /* do nothing */ }
}
void Thread2(sNios_s *sNios) {
    if(sNios->sTimer0.uiTICnt%Thread2TimeUnit < 5 ){ /* A range to judge HOSt command */
      /* receive Host motor command */
      /* check receive data > 12 Bytes */
  //    printf("==>>>>>>>>>> Thread2.\n");
      printf(".\n");
      UartTxbufProcess( sNios);
    } else { /* do nothing */ }
}

/* unpack host package, no test */
void UnpackHostPackage(sNios_s *sNios){
	 /*--------------Uart接收資料(Host -> Nios) begin-----------
	 * Uart資料:
	 * 起始封包(1byte): 0xAA
	 * 4顆馬達方向(1bytes): {4'b0000, MD(1bit), MC(1bit), MB(1bit), MA(1bit)}
	 * 4顆馬達速度(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
	 * 狀態位元(1Byte): bit0: 上一筆的RX資料CRC有錯
	 * CRC(1byte): 以上10bytes相加後取最低那個Byte當檢查碼
	 * 結束位元(1byte): 0xEE
	 * 總共 13bytes
	 *--------------Uart接收資料(Host -> Nios) end-----------*/
	unsigned int idx;
	unsigned char cTmp;

	idx = sNios->sUart0.uiRxBuf_Head+1;
	cTmp = sNios->sUart0.ucRxBuf[idx]; /* 1st byte, not package head */
	sNios->sMotor.sMotorAp.uiHostMotorDirCmd =  cTmp&0x01;     /* store motor A direction */
	sNios->sMotor.sMotorBp.uiHostMotorDirCmd = (cTmp&0x02)>>1; /* store motor B direction */
	sNios->sMotor.sMotorCp.uiHostMotorDirCmd = (cTmp&0x04)>>2; /* store motor C direction */
	sNios->sMotor.sMotorDp.uiHostMotorDirCmd = (cTmp&0x08)>>3; ;/* store motor D direction */
	idx++; /* 2~9, total 8 bytes */
	sNios->sMotor.sMotorAp.uiHostMotorSpdCmd = (sNios->sUart0.ucRxBuf[idx]<<8) + sNios->sUart0.ucRxBuf[idx+1]; idx+=2; /* need to check correct?*/
	sNios->sMotor.sMotorBp.uiHostMotorSpdCmd = (sNios->sUart0.ucRxBuf[idx]<<8) + sNios->sUart0.ucRxBuf[idx+1]; idx+=2; /* need to check correct?*/
	sNios->sMotor.sMotorCp.uiHostMotorSpdCmd = (sNios->sUart0.ucRxBuf[idx]<<8) + sNios->sUart0.ucRxBuf[idx+1]; idx+=2; /* need to check correct?*/
	sNios->sMotor.sMotorDp.uiHostMotorSpdCmd = (sNios->sUart0.ucRxBuf[idx]<<8) + sNios->sUart0.ucRxBuf[idx+1]; idx+=2; /* need to check correct?*/
	cTmp = sNios->sUart0.ucRxBuf[idx]; /* status byte */
	if(cTmp){
	    printf("Last package to Host have CRC error.");
	}

}
/* put Nios data to uart package, no test */
void UnPackUartDataFromHost(sNios_s *sNios){
    unsigned int  i;
    unsigned char ucCRC; /* CRC check code */

    while( (sNios->sUart0.uiRxBuf_End - sNios->sUart0.uiRxBuf_Head) >= UartPackageRXLengthFromHost-1 ){
        /* check package frame */
        if( sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head] == UartPackageFrameHead){ /* frame begin byte */
            if(sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head + UartPackageRXLengthFromHost-1] == UartPackageFrameEnd){ /* frame end byte */
                /* frame correct and check CRC code */
                for(i = sNios->sUart0.uiRxBuf_Head+1, ucCRC = 0; i <(sNios->sUart0.uiRxBuf_Head + UartPackageRXLengthFromHost-2); i++){
                    ucCRC +=  sNios->sUart0.ucRxBuf[i];
                }
                ucCRC &= 0xff;
                if(ucCRC == sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head + UartPackageRXLengthFromHost-2]) { /* check CRC */
                    printf("Receive correct host data and start to unpack data.\n");
                    UnpackHostPackage(sNios);
                    sNios->sUart0.uiRxBuf_Head +=  UartPackageRXLengthFromHost; /* add package length */
                }else{
                    printf("Receive package (RX_buf[...]) CRC error. \n");
                }
            }
        } else {
            sNios->sUart0.uiRxBuf_Head++; /* increase rx_buf index */
        }
    }
}


/* Calculate Uart Tx crc */
unsigned char UarTxCrcCal(sNios_s *sNios){
    unsigned char ucCRC;
    unsigned int i;

    for(i= sNios->sUart0.uiTxBuf_Head+1, ucCRC = 0;  i < UartPackageLengthToHost-1-1; i++){
         /* calculate crc value in Txbuf[UartPackageLengthToHost], not include UartPackageFrameHead, CRC, UartPackageFrameEnd */
        ucCRC +=  sNios->sUart0.ucTxBuf[i];
    }
    return ucCRC & 0xff;
}
/* Calculate Uart RX crc */
unsigned char UarRxCrcCal(sNios_s *sNios){
    unsigned char ucCRC;
    unsigned int i;

    for(i= sNios->sUart0.uiRxBuf_Head+1, ucCRC = 0;  i < UartPackageRXLengthFromHost-1-1; i++) {
         /* calculate crc value in Txbuf[UartPackageLengthToHost], not include UartPackageFrameHead, CRC, UartPackageFrameEnd */
        ucCRC +=  sNios->sUart0.ucRxBuf[i];
    }
    return ucCRC & 0xff;
}


/* send txbuf to host via UART0 */
void UartTxbufProcess( sNios_s *sNios)
{
    char ret;
    //        printf("T");
    if(sNios->sUart0.cTXbufRdy){ /* check Tx_buf is ready or not?*/
		while (sNios->sUart0.uiTxBuf_End != sNios->sUart0.uiTxBuf_Head) { /* check length */
			ret = SendUart(&sNios->sUart0, sNios->sUart0.ucTxBuf[sNios->sUart0.uiTxBuf_Head]);
			if(ret == -1){
				/* send data failure */
				#ifdef DEBUG_MESSAGE
					printf("[MSG]Uart0 have exception condition.");
				#endif
			} else if(ret == 1){ /* send successful, and increase TX head index */
				sNios->sUart0.uiTxBuf_Head++;
			} else {
				/* UART busy, and wait*/
				#ifdef DEBUG_MESSAGE
					// printf("[MSG]Uart0 is busy to transmit data.\n");
				#endif
			}
		}
		if(sNios->sUart0.uiTxBuf_Head == sNios->sUart0.uiTxBuf_End){
			/* no data need to send */
			sNios->sUart0.uiTxBuf_Head = 0 ;
			sNios->sUart0.uiTxBuf_End = 0;
		}
    }
}
/* Uart0 RxBuf process*/
void UartRxbufProcess(sNios_s *sNios) {
    unsigned char crc;

    while((sNios->sUart0.uiRxBuf_End - sNios->sUart0.uiTxBuf_Head ) >= (UartPackageRXLengthFromHost-1) ) { /* check a package length from host */
        if(sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head] == UartPackageFrameHead) { /* find frame head */
            if(sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head + UartPackageRXLengthFromHost - 1] == UartPackageFrameEnd) { /* find frame end */
                /* find a UartPackage form Host */
                crc = UarRxCrcCal(sNios);  /* calculate CRC */
                if(crc == sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head + UartPackageRXLengthFromHost - 2]){ /* crc check */
//                        printf("\n[MSG]RBuf=");
//                        for(i=0; i<UartPackageRXLengthFromHost;i++){
//                            printf("0x%2x, ", sNios->sUart0.ucRxBuf[i]);
//                        }
//                        printf("\n");
                     UnPackUartDataFromHost(sNios);

                } else {
                    printf("[MSG]RX frame data CRC error.\n");
                }
            }
        }else{
            /* not frame head */
            sNios->sUart0.uiRxBuf_Head++; /* increase index*/
        }
    }
    if(sNios->sUart0.uiRxBuf_Head == sNios->sUart0.uiRxBuf_End){
        /* no data need to process */
        sNios->sUart0.uiRxBuf_Head = 0 ;
        sNios->sUart0.uiRxBuf_End = 0;
    }
}


/* put Nios data to uart package */
void PackUartDataToHost(sNios_s *sNios){
    int i, idx;
    unsigned char ucCRC; /* CRC check code */

/*--------------Uart回傳資料(Nios -> Host) begin-----------
 * 起始封包(1byte): 0xAA
 * TimeStamp(3Byte): 時間戳記(MSB,...,LSB)
 * 狀態位元(1Byte): bit0: 上一筆的Host的TX資料 CRC有錯
 * 4顆馬達PWM(4bytes): PWMA(1Bytes), PWMB(1Bytes), PWMC(1Bytes), PWMD(1Bytes)
 * 4顆馬達回授的方向(1bytes): {4'b0000, MD(1bit), MB(1bit), MC(1bit), MA(1bit)}
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
 * ------------Uartt回傳資料(Nios -> Host) end---------*/
#ifdef UART_TX_Test
    /* fill test data */
    for(i=0, ucCRC = 0; i<43; i++){
        sNios->sUart0.ucTxBuf[i]=i;
    }
    /* calculate CRC */
    for(i=1, ucCRC = 0; i<42; i++){
        ucCRC +=  sNios->sUart0.ucTxBuf[i];
    }
    sNios->sUart0.ucTxBuf[0]  = UartPackageFrameHead;  /* add package head */
//    sNios->sUart0.ucTxBuf[13] = 0xBE;  /* add package head */
    sNios->sUart0.ucTxBuf[42] = (unsigned char) (ucCRC & 0xff);  /* add CRC */
    sNios->sUart0.ucTxBuf[43] = UartPackageFrameEnd; /*  add package end */
    sNios->sUart0.uiTxBuf_Head = 0;
    sNios->sUart0.uiTxBuf_End = UartPackageLengthToHost;
#else
    idx=0;
    sNios->sUart0.ucTxBuf[idx] = UartPackageFrameHead; idx++;                                              /* [0] package head */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sTimer0.uiTICnt >>16 & 0xff; idx++;                /* [1] Timer interrupt Counter(3rd Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sTimer0.uiTICnt >>8 & 0xff; idx++;                 /* [2] Timer interrupt Counter(2nd Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sTimer0.uiTICnt & 0xff; idx++;                     /* [3] Timer interrupt Counter(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = 0; idx++;                                                                 /* [4] Status byte */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorAp.ucMotorPWM & 0xff; idx++;          /* [5] motor A PWM_CMD present value (1 Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorBp.ucMotorPWM & 0xff; idx++;          /* [6] motor B PWM_CMD present value (1 Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorCp.ucMotorPWM & 0xff; idx++;          /* [7] motor C PWM_CMD present value (1 Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorDp.ucMotorPWM & 0xff; idx++;          /* [8] motor D PWM_CMD present value (1 Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.uiR02MotorFBDir & 0xff; idx++;              /* [9] motor feedback direction */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorAp.iMotorFBEncoder>>24 & 0xff; idx++; /* [10] motor A feedback direction(4th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorAp.iMotorFBEncoder>>16 & 0xff; idx++; /* [11] motor A feedback direction(3rd Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorAp.iMotorFBEncoder>>8 & 0xff; idx++;  /* [12] motor A feedback direction(2nd Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorAp.iMotorFBEncoder & 0xff; idx++;     /* [13] motor A feedback direction(1st Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorBp.iMotorFBEncoder>>24 & 0xff; idx++; /* [14] motor B feedback direction(4th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorBp.iMotorFBEncoder>>16 & 0xff; idx++; /* [15] motor B feedback direction(3rd Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorBp.iMotorFBEncoder>>8 & 0xff; idx++;  /* [16] motor B feedback direction(2nd Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorBp.iMotorFBEncoder & 0xff; idx++;     /* [17] motor B feedback direction(1st Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorCp.iMotorFBEncoder>>24 & 0xff; idx++; /* [18] motor C feedback direction(4th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorCp.iMotorFBEncoder>>16 & 0xff; idx++; /* [19] motor C feedback direction(3rd Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorCp.iMotorFBEncoder>>8 & 0xff; idx++;  /* [20] motor C feedback direction(2nd Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorCp.iMotorFBEncoder & 0xff; idx++;     /* [21] motor C feedback direction(1st Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorDp.iMotorFBEncoder>>24 & 0xff; idx++; /* [22] motor D feedback direction(4th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorDp.iMotorFBEncoder>>16 & 0xff; idx++; /* [23] motor D feedback direction(3rd Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorDp.iMotorFBEncoder>>8 & 0xff; idx++;  /* [24] motor D feedback direction(2nd Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorDp.iMotorFBEncoder & 0xff; idx++;     /* [25] motor D feedback direction(1st Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorAp.uiMotorFBSpeed>>8 & 0xff; idx++;   /* [26] motor A feedback speed(MsB Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorAp.uiMotorFBSpeed & 0xff; idx++;      /* [27] motor A feedback speed(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorBp.uiMotorFBSpeed>>8 & 0xff; idx++;   /* [28] motor B feedback speed(MSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorBp.uiMotorFBSpeed & 0xff; idx++;      /* [29] motor B feedback speed(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorCp.uiMotorFBSpeed>>8 & 0xff; idx++;   /* [30] motor C feedback speed(MSB Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorCp.uiMotorFBSpeed & 0xff; idx++;      /* [31] motor C feedback speed(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorDp.uiMotorFBSpeed>>8 & 0xff; idx++;   /* [32] motor D feedback speed(MSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorDp.uiMotorFBSpeed & 0xff; idx++;      /* [33] motor D feedback speed(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorAp.uiVoltage>>8 & 0xff; idx++;        /* [34] motor A feedback Voltage(MsB Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorAp.uiVoltage & 0xff; idx++;           /* [35] motor A feedback Voltage(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorBp.uiVoltage>>8 & 0xff; idx++;        /* [36] motor B feedback Voltage(MSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorBp.uiVoltage & 0xff; idx++;           /* [37] motor B feedback Voltage(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorCp.uiVoltage>>8 & 0xff; idx++;        /* [38] motor C feedback Voltage(MSB Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorCp.uiVoltage & 0xff; idx++;           /* [39] motor C feedback Voltage(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorDp.uiVoltage>>8 & 0xff; idx++;        /* [40] motor D feedback Voltage(MSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorDp.uiVoltage & 0xff; idx++;           /* [41] motor D feedback Voltage(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorAp.uiCurrent>>8 & 0xff; idx++;        /* [42] motor A feedback Current(MsB Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorAp.uiCurrent & 0xff; idx++;           /* [43] motor A feedback Current(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorBp.uiCurrent>>8 & 0xff; idx++;        /* [44] motor B feedback Current(MSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorBp.uiCurrent & 0xff; idx++;           /* [45] motor B feedback Current(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorCp.uiCurrent>>8 & 0xff; idx++;        /* [46] motor C feedback Current(MSB Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorCp.uiCurrent & 0xff; idx++;           /* [47] motor C feedback Current(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorDp.uiCurrent>>8 & 0xff; idx++;        /* [48] motor D feedback Current(MSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sMotor.sMotorDp.uiCurrent & 0xff; idx++;           /* [49] motor D feedback Current(LSB Byte) */
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawAcce>>24 & 0xff; idx++;                  /* [50] IMU Accelerometer (4th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawAcce>>16 & 0xff; idx++;                  /* [51] IMU Accelerometer (3th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawAcce>>8 & 0xff; idx++;                   /* [52] IMU Accelerometer (2th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawAcce & 0xff; idx++;                      /* [53] IMU Accelerometer (1th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawGyro>>24 & 0xff; idx++;                  /* [54] IMU Gyroscope (4th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawGyro>>16 & 0xff; idx++;                  /* [55] IMU Gyroscope (3th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawGyro>>8 & 0xff; idx++;                   /* [56] IMU Gyroscope (2th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawGyro & 0xff; idx++;                      /* [57] IMU Gyroscope (1th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawMagn>>24 & 0xff; idx++;                  /* [58] IMU Magneticmeter (4th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawMagn>>16 & 0xff; idx++;                  /* [59] IMU Magneticmeter (3th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawMagn>>8 & 0xff; idx++;                   /* [60] IMU Magneticmeter (2th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = (unsigned char )sNios->sIMU.uiRawMagn & 0xff; idx++;                      /* [61] IMU Magneticmeter (1th Byte)*/
    /* generate crc code */
    for(i=1, ucCRC = 0; i < UartPackageLengthToHost-1; i++){
        ucCRC +=  sNios->sUart0.ucTxBuf[i];
    }
    sNios->sUart0.ucTxBuf[idx] = ucCRC; idx++;        /* [62] IMU Magneticmeter (1th Byte)*/
    sNios->sUart0.ucTxBuf[idx] = UartPackageFrameEnd; /* [63] package end */
    sNios->sUart0.uiTxBuf_Head = 0;
    sNios->sUart0.uiTxBuf_End = UartPackageLengthToHost;

#endif
}

