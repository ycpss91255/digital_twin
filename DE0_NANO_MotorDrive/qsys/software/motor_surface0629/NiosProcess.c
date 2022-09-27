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
    void NiosProcessMain(sNios_s *sNios);  /* Nios最主要執行的中斷服務程式  */
    void Thread_ReadSensor(sNios_s *sNios);		/* thread for read sensor */
    void Thread_UpdataHostCmd(sNios_s *sNios);  /* thread for update host command */
    void Thread_Controller(sNios_s *sNios);     /* thread for Controller */
    void ShowStatusLed(sNios_s *sNios);         /* show status LED */
    void status_report(sNios_s *sNios, unsigned char status);


/* put Nios data to uart package */
    void PackUartDataToHost(sNios_s *sNios);

/*----------- declare function end ---------*/

/* doing process schedule */
void NiosProcessMain(sNios_s *sNios) {
	/* Nios最主要執行的中斷服務程式  */
    /* write time process to here */
    if(sNios->sTimer0.ucTimeout == 1){  /* check interrupt timeout */
        sNios->sTimer0.ucTimeout = 0;   /* clear timeout */
        if(sNios->sTimer0.uiTICnt % 10==0){ /* every 10ms to send Nios data to Host */
            if(sNios->cFlagPackDataToHost == 0) {
               sNios->cFlagPackDataToHost = 1; /* set packdata to host = 1*/
            }
        }
        /* read sensor */
        Thread_ReadSensor(sNios);		/* read sensor value*/
        /* update host command */
        Thread_UpdataHostCmd(sNios);	/* process Host package and update command */

        /* controller */
        Thread_Controller(sNios);
    }

}

void Thread_ReadSensor(sNios_s *sNios) {
     Read4XMotorDir    (&sNios->sMotor);   /* read motor feed back direction */
     Read4XMotorEncoder(&sNios->sMotor);   /* read motor feedback encoder */
     Read4XMotorSpeed  (&sNios->sMotor);   /* read motor speed */
     Read4XMotorSensor (&sNios->sMotor);   /* read motor voltage and current */
     ReadIMU           (&sNios->sIMU);				/* read IMU sensor */
}

void Thread_UpdataHostCmd(sNios_s *sNios) {
    if((sNios->sTimer0.uiTICnt % HostCmdTimeUnit) == 0 ||(sNios->sTimer0.uiTICnt==1)){/* update Host Command time unit */
        if(sNios->cFlagUnpackHostComplete){     /* update motor Speed command*/
            /* for test */
//                sNios->sPID_MA.uiSpdCntCmd = 16;
//                sNios->sPID_MB.fRefCom = 0;
//                sNios->sPID_MC.fRefCom = 0;
//                sNios->sPID_MD.fRefCom = 0;
            /* for running */
                sNios->sPID_MA.uiSpdCntCmd = sNios->sMotor.sMotorAp.uiHostMotorSpdCmd;
                sNios->sPID_MB.uiSpdCntCmd = sNios->sMotor.sMotorBp.uiHostMotorSpdCmd;
                sNios->sPID_MC.uiSpdCntCmd = sNios->sMotor.sMotorCp.uiHostMotorSpdCmd;
                sNios->sPID_MD.uiSpdCntCmd = sNios->sMotor.sMotorDp.uiHostMotorSpdCmd;
//                LOGD("0x%x\n", sNios->sPID_MA.uiSpdCntCmd);
        /* update motor direction command*/
                sNios->sMotor.sMotorAp.uiMotorDirCmd = sNios->sMotor.sMotorAp.uiHostMotorDirCmd;     /* store motor A direction */
                sNios->sMotor.sMotorBp.uiMotorDirCmd = sNios->sMotor.sMotorBp.uiHostMotorDirCmd;     /* store motor B direction */
                sNios->sMotor.sMotorCp.uiMotorDirCmd = sNios->sMotor.sMotorCp.uiHostMotorDirCmd;     /* store motor C direction */
                sNios->sMotor.sMotorDp.uiMotorDirCmd = sNios->sMotor.sMotorDp.uiHostMotorDirCmd;     /* store motor D direction */
//        LOGD("MA_SPD=%x\n", sNios->sMotor.sMotorAp.uiMotorFBSpeed);
//                LOGD("MA_DIR=%x\n", sNios->sMotor.sMotorBp.uiMotorDirCmd);
                sNios->cFlagUnpackHostComplete = 0;
        }
    }else {   /* do nothing */   }
}

void Thread_Controller(sNios_s *sNios) {
    float fSensor;
    if(sNios->ucLedRcvHostPackage){/* receive host package*/
    	if(sNios->sMotor.ucEnPID &0x01){/* enable PID controller*/
			if((sNios->sTimer0.uiTICnt % sNios->sPID_MA.uiControlTime) == 0){  /* wait control-time time-up */
				if(sNios->sMotor.sMotorAp.uiMotorFBSpeed & 0x8000 ){/* motor A*/
				   sNios->sMotor.sMotorAp.uiMotorFBSpeed &= 0xffff7fff; /* clear dval */
		//           LOGD("MA_SPD=%d\n", sNios->sMotor.sMotorAp.uiMotorFBSpeed);

			   /* sensor value normalization */
				   fSensor = ((float )sNios->sMotor.sMotorAp.uiMotorFBSpeed) / ((float ) MotorSpeedCnt24V);
				   if(fSensor > 1.0 ) fSensor = 1;

				   sNios->sPID_MA.fRefCom = ((float)sNios->sPID_MA.uiSpdCntCmd) / ((float ) MotorSpeedCnt24V);
				   if(sNios->sPID_MA.fRefCom > 1.0 ) sNios->sPID_MA.fRefCom = 1.0;
				   PIDctrl(&sNios->sPID_MA, fSensor); /* PID controller for Motor A*/
				   /* update PWM command */
				   sNios->sMotor.sMotorAp.ucMotorPWM = (unsigned char )sNios->sPID_MA.iCtrlOutCmd; /* export to motor A driver*/

		//           LOGD("Motor A CMD, FSPD, HDIR, EDIR, FDIR, volt, ampe: %d, %d, %d, %d, %d, %d, %d.\n",
		//        		                                      sNios->sMotor.sMotorAp.uiHostMotorSpdCmd,
		//        		                                      sNios->sMotor.sMotorAp.uiMotorFBSpeed,
		//        		                                      sNios->sMotor.sMotorAp.uiHostMotorDirCmd,
		//        		                                      sNios->sMotor.sMotorAp.uiMotorDirCmd,
		//        		                                      sNios->sMotor.sMotorAp.uiMotorFBDir,
		//        		                                      sNios->sMotor.sMotorAp.uiMotorFBVoltageAcc/sNios->sMotor.sMotorAp.uiMotorFBVoltageAccCnt,
		//        		                                      sNios->sMotor.sMotorAp.uiMotorFBCurrentAcc/sNios->sMotor.sMotorAp.uiMotorFBCurrentAccCnt);


			   }
			}
			if((sNios->sTimer0.uiTICnt % sNios->sPID_MB.uiControlTime) == 0){
			   if(sNios->sMotor.sMotorBp.uiMotorFBSpeed & 0x8000 ){/* motor A*/
				   sNios->sMotor.sMotorBp.uiMotorFBSpeed &= 0xffff7fff; /* clear dval */
		//           LOGD("MA_SPD=%d\n", sNios->sMotor.sMotorAp.uiMotorFBSpeed);

			   /* sensor value normalization */
				   fSensor = ((float )sNios->sMotor.sMotorBp.uiMotorFBSpeed) / ((float ) MotorSpeedCnt24V);
				   if(fSensor > 1.0 ) fSensor = 1;

				   sNios->sPID_MB.fRefCom = ((float)sNios->sPID_MB.uiSpdCntCmd) / ((float ) MotorSpeedCnt24V);
				   if(sNios->sPID_MB.fRefCom > 1.0 ) sNios->sPID_MB.fRefCom = 1.0;
				   PIDctrl(&sNios->sPID_MB, fSensor); /* PID controller for Motor B*/
				   /* update PWM command */
				   sNios->sMotor.sMotorBp.ucMotorPWM = (unsigned char )sNios->sPID_MB.iCtrlOutCmd; /* export to motor B driver*/

			   }
			}
			if((sNios->sTimer0.uiTICnt % sNios->sPID_MC.uiControlTime) == 0){
			   if(sNios->sMotor.sMotorCp.uiMotorFBSpeed & 0x8000 ){/* motor A*/
				   sNios->sMotor.sMotorCp.uiMotorFBSpeed &= 0xffff7fff; /* clear dval */
		//           LOGD("MA_SPD=%d\n", sNios->sMotor.sMotorAp.uiMotorFBSpeed);

			   /* sensor value normalization */
				   fSensor = ((float )sNios->sMotor.sMotorCp.uiMotorFBSpeed) / ((float ) MotorSpeedCnt24V);
				   if(fSensor > 1.0 ) fSensor = 1;

				   sNios->sPID_MC.fRefCom = ((float)sNios->sPID_MC.uiSpdCntCmd) / ((float ) MotorSpeedCnt24V);
				   if(sNios->sPID_MC.fRefCom > 1.0 ) sNios->sPID_MC.fRefCom = 1.0;
				   PIDctrl(&sNios->sPID_MC, fSensor); /* PID controller for Motor C*/
				   /* update PWM command */
				   sNios->sMotor.sMotorCp.ucMotorPWM = (unsigned char )sNios->sPID_MC.iCtrlOutCmd; /* export to motor C driver*/
			   }
			}
			if((sNios->sTimer0.uiTICnt % sNios->sPID_MD.uiControlTime) == 0){
			   if(sNios->sMotor.sMotorDp.uiMotorFBSpeed & 0x8000 ){/* motor A*/
				   sNios->sMotor.sMotorDp.uiMotorFBSpeed &= 0xffff7fff; /* clear dval */
		//           LOGD("MA_SPD=%d\n", sNios->sMotor.sMotorAp.uiMotorFBSpeed);

			   /* sensor value normalization */
				   fSensor = ((float )sNios->sMotor.sMotorDp.uiMotorFBSpeed) / ((float ) MotorSpeedCnt24V);
				   if(fSensor > 1.0 ) fSensor = 1;

				   sNios->sPID_MD.fRefCom = ((float)sNios->sPID_MD.uiSpdCntCmd) / ((float ) MotorSpeedCnt24V);
				   if(sNios->sPID_MD.fRefCom > 1.0 ) sNios->sPID_MD.fRefCom = 1.0;
				   PIDctrl(&sNios->sPID_MD, fSensor); /* PID controller for Motor D*/
				   /* update PWM command */
				   sNios->sMotor.sMotorDp.ucMotorPWM = (unsigned char )sNios->sPID_MD.iCtrlOutCmd; /* export to motor D driver*/
			   }
			}
		} else {/*  if(sNios->sMotor.ucEnPID &0x01){ */
			if(sNios->sMotor.sMotorAp.uiHostMotorSpdCmd > 100){
				LOGD("[Err]Motor A CMD error value.\n");
				sNios->sMotor.sMotorAp.ucMotorPWM = 0;
			}else{
				sNios->sMotor.sMotorAp.ucMotorPWM = sNios->sMotor.sMotorAp.uiHostMotorSpdCmd;
			}
			if(sNios->sMotor.sMotorAp.uiHostMotorSpdCmd > 100){
				LOGD("[Err]Motor B CMD error value.\n");
				sNios->sMotor.sMotorBp.ucMotorPWM = 0;
			}else{
				sNios->sMotor.sMotorBp.ucMotorPWM = sNios->sMotor.sMotorBp.uiHostMotorSpdCmd;
			}
			if(sNios->sMotor.sMotorAp.uiHostMotorSpdCmd > 100){
				LOGD("[Err]Motor C CMD error value.\n");
				sNios->sMotor.sMotorCp.ucMotorPWM = 0;
			}else{
				sNios->sMotor.sMotorCp.ucMotorPWM = sNios->sMotor.sMotorCp.uiHostMotorSpdCmd;
			}
			if(sNios->sMotor.sMotorAp.uiHostMotorSpdCmd > 100){
				LOGD("[Err]Motor D CMD error value.\n");
				sNios->sMotor.sMotorDp.ucMotorPWM = 0;
			}else{
				sNios->sMotor.sMotorDp.ucMotorPWM = sNios->sMotor.sMotorDp.uiHostMotorSpdCmd;
			}

		}
    }else{ /* close PWM */
    	LOGD("No Host data.\n");
		sNios->sMotor.sMotorAp.ucMotorPWM = 0;
		sNios->sMotor.sMotorBp.ucMotorPWM = 0;
		sNios->sMotor.sMotorCp.ucMotorPWM = 0;
		sNios->sMotor.sMotorDp.ucMotorPWM = 0;
    }


       /* update PWM command */
       /** export to motor driver */
       /* send motor command to motor drive board */
       Send4XwheelPwm(     &sNios->sMotor,
                           sNios->sMotor.sMotorAp.ucMotorPWM,
                           sNios->sMotor.sMotorBp.ucMotorPWM,
                           sNios->sMotor.sMotorCp.ucMotorPWM,
                           sNios->sMotor.sMotorDp.ucMotorPWM
                           );  /* Stop 4 wheel PWM */

       Send4XwheelDir(         &sNios->sMotor,
                               sNios->sMotor.sMotorAp.uiMotorDirCmd,
                               sNios->sMotor.sMotorBp.uiMotorDirCmd,
                               sNios->sMotor.sMotorCp.uiMotorDirCmd,
                               sNios->sMotor.sMotorDp.uiMotorDirCmd);    /* send motor direction, 0:CW, 1:CCW  */
       Send2XMotorDriverEnable(&sNios->sMotor,1, 1);  /* open motor driver, 1: enable, 0: disable */
//       LOGD("DirC=%d\n",sNios->sMotor.sMotorCp.uiMotorDirCmd);
//        LOGD("CMDA=%d\n",sNios->sPID_MA.fRefCom);

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
  //    LOGD("==>>>>>>>>>> Thread2.\n");
//      LOGD(".\n");
      UartTxbufProcess( sNios);
    } else { /* do nothing */ }
}
void status_report(sNios_s *sNios, unsigned char status){
    if(status&0x01){ /* 上一筆的RX資料CRC有錯	*/
        LOGD("Last package to Host have CRC error.\n");
    }
    if(status&0x02){ /* 切換控制器模式	*/
        LOGD("Use PID controller.\n");
        sNios->sMotor.ucEnPID = 1; /* enable PID controller */
    }else{
    	LOGD("No PID Controller.\n");
    	 sNios->sMotor.ucEnPID = 0; /* disable PID controller */
    }
}


/* unpack host package, no test */
void UnpackHostPackage(sNios_s *sNios){
     /*--------------Uart接收資料(Host -> Nios) begin-----------
     * Uart資料:
     * 起始封包(1byte): 0xAA
     * 狀態位元(1Byte): bit0: 上一筆的RX資料CRC有錯
     * 4顆馬達方向(1bytes): {4'b0000, MD(1bit), MC(1bit), MB(1bit), MA(1bit)}
     * 4顆馬達速度(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
     * CRC(1byte): 以上10bytes相加後取最低那個Byte當檢查碼
     * 結束位元(1byte): 0xEE
     * 總共 13bytes
     *--------------Uart接收資料(Host -> Nios) end-----------*/
    unsigned int idx;
    unsigned char cTmp;

    idx = sNios->sUart0.uiRxBuf_Head+1;
    /* 1st byte, status */
    cTmp = sNios->sUart0.ucRxBuf[idx]; idx++;
    status_report(sNios,cTmp);

    /* 2nd byte */
    cTmp = sNios->sUart0.ucRxBuf[idx]; idx++; /* 2nd byte, motor direction */
//    LOGD("RxDir = 0x%x\n", sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head+2]);
    sNios->sMotor.sMotorAp.uiHostMotorDirCmd =  cTmp&0x01;     /* store motor A direction */
    sNios->sMotor.sMotorBp.uiHostMotorDirCmd = (cTmp&0x02)>>1; /* store motor B direction */
    sNios->sMotor.sMotorCp.uiHostMotorDirCmd = (cTmp&0x04)>>2; /* store motor C direction */
    sNios->sMotor.sMotorDp.uiHostMotorDirCmd = (cTmp&0x08)>>3; /* store motor D direction */

    /* 3~10, total 8 bytes */
    sNios->sMotor.sMotorAp.uiHostMotorSpdCmd = (sNios->sUart0.ucRxBuf[idx]<<8) + sNios->sUart0.ucRxBuf[idx+1]; idx+=2; /* motor A Spd command (high byte, low byete)*/
    sNios->sMotor.sMotorBp.uiHostMotorSpdCmd = (sNios->sUart0.ucRxBuf[idx]<<8) + sNios->sUart0.ucRxBuf[idx+1]; idx+=2; /* motor B Spd command (high byte, low byete)*/
    sNios->sMotor.sMotorCp.uiHostMotorSpdCmd = (sNios->sUart0.ucRxBuf[idx]<<8) + sNios->sUart0.ucRxBuf[idx+1]; idx+=2; /* motor C Spd command (high byte, low byete)*/
    sNios->sMotor.sMotorDp.uiHostMotorSpdCmd = (sNios->sUart0.ucRxBuf[idx]<<8) + sNios->sUart0.ucRxBuf[idx+1]; idx+=2; /* motor D Spd command (high byte, low byete)*/
    /* 11th, crc byte */
    sNios->cFlagUnpackHostComplete = 1; /* set unpack host data complete */

//    LOGD("0x%x\n", sNios->sPID_MA.uiSpdCntCmd, sNios->sUart0.ucRxBuf[3], sNios->sUart0.ucRxBuf[4]);
}
/* put Nios data to uart package, no test */
void UnPackUartDataFromHost(sNios_s *sNios){
    unsigned int  i;
    unsigned char ucCRC; /* CRC check code */

    sNios->cFlagHostDataIn = 1;
    while( (sNios->sUart0.uiRxBuf_End - sNios->sUart0.uiRxBuf_Head) >= UartPackageRXLengthFromHost-1 ){/*check package length*/
        /* check package frame */
        if( sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head] == UartPackageFrameHead){ /* frame begin byte */
            if(sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head + UartPackageRXLengthFromHost-1] == UartPackageFrameEnd){ /* frame end byte */
                /* frame correct and check CRC code */
                for(i = sNios->sUart0.uiRxBuf_Head+1, ucCRC = 0; i <(sNios->sUart0.uiRxBuf_Head + UartPackageRXLengthFromHost-2); i++){
                    ucCRC +=  sNios->sUart0.ucRxBuf[i];
                }
                ucCRC &= 0xff;
                if(ucCRC == sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head + UartPackageRXLengthFromHost-2]) { /* check CRC */
//                    LOGD("Receive correct host data and start to unpack data.\n");
                    UnpackHostPackage(sNios);
                    sNios->sUart0.uiRxBuf_Head +=  UartPackageRXLengthFromHost; /* add package length */
                }else{
                    LOGD("Receive package (RX_buf[...]) CRC error. \n");
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
    unsigned int i,j;

    for(j=1, i= sNios->sUart0.uiTxBuf_Head, ucCRC = 0;  j < UartPackageLengthToHost-1-1; j++){
         /* calculate crc value in Txbuf[UartPackageLengthToHost], not include UartPackageFrameHead, CRC, UartPackageFrameEnd */
        ucCRC +=  sNios->sUart0.ucTxBuf[i+j];
    }
    return ucCRC & 0xff;
}
/* Calculate Uart RX crc */
unsigned char UarRxCrcCal(sNios_s *sNios){
    unsigned char ucCRC;
    unsigned int i,j;

    for(j=1, i= sNios->sUart0.uiRxBuf_Head, ucCRC = 0;  j < UartPackageRXLengthFromHost-1-1; j++) {
         /* calculate crc value in Txbuf[UartPackageLengthToHost], not include UartPackageFrameHead, CRC, UartPackageFrameEnd */
//        LOGD("0x%x ", sNios->sUart0.ucRxBuf[i+j]);
        ucCRC +=  sNios->sUart0.ucRxBuf[i+j];
    }
//    LOGD("\nCRC=0x%x\n", ucCRC & 0xff);
    return ucCRC & 0xff;

}


/* send txbuf to host via UART0 */
void UartTxbufProcess( sNios_s *sNios)
{
	/* 確認TX_buf是否ready。
	 *  */
    char ret;
    //        LOGD("T");
    if(sNios->sUart0.cTXbufRdy){ /* check Tx_buf is ready or not?*/
        if (sNios->sUart0.uiTxBuf_End > sNios->sUart0.uiTxBuf_Head) { /* check length */
            ret = SendUart(&sNios->sUart0, sNios->sUart0.ucTxBuf[sNios->sUart0.uiTxBuf_Head]);
//            LOGD("End=%d, %d, %d\n ",  sNios->sUart0.uiTxBuf_End, ret, sNios->sUart0.uiTxBuf_Head);
            if(ret == -1){
//                LOGD("B");
                /* send data failure */
                #ifdef DEBUG_MESSAGE
                    LOGD("[MSG]Uart0 have exception condition.");
                #endif
            } else if(ret == 1){ /* send successful, and increase TX head index */
//                LOGD("0x%x ", sNios->sUart0.ucTxBuf[sNios->sUart0.uiTxBuf_Head]);
                sNios->sUart0.uiTxBuf_Head++;
            } else {
                /* UART busy, and wait*/
//                LOGD("C");
                #ifdef DEBUG_MESSAGE
                    // LOGD("[MSG]Uart0 is busy to transmit data.\n");
                #endif
            }
        }
    }
    if(sNios->sUart0.uiTxBuf_Head == sNios->sUart0.uiTxBuf_End){
//        LOGD("\n");
        sNios->cFlagPackDataToHost = 0; /* clear */
        /* no data need to send */
        sNios->sUart0.uiTxBuf_Head = 0 ;
        sNios->sUart0.uiTxBuf_End = 0;
        sNios->sUart0.cTXbufRdy = 0;
    }
}
/* Uart0 RxBuf process*/
void UartRxbufProcess(sNios_s *sNios) {
	/* 確認RX_buf內是否有資料，如果有的話就確認是否有大於封包的大小。
	 * 有的話在確認封包的封頭跟封尾，是的話就進入CRC檢查，對的話在解封包*/
    unsigned char crc;


    sNios->cFlagHostDataIn = 0; /* no host data */
    if(sNios->sUart0.uiRxBuf_End  > (sNios->sUart0.uiRxBuf_Head+(UartPackageRXLengthFromHost-1) )) { /* check a package length from host */
        if(sNios->sUart0.uiRxBuf_End < sNios->sUart0.uiRxBuf_Head){ /* 檢查是否overflow */
            LOGD("Head=%d, End=%d\n",sNios->sUart0.uiRxBuf_Head, sNios->sUart0.uiRxBuf_End);
            LOGD("RXbuf error.\n");
        }
        if(sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head] == UartPackageFrameHead) { /* find frame head */
            if(sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head + UartPackageRXLengthFromHost - 1] == UartPackageFrameEnd) { /* find frame end */
                /* find a UartPackage form Host */
                crc = UarRxCrcCal(sNios);  /* calculate CRC */
                if(crc == sNios->sUart0.ucRxBuf[sNios->sUart0.uiRxBuf_Head + UartPackageRXLengthFromHost - 2]){ /* crc check */
//                          LOGD(".");
//                        LOGD("\n[MSG]RBuf=");
//                        for(i=0; i < UartPackageRXLengthFromHost;i++){
//                            LOGD("0x%2x, ", sNios->sUart0.ucRxBuf[i]);
//                        }
//                        LOGD("\n");
                          sNios->cFlagHostDataIn = 1; /* no host data In*/
                          UnpackHostPackage(sNios);
                          sNios->ucLedRcvHostPackage = 1; /* 3rd LED on*/
//                          LOGD("Head=%d, End=%d\n",sNios->sUart0.uiRxBuf_Head, sNios->sUart0.uiRxBuf_End);
                } else {
//                    LOGD("X\n");
//                    sNios->ucLedRcvHostPackage = 0; /* 3rd LED off*/
//                    LOGD("[MSG]%4d RX frame data CRC error.(0x%x)\n", sNios->sTimer0.uiTICnt, crc);
                }
                sNios->sUart0.uiRxBuf_Head +=  UartPackageRXLengthFromHost; /* add package length */
            }else {
//                sNios->ucLedRcvHostPackage = 0; /* 3rd LED off*/
                sNios->sUart0.uiRxBuf_Head++; /* increase index*/
            }
        }else{
            /* not frame head */
//            sNios->ucLedRcvHostPackage = 0; /* 3rd LED off*/
            sNios->sUart0.uiRxBuf_Head++; /* increase index*/
        }
    }else{
//        sNios->ucLedRcvHostPackage = 0; /* 3rd LED off*/
    }

    if(sNios->sUart0.uiRxBuf_Head == sNios->sUart0.uiRxBuf_End){
        /* no data need to process */
        sNios->sUart0.uiRxBuf_Head = 0 ;
        sNios->sUart0.uiRxBuf_End = 0;
    }

    { /* for test led */
//    if(sNios->sTimer0.uiTICnt %30 ==0){
//        sNios->cFlagHostDataIn = 1; /* no host data In*/
//    }
    }


    /* LED control */
    if( sNios->cFlagHostDataIn ) {
        sNios->uiRecvHostPackageTimeCnt = 0;
        sNios->ucLedRcvHostPackage = 1; /* light led */
    } else if(sNios->uiRecvHostPackageTimeCnt > 10000){
        sNios->ucLedRcvHostPackage = 0; /* off led*/
    }else{
        sNios->uiRecvHostPackageTimeCnt++;
    }
    /* LED control end */
//    LOGD("Head=%d, End=%d\n",sNios->sUart0.uiRxBuf_Head, sNios->sUart0.uiRxBuf_End);
}


/* put Nios data to uart package */
void PackUartDataToHost(sNios_s *sNios){
    int i, idx;
    unsigned int uiTmp;
    unsigned char ucCRC; /* CRC check code */

/*--------------Uart回傳資料(Nios -> Host) begin-----------
 * 起始封包(1byte): 0xAA
 * TimeStamp(3Byte): 時間戳記(MSB,...,LSB)
 * 狀態位元(1Byte): bit0: 上一筆的Host的TX資料 CRC有錯
 * 4顆馬達PWM(4bytes): PWMA(1Bytes), PWMB(1Bytes), PWMC(1Bytes), PWMD(1Bytes)
 * 4顆馬達回授的方向(1bytes): {4'b0000, MD(1bit), MC(1bit), MB(1bit), MA(1bit)}
 * 4顆馬達Encoder(16bytes): MA(int_4bytes), MB(int_4bytes), MC(int_4bytes), MD(int_4bytes)
 * 4顆馬達回授速度(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
 * 4顆馬達回授電壓(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
 * 4顆馬達回授電流(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
 * IMU Accelerometer(4Bytes): {Z[29:20],Y[19:10],X[9:0]}
 * IMU GyroScope(4Bytes): {Z[29:20],Y[19:10],X[9:0]}
 * IMU Magneticmeter(4Bytes): {Z[29:20],Y[19:10],X[9:0]}
 * CRC(1byte): 以上61bytes相加後取最低那個Byte當檢查碼，不包含(封包頭)
 * 結束位元(1byte): 0xEE
 * 以上Nios封包總共64Bytes
 * ------------Uartt回傳資料(Nios -> Host) end---------*/
#ifdef UART_TX_Test
    /* fill test data */
    for(i=0, ucCRC = 0; i<UartPackageLengthToHost; i++){
        sNios->sUart0.ucTxBuf[i]=i;
    }
    /* calculate CRC */
    for(i=1, ucCRC = 0; i < UartPackageLengthToHost-2; i++){
        ucCRC +=  sNios->sUart0.ucTxBuf[i];
    }
    sNios->sUart0.ucTxBuf[0]  = UartPackageFrameHead;  /* add package head */
//    sNios->sUart0.ucTxBuf[13] = 0xBE;  /* add package head */
    sNios->sUart0.ucTxBuf[UartPackageLengthToHost-2] = (unsigned char) (ucCRC & 0xff);  /* add CRC */
    sNios->sUart0.ucTxBuf[UartPackageLengthToHost-1] = UartPackageFrameEnd; /*  add package end */
    sNios->sUart0.uiTxBuf_Head = 0;
    sNios->sUart0.uiTxBuf_End = UartPackageLengthToHost;
//    for(i=0;)
//    LOGD("\nTxCRC=0x%x", ucCRC);
#else
    if((sNios->cFlagPackDataToHost == 1)&&(sNios->sUart0.cTXbufRdy==0)){ /* start to pack data */
        idx=sNios->sUart0.uiTxBuf_End;
        sNios->sUart0.ucTxBuf[idx] = UartPackageFrameHead; idx++;                                              /* [0] package head */
        sNios->sUart0.ucTxBuf[idx] = sNios->sTimer0.uiTICnt >>16 & 0xff; idx++;                /* [1] Timer interrupt Counter(3rd Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sTimer0.uiTICnt >>8 & 0xff; idx++;                 /* [2] Timer interrupt Counter(2nd Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sTimer0.uiTICnt & 0xff; idx++;                     /* [3] Timer interrupt Counter(LSB Byte) */
        sNios->sUart0.ucTxBuf[idx] = 0; idx++;                                                                 /* [4] Status byte */
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorAp.ucMotorPWM & 0xff; idx++;          /* [5] motor A PWM_CMD present value (1 Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorBp.ucMotorPWM & 0xff; idx++;          /* [6] motor B PWM_CMD present value (1 Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorCp.ucMotorPWM & 0xff; idx++;          /* [7] motor C PWM_CMD present value (1 Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorDp.ucMotorPWM & 0xff; idx++;          /* [8] motor D PWM_CMD present value (1 Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.uiR02MotorFBDir & 0xff; idx++;              /* [9] motor feedback direction */

//        LOGD("TxDir=%x \n", sNios->sUart0.ucTxBuf[9]);
//        LOGD("ENC=%x\n", sNios->sMotor.sMotorAp.iMotorFBEncoder);
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorAp.iMotorFBEncoder>>24 & 0xff; idx++; /* [10] motor A feedback direction(4th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorAp.iMotorFBEncoder>>16 & 0xff; idx++; /* [11] motor A feedback direction(3rd Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorAp.iMotorFBEncoder>>8 & 0xff; idx++;  /* [12] motor A feedback direction(2nd Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorAp.iMotorFBEncoder & 0xff; idx++;     /* [13] motor A feedback direction(1st Byte) */
//        LOGD("ENC=%x %x", sNios->sUart0.ucTxBuf[10], sNios->sUart0.ucTxBuf[11]);
//        LOGD("ENC=%x %x\n", sNios->sUart0.ucTxBuf[12], sNios->sUart0.ucTxBuf[13]);
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorBp.iMotorFBEncoder>>24 & 0xff; idx++; /* [14] motor B feedback direction(4th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorBp.iMotorFBEncoder>>16 & 0xff; idx++; /* [15] motor B feedback direction(3rd Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorBp.iMotorFBEncoder>>8 & 0xff; idx++;  /* [16] motor B feedback direction(2nd Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorBp.iMotorFBEncoder & 0xff; idx++;     /* [17] motor B feedback direction(1st Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorCp.iMotorFBEncoder>>24 & 0xff; idx++; /* [18] motor C feedback direction(4th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorCp.iMotorFBEncoder>>16 & 0xff; idx++; /* [19] motor C feedback direction(3rd Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorCp.iMotorFBEncoder>>8 & 0xff; idx++;  /* [20] motor C feedback direction(2nd Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorCp.iMotorFBEncoder & 0xff; idx++;     /* [21] motor C feedback direction(1st Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorDp.iMotorFBEncoder>>24 & 0xff; idx++; /* [22] motor D feedback direction(4th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorDp.iMotorFBEncoder>>16 & 0xff; idx++; /* [23] motor D feedback direction(3rd Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorDp.iMotorFBEncoder>>8 & 0xff; idx++;  /* [24] motor D feedback direction(2nd Byte) */
        sNios->sUart0.ucTxBuf[idx] = sNios->sMotor.sMotorDp.iMotorFBEncoder & 0xff; idx++;     /* [25] motor D feedback direction(1st Byte) */
        if(sNios->sMotor.sMotorAp.uiMotorFBSpeedAccCnt ==0){
//            LOGD("Error Spd.\n");
            uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorAp.uiMotorFBSpeedAcc / sNios->sMotor.sMotorAp.uiMotorFBSpeedAccCnt;
            sNios->sMotor.sMotorAp.uiMotorFBSpeedAcc =0; sNios->sMotor.sMotorAp.uiMotorFBSpeedAccCnt=0;
        }
        sNios->sUart0.ucTxBuf[idx] = uiTmp>>8 | 0x80; idx++;   /* [26] motor A feedback speed(MsB Byte),+dval*/
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;      /* [27] motor A feedback speed(LSB Byte) */
//        LOGD("Spd= %2x,%2x.\n", sNios->sUart0.ucTxBuf[26], sNios->sUart0.ucTxBuf[27]);
        if(sNios->sMotor.sMotorBp.uiMotorFBSpeedAccCnt ==0){
//            LOGD("Error Spd.\n");
            uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorBp.uiMotorFBSpeedAcc / sNios->sMotor.sMotorBp.uiMotorFBSpeedAccCnt;
            sNios->sMotor.sMotorBp.uiMotorFBSpeedAcc =0; sNios->sMotor.sMotorBp.uiMotorFBSpeedAccCnt=0;
        }
        sNios->sUart0.ucTxBuf[idx] = uiTmp>>8 | 0x80; idx++;   /* [28] motor B feedback speed(MSB Byte),+dval */
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;      /* [29] motor B feedback speed(LSB Byte) */
        if(sNios->sMotor.sMotorCp.uiMotorFBSpeedAccCnt ==0){
//            LOGD("Error Spd.\n");
            uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorCp.uiMotorFBSpeedAcc / sNios->sMotor.sMotorCp.uiMotorFBSpeedAccCnt;
            sNios->sMotor.sMotorCp.uiMotorFBSpeedAcc =0; sNios->sMotor.sMotorCp.uiMotorFBSpeedAccCnt=0;
        }
        sNios->sUart0.ucTxBuf[idx] = uiTmp>>8 | 0x80; idx++;   /* [30] motor C feedback speed(MSB Byte),+dval*/
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;      /* [31] motor C feedback speed(LSB Byte) */
        if(sNios->sMotor.sMotorDp.uiMotorFBSpeedAccCnt ==0){
//            LOGD("Error Spd.\n");
            uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorDp.uiMotorFBSpeedAcc / sNios->sMotor.sMotorDp.uiMotorFBSpeedAccCnt;
            sNios->sMotor.sMotorDp.uiMotorFBSpeedAcc =0; sNios->sMotor.sMotorDp.uiMotorFBSpeedAccCnt=0;
        }
        sNios->sUart0.ucTxBuf[idx] = uiTmp>>8 | 0x80; idx++;   /* [32] motor D feedback speed(MSB Byte), +dval */
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;      /* [33] motor D feedback speed(LSB Byte) */
        if(sNios->sMotor.sMotorAp.uiMotorFBVoltageAccCnt ==0){
//            LOGD("Error Voltage A.\n");
            uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorAp.uiMotorFBVoltageAcc / sNios->sMotor.sMotorAp.uiMotorFBVoltageAccCnt;
            sNios->sMotor.sMotorAp.uiMotorFBVoltageAcc =0; sNios->sMotor.sMotorAp.uiMotorFBVoltageAccCnt=0;
        }

        sNios->sUart0.ucTxBuf[idx] = uiTmp>>8 & 0xff; idx++;        /* [34] motor A feedback Voltage(MsB Byte)*/
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;           /* [35] motor A feedback Voltage(LSB Byte) */
//        LOGD(" %2x,%2x(v)",sNios->sUart0.ucTxBuf[34] , sNios->sUart0.ucTxBuf[35] );

        if(sNios->sMotor.sMotorBp.uiMotorFBVoltageAccCnt ==0){
//            LOGD("Error Voltage B.\n");
            uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorBp.uiMotorFBVoltageAcc / sNios->sMotor.sMotorBp.uiMotorFBVoltageAccCnt;
            sNios->sMotor.sMotorBp.uiMotorFBVoltageAcc =0; sNios->sMotor.sMotorBp.uiMotorFBVoltageAccCnt=0;
        }
        sNios->sUart0.ucTxBuf[idx] = uiTmp>>8 & 0xff; idx++;        /* [36] motor B feedback Voltage(MSB Byte) */
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;           /* [37] motor B feedback Voltage(LSB Byte) */

        if(sNios->sMotor.sMotorCp.uiMotorFBVoltageAccCnt ==0){
//            LOGD("Error Voltage C.\n");
            uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorCp.uiMotorFBVoltageAcc / sNios->sMotor.sMotorCp.uiMotorFBVoltageAccCnt;
            sNios->sMotor.sMotorCp.uiMotorFBVoltageAcc =0; sNios->sMotor.sMotorCp.uiMotorFBVoltageAccCnt=0;
        }

        sNios->sUart0.ucTxBuf[idx] = uiTmp>>8 & 0xff; idx++;        /* [38] motor C feedback Voltage(MSB Byte)*/
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;           /* [39] motor C feedback Voltage(LSB Byte) */
        if(sNios->sMotor.sMotorDp.uiMotorFBVoltageAccCnt ==0){
//            LOGD("Error Voltage D.\n");
            uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorDp.uiMotorFBVoltageAcc / sNios->sMotor.sMotorDp.uiMotorFBVoltageAccCnt;
            sNios->sMotor.sMotorDp.uiMotorFBVoltageAcc =0; sNios->sMotor.sMotorDp.uiMotorFBVoltageAccCnt=0;
        }
        sNios->sUart0.ucTxBuf[idx] = uiTmp>>8 & 0xff; idx++;        /* [40] motor D feedback Voltage(MSB Byte) */
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;           /* [41] motor D feedback Voltage(LSB Byte) */
        if(sNios->sMotor.sMotorAp.uiMotorFBCurrentAccCnt ==0){
//            LOGD("Error Current A.\n");
            uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorAp.uiMotorFBCurrentAcc / sNios->sMotor.sMotorAp.uiMotorFBCurrentAccCnt;
            sNios->sMotor.sMotorAp.uiMotorFBCurrentAcc =0; sNios->sMotor.sMotorAp.uiMotorFBCurrentAccCnt=0;
        }

        sNios->sUart0.ucTxBuf[idx] = uiTmp>>8 & 0xff; idx++;        /* [42] motor A feedback Current(MsB Byte)*/
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;           /* [43] motor A feedback Current(LSB Byte) */
//        LOGD("%2x,%2x(I)\n",sNios->sUart0.ucTxBuf[42] , sNios->sUart0.ucTxBuf[43] );
        if(sNios->sMotor.sMotorBp.uiMotorFBCurrentAccCnt ==0){
//            LOGD("Error Current B.\n");
            uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorBp.uiMotorFBCurrentAcc / sNios->sMotor.sMotorBp.uiMotorFBCurrentAccCnt;
            sNios->sMotor.sMotorBp.uiMotorFBCurrentAcc =0; sNios->sMotor.sMotorBp.uiMotorFBCurrentAccCnt=0;
        }

        sNios->sUart0.ucTxBuf[idx] = uiTmp>>8 & 0xff; idx++;        /* [44] motor B feedback Current(MSB Byte) */
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;           /* [45] motor B feedback Current(LSB Byte) */
        if(sNios->sMotor.sMotorCp.uiMotorFBCurrentAccCnt ==0){
//            LOGD("Error Current C.\n");
            uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorCp.uiMotorFBCurrentAcc / sNios->sMotor.sMotorCp.uiMotorFBCurrentAccCnt;
            sNios->sMotor.sMotorCp.uiMotorFBCurrentAcc =0; sNios->sMotor.sMotorCp.uiMotorFBCurrentAccCnt=0;
        }

        sNios->sUart0.ucTxBuf[idx] = uiTmp >>8 & 0xff; idx++;        /* [46] motor C feedback Current(MSB Byte)*/
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;           /* [47] motor C feedback Current(LSB Byte) */

        if(sNios->sMotor.sMotorDp.uiMotorFBCurrentAccCnt ==0){
//            LOGD("Error Current D.\n");
        uiTmp = 0;
        }else{
            uiTmp = sNios->sMotor.sMotorDp.uiMotorFBCurrentAcc / sNios->sMotor.sMotorDp.uiMotorFBCurrentAccCnt;
            sNios->sMotor.sMotorDp.uiMotorFBCurrentAcc =0; sNios->sMotor.sMotorDp.uiMotorFBCurrentAccCnt=0;
        }

        sNios->sUart0.ucTxBuf[idx] = uiTmp>>8 & 0xff; idx++;        /* [48] motor D feedback Current(MSB Byte) */
        sNios->sUart0.ucTxBuf[idx] = uiTmp & 0xff; idx++;           /* [49] motor D feedback Current(LSB Byte) */

        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawAcce>>24 & 0xff; idx++;                  /* [50] IMU Accelerometer (4th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawAcce>>16 & 0xff; idx++;                  /* [51] IMU Accelerometer (3th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawAcce>>8 & 0xff; idx++;                   /* [52] IMU Accelerometer (2th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawAcce & 0xff; idx++;                      /* [53] IMU Accelerometer (1th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawGyro>>24 & 0xff; idx++;                  /* [54] IMU Gyroscope (4th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawGyro>>16 & 0xff; idx++;                  /* [55] IMU Gyroscope (3th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawGyro>>8 & 0xff; idx++;                   /* [56] IMU Gyroscope (2th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawGyro & 0xff; idx++;                      /* [57] IMU Gyroscope (1th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawMagn>>24 & 0xff; idx++;                  /* [58] IMU Magneticmeter (4th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawMagn>>16 & 0xff; idx++;                  /* [59] IMU Magneticmeter (3th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawMagn>>8 & 0xff; idx++;                   /* [60] IMU Magneticmeter (2th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = sNios->sIMU.uiRawMagn & 0xff; idx++;                      /* [61] IMU Magneticmeter (1th Byte)*/
        /* generate crc code */
        for(i=1, ucCRC = 0; i < UartPackageLengthToHost-2; i++){
            ucCRC +=  sNios->sUart0.ucTxBuf[i];
        }
    //    LOGD("\nTxCRC=0x%x\n", ucCRC&0xff);
        sNios->sUart0.ucTxBuf[idx] = ucCRC; idx++;        /* [62] IMU Magneticmeter (1th Byte)*/
        sNios->sUart0.ucTxBuf[idx] = UartPackageFrameEnd; /* [63] package end */
//        sNios->sUart0.uiTxBuf_Head = 0;
        sNios->sUart0.uiTxBuf_End += UartPackageLengthToHost;
        sNios->sUart0.cTXbufRdy = 1; /* set tx data ready to send */
    }

#endif
}

void ShowStatusLed(sNios_s *sNios){     /* show status LED */
       /* 1st LED: Error
        * 2nd LED: reserve
        * 3rd LED: receive Host package
        * 4th LED: Nios life
        * */
    #ifdef LEDG_NAME

        sNios->ucLedError = 0;

        sNios->ucLedNiosLife = sNios->sTimer0.ucLEDNiosLife;
        sNios->ucLedStatus = sNios->ucLedError |             /* 1st LED: Error*/   \
                             sNios->ucLedRcvHostPackage <<2 | /* 3rd LED: Receive Host package */ \
                             sNios->ucLedNiosLife<<3;      /* 4th LED: Nios life */
        IOWR(LEDG_BASE, 0, sNios->ucLedStatus); /* show LED*/
    #else
        LOGD("[Warning]No Status Led.\n");
    #endif
}

/* Let robot run circle round*/
void SelfCircleRunTest(sNios_s *sNios){

    LOGD("This function is for testing robot move ability!\n");

    Send4XwheelDir(&sNios->sMotor, 0, 0, 0, 0);      /* send motor direction, 0:CW, 1:CCW  */
    Send4XwheelPwm(&sNios->sMotor, 50, 50, 50, 50);  /* send motor PWM duty cycle, 0~100 */
    Send2XMotorDriverEnable(&sNios->sMotor, 1, 1);   /* open motor driver, 1: enable, 0: disable */
    usleep(3000000);  /* delay time */
    Send4XwheelDir(&sNios->sMotor, 1, 1, 1, 1);      /* send motor direction, 0:CW, 1:CCW  */
    Send4XwheelPwm(&sNios->sMotor, 50, 50, 50, 50);  /* send motor PWM duty cycle, 0~100 */
    Send2XMotorDriverEnable(&sNios->sMotor, 1, 1);   /* open motor driver, 1: enable, 0: disable */
    usleep(3000000);  /* delay time */
    Send4XwheelDir(&sNios->sMotor, 0, 0, 0, 0);     /* send motor direction, 0:CW, 1:CCW  */
    Send4XwheelPwm(&sNios->sMotor, 0, 0, 0, 0); /* send motor PWM duty cycle, 0~100 */
    Send2XMotorDriverEnable(&sNios->sMotor, 1, 1);   /* open motor driver, 1: enable, 0: disable */
}

void TimeDely(sNios_s *sNios, unsigned int delaytimeCnt){ /* delay time, unit(ms) */
    unsigned int uiTmp;

    uiTmp = sNios->sTimer0.uiTICnt;

    while((sNios->sTimer0.uiTICnt - uiTmp) < delaytimeCnt);

}
