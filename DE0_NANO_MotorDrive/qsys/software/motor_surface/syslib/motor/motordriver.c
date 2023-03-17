#include "motordriver.h"
/*  暫存器說明 */
// reg    [31:0]  r00PWMDUTY;          /* motor pwm duty X4
//                                        [6:0]:   motor A PWM 0~100
//                                        [13:7]:  motor B PWM 0~100
//                                        [20:14]: motor C PWM 0~100
//                                        [27:21]: motor D PWM 0~100
//                                        [31]   : pwm duty dval trigger
//                                     */
// reg    [31:0]  r01MotorDriverDirection;   /* export to motor driver  direction control,
//                                              [1:0]: motor A
//                                              [3:2]: motor B
//                                              [5:4]: motor C
//                                              [7:6]: motor D
//                                     */
// reg    [31:0]  r02MotorFBDir;       /* motor Feedback direction,
//                                              [0]: motor A feedback direction, 1:CW, 0::CCW
//                                              [1]: motor B feedback direction, 1:CW, 0::CCW
//                                              [2]: motor C feedback direction, 1:CW, 0::CCW
//                                              [3]: motor D feedback direction, 1:CW, 0::CCW
//                                     */
// reg    [31:0]  r03MotorControl;     /* clear 4motor accumulate feedback counter,
//                                        [0]: clear motor A feedback Accumulate counter
//                                        [1]: clear motor B feedback Accumulate counter
//                                        [2]: clear motor C feedback Accumulate counter
//                                        [3]: clear motor D feedback Accumulate counter
//                                        [30:4]: reserve.
//                                        [31]: clear all fifo data;(include motor fb counter, speed, sensor fifo)
//                                     */
// wire   [31:0]  w04MotorFifoStatus;     /* motor fifo status register,
//                                        [0]:  Motor A Speed fifo status, (1: indicated fifo not empty)
//                                        [1]:  Motor B Speed fifo status, (1: indicated fifo not empty)
//                                        [2]:  Motor C Speed fifo status, (1: indicated fifo not empty)
//                                        [3]:  Motor D Speed fifo status, (1: indicated fifo not empty)
//                                        [7:4] reserve
//                                        [8]:  Motor A voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [9]:  Motor A current sensor fifo status, (1: indicated fifo not empty)
//                                        [10]: Motor B voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [11]: Motor B current sensor fifo status, (1: indicated fifo not empty)
//                                        [12]: Motor C voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [13]: Motor C current sensor fifo status, (1: indicated fifo not empty)
//                                        [14]: Motor D voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [15]: Motor D current sensor fifo status, (1: indicated fifo not empty)
//                                        [30:16]: reserve.
//                                     */
// reg    [31:0]  r05MotorReg;        /* reserve */
// reg    [31:0]  r06MotorReg;        /* reserve */
//
/* reg    [31:0]  rMotorFBCnt[3:0];  // four motor feedback accumulate counter, signed number
                                        reg 7:  motro A feedback accumulate counter
                                        reg 12: motro A feedback accumulate counter
                                        reg 17: motro A  eedback accumulate counter
                                        reg 22: motro A feedback accumulate counter
*/
/* wire   [31:0]  wMotorSpeed[3:0];     four motor Speed, [31] reflash data flag
 *                                      reg 8:  motro A speed counter
                                        reg 13: motro B speed counter
                                        reg 18: motro C speed counter
                                        reg 23: motro D speed counter
 *
 * */
/* reg    [31:0]  rMotorSensor[3:0];  four motor -> voltage,
 *                                      reg 9:  motro A Voltage [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
                                        reg 14: motro B Voltage [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
                                        reg 19: motro C Voltage [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
                                        reg 24: motro D Voltage [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
 * */
/* reg    [31:0]  rMotorSensor[3:0];  four motor -> current,
 *                                      reg 10: motro A current [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
                                        reg 15: motro B current [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
                                        reg 20: motro C current [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
                                        reg 25: motro D current [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
 * */

void Send4XwheelPwm(sMotor_s *sMotor, unsigned int PWM1, unsigned int PWM2,  \
                   unsigned int PWM3, unsigned int PWM4);  /* send 4 wheel pwm */
void Send4XwheelDir(sMotor_s *sMotor, unsigned int uiWheelDir1, unsigned int uiWheelDir2, \
                   unsigned int uiWheelDir3, unsigned int uiWheelDir4); /* send 4 wheel direction  */
void Send2XMotorDriverEnable(sMotor_s *sMotor, unsigned int uiDriver1, unsigned int uiDriver2);  /* send motor driver enable */
void Send4XClrMotorEncoder(sMotor_s *sMotor, unsigned int uiME1, unsigned int uiME2, \
                         unsigned int uiME3, unsigned int uiME4); /* send clear command for 4 wheel encoder counter */
/* read sensor */
void Read4XMotorDir(sMotor_s *sMotor);    /* read motor direction */
void Read4XMotorEncoder(sMotor_s *sMotor);/* read motor feedback encoder */
void Read4XMotorSpeed(sMotor_s *sMotor);  /* read motor speed */
void Read4XMotorSensor(sMotor_s *sMotor); /* read motor voltage and current */
void MotorTestFun(sMotor_s *sMotor );     /* test motor fundamental function. */
void MotorDriverInit(sMotor_s *sMotor);   /* motor driver init*/

void InitMotorValue(sMotor_s *sMotor){
    sMotor->sMotorAp.iMotorFBEncoder = 0;
    sMotor->sMotorAp.ucMotorPWM = 0;
    sMotor->sMotorAp.uiCurrent = 0;
    sMotor->sMotorAp.uiMotorFBDir = 0;
    sMotor->sMotorAp.uiMotorFBSpeed = 0;
    sMotor->sMotorAp.uiVoltage = 0;

    sMotor->sMotorBp.iMotorFBEncoder = 0;
    sMotor->sMotorBp.ucMotorPWM = 0;
    sMotor->sMotorBp.uiCurrent = 0;
    sMotor->sMotorBp.uiMotorFBDir = 0;
    sMotor->sMotorBp.uiMotorFBSpeed = 0;
    sMotor->sMotorBp.uiVoltage = 0;

    sMotor->sMotorCp.iMotorFBEncoder = 0;
    sMotor->sMotorCp.ucMotorPWM = 0;
    sMotor->sMotorCp.uiCurrent = 0;
    sMotor->sMotorCp.uiMotorFBDir = 0;
    sMotor->sMotorCp.uiMotorFBSpeed = 0;
    sMotor->sMotorCp.uiVoltage = 0;

    sMotor->sMotorDp.iMotorFBEncoder = 0;
    sMotor->sMotorDp.ucMotorPWM = 0;
    sMotor->sMotorDp.uiCurrent = 0;
    sMotor->sMotorDp.uiMotorFBDir = 0;
    sMotor->sMotorDp.uiMotorFBSpeed = 0;
    sMotor->sMotorDp.uiVoltage = 0;
}
void MotorDriverInit(sMotor_s *sMotor){
    Send4XwheelPwm(sMotor, 0, 0, 0, 0);  /* Stop 4 wheel PWM */
    Send4XwheelDir(sMotor, 0, 0, 0, 0);  /* send 4 wheel direction */
    usleep(1000);
    Send2XMotorDriverEnable(sMotor, 1, 1);    /* enable motor driver */
    Send4XClrMotorEncoder(sMotor, 1, 1, 1, 1); /* send clear feedback counter */
    IOWR(SYSREG_BASE, 3, 0);    /* clear 03 register (MotorControl)*/
    InitMotorValue(sMotor);
}

/* 馬達測試程式  */
void MotorTestFun(sMotor_s *sMotor ){

    printf("This is motor test function !\n");

    Send4XwheelDir(sMotor, 0,1,1,1);    /* send motor direction, 0:CW, 1:CCW  */
    Send4XwheelPwm(sMotor, 100,0,0,0);  /* send motor PWM duty cycle, 0~100 */
    Send2XMotorDriverEnable(sMotor,1, 1);  /* open motor driver, 1: enable, 0: disable */
    usleep(10000);  /* delay time */
    Read4XMotorDir( sMotor);    /* read motor feed back direction */
    Read4XMotorEncoder( sMotor);/* read motor feedback encoder */
    Read4XMotorSpeed(sMotor);  /* read motor speed */
    Read4XMotorSensor(sMotor); /* read motor voltage and current */
//    printf("2\n");
//    Send4XwheelDir(sMotor, 0, 1, 1, 1);
//    Send4XwheelPwm(sMotor, 10,0,0,0);
//    Send2XMotorDriverEnable(sMotor,1, 1); /* open driver */
//    usleep(5000000);
//    Read4XMotorDir( sMotor);    /* read motor direction */
//    Read4XMotorEncoder( sMotor);/* read motor feedback encoder */
//    Read4XMotorSpeed( sMotor);  /* read motor speed */
//    Read4XMotorSensor( sMotor); /* read motor voltage and current */
//    printf("===============================\n");

}

void Send4XwheelPwm(sMotor_s *sMotor, unsigned int PWM1, unsigned int PWM2,
                   unsigned int PWM3, unsigned int PWM4){
	unsigned int PMWDuty;

	PMWDuty = TRIGGER | PWM1| (PWM2<<7) | (PWM3<<14) | (PWM4<<21);
//	printf("0x%x\n", PWM1);
	IOWR(SYSREG_BASE, 0, PMWDuty); /* write PWM duty */
	IOWR(SYSREG_BASE, 0, 0);       /* set trigger to 0 */
	sMotor->uiR00MotorPWMduty = PMWDuty;
	/* record pWM*/
	sMotor->sMotorAp.ucMotorPWM = PWM1;
    sMotor->sMotorBp.ucMotorPWM = PWM2;
    sMotor->sMotorCp.ucMotorPWM = PWM3;
    sMotor->sMotorDp.ucMotorPWM = PWM4;
#ifdef DEBUG_MESSAGE
    printf("[Motor Msg][CMD] Motor A,B,C,D PWM -> (%3d,%3d,%3d,%3d)\n", \
                                 sMotor->sMotorAp.ucMotorPWM, \
                                 sMotor->sMotorBp.ucMotorPWM, \
                                 sMotor->sMotorCp.ucMotorPWM, \
                                 sMotor->sMotorDp.ucMotorPWM);
#endif
}

void Send4XwheelDir(sMotor_s *sMotor, unsigned int uiWheelDir1, unsigned int uiWheelDir2,
                   unsigned int uiWheelDir3, unsigned int uiWheelDir4){
	unsigned int uiRegData;

	uiRegData = uiWheelDir1| (uiWheelDir2<<2) | (uiWheelDir3<<4) | (uiWheelDir4<<6);
	IOWR(SYSREG_BASE, 1, uiRegData); /* write motor direction register */
	sMotor->uiR01MotorDriverDirection = uiRegData;
#ifdef DEBUG_MESSAGE
	printf("[Motor Msg][CMD] Send motor direction -> ");
    if(uiWheelDir1 > 0){
        printf("A(CW) ");
    }else {
        printf("A(CCW) ");
    }
    if(uiWheelDir2 > 0){
        printf("B(CW) ");
    }else {
        printf("B(CCW) ");
    }
    if(uiWheelDir3 > 0){
        printf("C(CW) ");
    }else {
        printf("C(CCW) ");
    }
    if(uiWheelDir4 > 0){
        printf("D(CW). \n");
    }else {
        printf("D(CCW). \n");
    }
#endif
}

void Send2XMotorDriverEnable(sMotor_s *sMotor, unsigned int uiDriver1, unsigned int uiDriver2){
    unsigned int uiRegData;

    uiRegData = IORD(SYSREG_BASE, 3); /* read motor control register */
    if(uiDriver1 > 0){
        uiRegData = uiRegData | 0x00000100; /* set driver 1 flag */
    }else {
        uiRegData = uiRegData & 0xfffffeff; /* clear flag */
    }
    if(uiDriver2 > 0){
        uiRegData = uiRegData | 0x00000200; /* set driver 2 flag */
    }else {
        uiRegData = uiRegData & 0xfffffdff; /* clear driver 2 flag */
    }

//  printf("0x%x\n", uiRegData);
    IOWR(SYSREG_BASE, 3, uiRegData); /* write PWM duty */
    sMotor->uiR03MotorControl = uiRegData; /* store R03 */
#ifdef DEBUG_MESSAGE
    printf("[Motor Msg][CMD] Motor driver: ");
    if(uiDriver1 > 0){
        if(uiDriver2 > 0){
            printf(" Enable->(#1, #2).\n");
        }else {
            printf(" Enable(#1), Disable(#2).\n");
        }

    }else {
        if(uiDriver2 > 0){
            printf(" Enable(#2), Disable(#1).\n");
        }else {
            printf(" Disable(#1, #2).\n");
        }
    }
#endif
}

void Send4XClrMotorEncoder(sMotor_s *sMotor, unsigned int uiME1, unsigned int uiME2,
                         unsigned int uiME3, unsigned int uiME4){
    unsigned int uiRegData;

/* r03MotorControl : clear 4motor accumulate feedback counter,
        [0]: clear right motor feedback Accumulate counter
        [1]: clear Bottom motor feedback Accumulate counter
        [2]: clear Left motor feedback Accumulate counter
        [3]: clear Top motor feedback Accumulate counter
        [8]: 1: driver 1 enable, 0: driver 1 disable
        [9]: 1: driver 2 enable, 0: driver 2 disable
*/

    uiRegData = IORD(SYSREG_BASE, 3); /* read motor control register */
    if(uiME1 > 0){
        uiRegData = uiRegData | 0x01;       /* send clear motor A encoder counter command */
    }else {
        uiRegData = uiRegData & 0xFFFFFFFE; /* close clear motor A encoder counter command */
    }
    if(uiME2 > 0){
        uiRegData = uiRegData | 0x02;       /* send clear motor B encoder counter command */
    }else {
        uiRegData = uiRegData & 0xFFFFFFFD; /* close clear motor B encoder counter command */
    }
    if(uiME3 > 0){
        uiRegData = uiRegData | 0x04; /* close clear motor C encoder counter command */
    }else {
        uiRegData = uiRegData & 0xFFFFFFFB; /* close clear motor C encoder counter command */
    }
    if(uiME4 > 0){
        uiRegData = uiRegData | 0x08;       /* send clear motor D encoder counter command */
    }else {
        uiRegData = uiRegData & 0xFFFFFFF7; /* close clear motor D encoder counter command */
    }

//  printf("0x%x\n", iRegData);
    IOWR(SYSREG_BASE, 3, uiRegData); /* send clear motor encoder command  */
    usleep(1);
    IOWR(SYSREG_BASE, 3, uiRegData&0xfffffff0); /* close clear motor encoder command  */
    sMotor->uiR03MotorControl = uiRegData; /* store R03 */
#ifdef DEBUG_MESSAGE
    printf("[Motor Msg][CMD] Reset Motor Encoder counter: \n");
    if(uiME1 > 0){
        printf(" #A(1) ");
    }else {
        printf(" #A(0) ");
    }
    if(uiME2 > 0){
        printf(" #B(1) ");
    }else {
        printf(" #B(0) ");
    }
    if(uiME3 > 0){
        printf(" #C(1) ");
    }else {
        printf(" #C(0) ");
    }
    if(uiME4 > 0){
        printf(" #D(1)\n ");
    }else {
        printf(" #D(0)\n ");
    }
#endif
}

void ClearMotorSensorFifo(sMotor_s *sMotor, unsigned int uiME1, unsigned int uiME2,
                         unsigned int uiME3, unsigned int uiME4){
    IOWR(SYSREG_BASE, 3, 0x80000000); /* send [31] clear fifo command */
    usleep(1);
    IOWR(SYSREG_BASE, 3, 0x00000000); /* send [31] clear fifo command */
#ifdef DEBUG_MESSAGE
    printf("[Motor Msg][CMD] Clear Motor Sensor fifo completed.\n");
#endif
}

void Read4XMotorDir(sMotor_s *sMotor){
    unsigned int uiMotorFBDir;

    uiMotorFBDir = IORD(SYSREG_BASE, 2);

    sMotor->sMotorAp.uiMotorFBDir = uiMotorFBDir      & 0x01;
    sMotor->sMotorBp.uiMotorFBDir = (uiMotorFBDir>>1) & 0x01;
    sMotor->sMotorCp.uiMotorFBDir = (uiMotorFBDir>>2) & 0x01;
    sMotor->sMotorDp.uiMotorFBDir = (uiMotorFBDir>>3) & 0x01;
#ifdef DEBUG_MESSAGE
    printf("[Motor Msg][Sensor] Motor Direction: ");
    printf("A(%6d), B(%6d), C(%6d), D(%6d).\n", sMotor->sMotorAp.uiMotorFBDir, \
                                          sMotor->sMotorBp.uiMotorFBDir, \
                                          sMotor->sMotorCp.uiMotorFBDir, \
                                          sMotor->sMotorDp.uiMotorFBDir);
#endif
}
void Read4XMotorEncoder(sMotor_s *sMotor){

    sMotor->sMotorAp.iMotorFBEncoder = IORD(SYSREG_BASE, 7);
    sMotor->sMotorBp.iMotorFBEncoder = IORD(SYSREG_BASE, 12);
    sMotor->sMotorCp.iMotorFBEncoder = IORD(SYSREG_BASE, 17);
    sMotor->sMotorDp.iMotorFBEncoder = IORD(SYSREG_BASE, 22);
#ifdef DEBUG_MESSAGE
    printf("[Motor Msg][Sensor] Motor Encoder:   ");
    printf("A(%6d), B(%6d), C(%6d), D(%6d).\n", sMotor->sMotorAp.iMotorFBEncoder, \
                                             sMotor->sMotorBp.iMotorFBEncoder, \
                                             sMotor->sMotorCp.iMotorFBEncoder, \
                                             sMotor->sMotorDp.iMotorFBEncoder);
#endif
}
void Read4XMotorSpeed(sMotor_s *sMotor){
    unsigned int uiFifostatus;
// wire   [31:0]  w04MotorFifoStatus;     /* motor fifo status register,
//                                        [0]:  Motor A Speed fifo status, (1: indicated fifo not empty)
//                                        [1]:  Motor B Speed fifo status, (1: indicated fifo not empty)
//                                        [2]:  Motor C Speed fifo status, (1: indicated fifo not empty)
//                                        [3]:  Motor D Speed fifo status, (1: indicated fifo not empty)
//                                        [7:4] reserve
//                                        [8]:  Motor A voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [9]:  Motor A current sensor fifo status, (1: indicated fifo not empty)
//                                        [10]: Motor B voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [11]: Motor B current sensor fifo status, (1: indicated fifo not empty)
//                                        [12]: Motor C voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [13]: Motor C current sensor fifo status, (1: indicated fifo not empty)
//                                        [14]: Motor D voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [15]: Motor D current sensor fifo status, (1: indicated fifo not empty)
//                                        [30:16]: reserve.
//                                     */
    /*-------------read speed ---------------*/
    uiFifostatus = IORD(SYSREG_BASE, 4); /* r04 motor fifo status */
    if(uiFifostatus & 0x01){ /* check motor A speed fifo status */
        sMotor->sMotorAp.uiMotorFBSpeed = IORD(SYSREG_BASE, 8); /* motor A speed counter */
        if(sMotor->sMotorAp.uiMotorFBSpeed > 100000){
            sMotor->sMotorAp.uiMotorFBSpeed = 0xdeadbeef; /* no data */
        }
    }else{
    	sMotor->sMotorAp.uiMotorFBSpeed = 0xdeadbeef; /* no data */
    }
    if(uiFifostatus & 0x02){ /* check motor B speed fifo status */
        sMotor->sMotorBp.uiMotorFBSpeed = IORD(SYSREG_BASE, 13); /* motor A speed counter */
        if(sMotor->sMotorBp.uiMotorFBSpeed > 100000){
            sMotor->sMotorBp.uiMotorFBSpeed = 0xdeadbeef; /* no data */
        }
    }else{
    	sMotor->sMotorBp.uiMotorFBSpeed = 0xdeadbeef; /* no data */
    }
    if(uiFifostatus & 0x04){ /* check motor C speed fifo status */
        sMotor->sMotorCp.uiMotorFBSpeed = IORD(SYSREG_BASE, 18); /* motor A speed counter */
        if(sMotor->sMotorCp.uiMotorFBSpeed > 100000){
            sMotor->sMotorCp.uiMotorFBSpeed = 0xdeadbeef; /* no data */
        }
    }else{
    	sMotor->sMotorCp.uiMotorFBSpeed = 0xdeadbeef; /* no data */
    }
    if(uiFifostatus & 0x08){ /* check motor D speed fifo status */
        sMotor->sMotorDp.uiMotorFBSpeed = IORD(SYSREG_BASE, 23); /* motor A speed counter */
        if(sMotor->sMotorDp.uiMotorFBSpeed > 100000){
            sMotor->sMotorDp.uiMotorFBSpeed = 0xdeadbeef; /* no data */
        }
    }else{
    	sMotor->sMotorDp.uiMotorFBSpeed = 0xdeadbeef; /* no data */
    }
#ifdef DEBUG_MESSAGE
    printf("[Motor Msg][Sensor] Motor Speed:     ");
    printf("A(%6d), B(%6d), C(%6d), D(%6d).\n", sMotor->sMotorAp.uiMotorFBSpeed, \
                                             sMotor->sMotorBp.uiMotorFBSpeed, \
                                             sMotor->sMotorCp.uiMotorFBSpeed, \
                                             sMotor->sMotorDp.uiMotorFBSpeed);

#endif
}
void Read4XMotorSensor(sMotor_s *sMotor){
    unsigned int uiFifostatus;
// wire   [31:0]  w04MotorFifoStatus;     /* motor fifo status register,
//                                        [0]:  Motor A Speed fifo status, (1: indicated fifo not empty)
//                                        [1]:  Motor B Speed fifo status, (1: indicated fifo not empty)
//                                        [2]:  Motor C Speed fifo status, (1: indicated fifo not empty)
//                                        [3]:  Motor D Speed fifo status, (1: indicated fifo not empty)
//                                        [7:4] reserve
//                                        [8]:  Motor A voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [9]:  Motor A current sensor fifo status, (1: indicated fifo not empty)
//                                        [10]: Motor B voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [11]: Motor B current sensor fifo status, (1: indicated fifo not empty)
//                                        [12]: Motor C voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [13]: Motor C current sensor fifo status, (1: indicated fifo not empty)
//                                        [14]: Motor D voltage sensor fifo status, (1: indicated fifo not empty)
//                                        [15]: Motor D current sensor fifo status, (1: indicated fifo not empty)
//                                        [30:16]: reserve.
//                                     */

    /*-------------read voltage & current  ---------------*/
    uiFifostatus = IORD(SYSREG_BASE, 4); /* r04 motor fifo status */
    if(uiFifostatus & 0x0100){ /* check motor A voltage fifo status */
    	sMotor->sMotorAp.uiVoltage = IORD(SYSREG_BASE, 9)&0x0FFF; /* motor A voltage */
    }else{
        sMotor->sMotorAp.uiVoltage = 0xdeedbeef; /* motor A voltage */
    }
    if(uiFifostatus & 0x0200){ /* check motor A current fifo status */
    	sMotor->sMotorAp.uiCurrent = IORD(SYSREG_BASE, 10)&0x0FFF; /* motor A current */
    }else{
        sMotor->sMotorAp.uiCurrent = 0xdeedbeef; /* motor A Current */
    }
    if(uiFifostatus & 0x0400){ /* check motor B voltage fifo status */
        sMotor->sMotorBp.uiVoltage = IORD(SYSREG_BASE, 14)&0x0FFF; /* motor B voltage */
    }else{
        sMotor->sMotorBp.uiVoltage = 0xdeedbeef; /* motor B voltage */
    }
    if(uiFifostatus & 0x0800){ /* check motor B current fifo status */
        sMotor->sMotorBp.uiCurrent = IORD(SYSREG_BASE, 15)&0x0FFF; /* motor B current */
    }else{
        sMotor->sMotorBp.uiCurrent = 0xdeedbeef; /* motor B Current */
    }
    if(uiFifostatus & 0x1000){ /* check motor C voltage fifo status */
    	sMotor->sMotorCp.uiVoltage = IORD(SYSREG_BASE, 19)&0x0FFF; /* motor C voltage */
    }else{
        sMotor->sMotorCp.uiVoltage = 0xdeedbeef; /* motor C voltage */
    }
    if(uiFifostatus & 0x2000){ /* check motor C current fifo status */
    	sMotor->sMotorCp.uiCurrent = IORD(SYSREG_BASE, 20)&0x0FFF; /* motor C current */
    }else{
        sMotor->sMotorCp.uiCurrent = 0xdeedbeef; /* motor C Current */
    }
    if(uiFifostatus & 0x4000){ /* check motor D voltage fifo status */
        sMotor->sMotorDp.uiVoltage = IORD(SYSREG_BASE, 24)&0x0FFF; /* motor D voltage */
    }else{
        sMotor->sMotorDp.uiVoltage = 0xdeedbeef; /* motor D voltage */
    }
    if(uiFifostatus & 0x8000){ /* check motor D current fifo status */
        sMotor->sMotorDp.uiCurrent = IORD(SYSREG_BASE, 25)&0x0FFF; /* motor D current */
    }else{
        sMotor->sMotorDp.uiCurrent = 0xdeedbeef; /* motor D Current */
    }
#ifdef DEBUG_MESSAGE
    printf("[Motor Msg][Sensor] Motor voltage:   ");
    printf("A(%6d), B(%6d), C(%6d), D(%6d).\n", sMotor->sMotorAp.uiVoltage, \
                                             sMotor->sMotorBp.uiVoltage, \
                                             sMotor->sMotorCp.uiVoltage, \
                                             sMotor->sMotorDp.uiVoltage);
    printf("[Motor Msg][Sensor] Motor current:   ");
    printf("A(%6d), B(%6d), C(%6d), D(%6d).\n", sMotor->sMotorAp.uiCurrent, \
                                             sMotor->sMotorBp.uiCurrent, \
                                             sMotor->sMotorCp.uiCurrent, \
                                             sMotor->sMotorDp.uiCurrent);
#endif
}
