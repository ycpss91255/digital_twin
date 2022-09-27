// ============================================================================
// Copyright (c) 2021 by TKU I.C.LAB. 
// ============================================================================
// Major Functions/Design Description:
//
//   sensor register and Motor Control, feedbkac sensor register.
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:      |Mod. Date:    |Changes Made:
//   V1.0  |Shih-An Li  |2021.5.4       | initial 
//   V2.0  |Shih-An Li  |2021.5.30      | add gsensor_top
// ============================================================================

//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================
`default_nettype none
module DE0_NANO(

    //////////// CLOCK //////////
    CLOCK_50,

    //////////// LED //////////
    LED,

    //////////// KEY //////////
    KEY,

    //////////// SW //////////
    SW,

    //////////// SDRAM //////////
    DRAM_ADDR,
    DRAM_BA,
    DRAM_CAS_N,
    DRAM_CKE,
    DRAM_CLK,
    DRAM_CS_N,
    DRAM_DQ,
    DRAM_DQM,
    DRAM_RAS_N,
    DRAM_WE_N,

    //////////// EPCS //////////
    EPCS_ASDO,
    EPCS_DATA0,
    EPCS_DCLK,
    EPCS_NCSO,

    //////////// Accelerometer and EEPROM //////////
    G_SENSOR_CS_N,
    G_SENSOR_INT,
    I2C_SCLK,
    I2C_SDAT,

    //////////// ADC //////////
    ADC_CS_N,
    ADC_SADDR,
    ADC_SCLK,
    ADC_SDAT,

    //////////// 2x13 GPIO Header //////////
    GPIO_2,
    GPIO_2_IN,

    //////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
    GPIO_0_D,
    GPIO_0_IN,

    //////////// GPIO_0, GPIO_1 connect to GPIO Default //////////
    GPIO_1_D,
    GPIO_1_IN 

);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_50;

//////////// LED //////////
output		     [7:0]		LED;

//////////// KEY //////////
input 		     [1:0]		KEY;

//////////// SW //////////
input 		     [3:0]		SW;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout 		    [15:0]		DRAM_DQ;
output		     [1:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;

//////////// EPCS //////////
output		          		EPCS_ASDO;
input 		          		EPCS_DATA0;
output		          		EPCS_DCLK;
output		          		EPCS_NCSO;

//////////// Accelerometer and EEPROM //////////
output		          		G_SENSOR_CS_N;
input 		          		G_SENSOR_INT;
output		          		I2C_SCLK;
inout 		          		I2C_SDAT;

//////////// ADC //////////
output		          		ADC_CS_N;
output		          		ADC_SADDR;
output		          		ADC_SCLK;
input 		          		ADC_SDAT;

//////////// 2x13 GPIO Header //////////
inout 		    [12:0]		GPIO_2;
input 		     [2:0]		GPIO_2_IN;

//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
inout 		    [33:0]		GPIO_0_D;
input 		     [1:0]		GPIO_0_IN;

//////////// GPIO_0, GPIO_1 connect to GPIO Default //////////
inout 		    [33:0]		GPIO_1_D;
input 		     [1:0]		GPIO_1_IN;


//=======================================================
//  REG/WIRE declarations
//=======================================================
wire            reset_n;
wire            wClk200Mhz, wSPIClk3M;
wire            wMotorClk;
wire    [33:0]  wSensor[3:0];
/* motor driver */
                // export signal
wire  [31:0]        wPWMduty;  /* motor pwm duty X4 
                                                [6:0]: Right Motor PWM 0~100
                                                [13:7]: Bottom Motor PWM 0~100
                                                [20:14]: Left Motor PWM 0~100
                                                [27:21]: Top Motor PWM 0~100
                                                [31]   : pwm duty dval trigger
                                             */ 
wire  [31:0]        wMotorDriverDir; /* export to motor driver  direction control, 
                                                      [1:0]: Right 
                                                      [3:2]: Bottom 
                                                      [5:4]: Left
                                                      [7:6]: Top
                                             */

wire   [31:0]       wMotorFBCnt[3:0];   /* motor Feedback accumulate counter x4, [31]: signed */
wire   [31:0]       wMotorSpeed[3:0];   /* motor Feedback Speed */
wire   [31:0]       wMotorFBDirection;  /* motor Feedback direction */
wire   [31:0]       wMotorCtrl;         /* motor control signals 
                                           [3:0]: clear 4motor accumulate feedback counter 
                                           [9:8]: driver [2,1] enable/disable#
                                           [31]: clear all fifo
                                        */
wire    [31:0]      wMotorFifoStatus;   /* motor fifo status register,
                                        [0]:  Motor A Speed fifo status, (1: indicated fifo not empty) 
                                        [1]:  Motor B Speed fifo status, (1: indicated fifo not empty)
                                        [2]:  Motor C Speed fifo status, (1: indicated fifo not empty)
                                        [3]:  Motor D Speed fifo status, (1: indicated fifo not empty)
                                        [7:4] reserve
                                        [8]:  Motor A voltage sensor fifo status, (1: indicated fifo not empty) 
                                        [9]:  Motor A current sensor fifo status, (1: indicated fifo not empty) 
                                        [10]: Motor B voltage sensor fifo status, (1: indicated fifo not empty) 
                                        [11]: Motor B current sensor fifo status, (1: indicated fifo not empty) 
                                        [12]: Motor C voltage sensor fifo status, (1: indicated fifo not empty) 
                                        [13]: Motor C current sensor fifo status, (1: indicated fifo not empty) 
                                        [14]: Motor D voltage sensor fifo status, (1: indicated fifo not empty) 
                                        [15]: Motor D current sensor fifo status, (1: indicated fifo not empty) 
                                        [31:16] reserve
                                     */
wire    [3:0]       wMotorDriverHWDir;
wire    [3:0]       wMotorDriverHWPWM;
wire    [1:0]       wMotorEncoder[3:0];
//=======================================================
//  Structural coding
//=======================================================
/* --------- connect to FPGA Pin begin ---------------*/
assign      reset_n = KEY[0];
assign {GPIO_1_D[21], GPIO_1_D[17], GPIO_1_D[3], GPIO_1_D[0]} = wMotorDriverHWDir[3:0]; /* motor {D,C,B,A} direction */
assign {GPIO_1_D[23], GPIO_1_D[19], GPIO_1_D[5], GPIO_1_D[1]} = wMotorDriverHWPWM[3:0]; /* motor {D,C,B,A} PWM  */
assign {GPIO_1_D[25], GPIO_1_D[7]} = wMotorCtrl[9:8];   /* motor driver {2,1} enable */
assign wMotorEncoder[0] = {GPIO_1_D[9], GPIO_1_D[11]};  /* {pha, phb}: motor A encoder phase */
assign wMotorEncoder[1] = {GPIO_1_D[13], GPIO_1_D[15]}; /* {pha, phb}: motor B encoder phase */
assign wMotorEncoder[2] = {GPIO_1_D[27], GPIO_1_D[29]}; /* {pha, phb}: motor C encoder phase */
assign wMotorEncoder[3] = {GPIO_1_D[31], GPIO_1_D[33]}; /* {pha, phb}: motor D encoder phase */
assign  LED[3:0] = wMotorDriverHWPWM; /* test PWM */
//assign {GPIO_1_D[4], GPIO_1_D[6]} = {wIMU_SCL, wIMU_SDA};/* for imu 6050*/
/* --------- connect to FPGA Pin end ---------------*/

assign wMotorClk = CLOCK_50;
assign wSensor[0] = {wADCchDval[5], wADCchDval[2], wADCch[5], wADCch[2]}; /* motor A sensor {Vdval[1], Adval[1], Volt[15:0], Ampe[15:0]}*/
assign wSensor[1] = {wADCchDval[7], wADCchDval[0], wADCch[7], wADCch[0]}; /* motor B sensor {Vdval[1], Adval[1], Volt[15:0], Ampe[15:0]}*/
assign wSensor[2] = {wADCchDval[6], wADCchDval[4], wADCch[6], wADCch[4]}; /* motor C sensor {Vdval[1], Adval[1], Volt[15:0], Ampe[15:0]}*/
assign wSensor[3] = {wADCchDval[3], wADCchDval[1], wADCch[3], wADCch[1]}; /* motor D sensor {Vdval[1], Adval[1], Volt[15:0], Ampe[15:0]}*/

 sopc u0 (
        /* clock interface */
        .clk_clk                           (CLOCK_50),        //            clk.clk
        .reset_reset_n                     (reset_n),         //          reset.reset_n
        .memclk_clk                        (DRAM_CLK),        //        pll_mem.clk
        .clk200m_clk                       (wClk200Mhz),      //         clk200.clk
        .sclk3m_clk                        (wSPIClk3M),
        /* PLL interface */
        .areset_export                     (0),               //    altpll_0_areset_conduit.export
        .locked_export    (/* no use */),  //    altpll_0_locked_conduit.export
        .phasedone_export (/* no use */),  // altpll_0_phasedone_conduit.export
        /* sdram interface */
        .sdram_wire_addr                   (DRAM_ADDR[12:0]), //     sdram_wire.addr
        .sdram_wire_ba                     (DRAM_BA[1:0]),    //               .ba
        .sdram_wire_cas_n                  (DRAM_CAS_N),      //               .cas_n
        .sdram_wire_cke                    (DRAM_CKE),        //               .cke
        .sdram_wire_cs_n                   (DRAM_CS_N),       //               .cs_n
        .sdram_wire_dq                     (DRAM_DQ[15:0]),   //               .dq
        .sdram_wire_dqm                    (DRAM_DQM[1:0]),   //               .dqm
        .sdram_wire_ras_n                  (DRAM_RAS_N),      //               .ras_n
        .sdram_wire_we_n                   (DRAM_WE_N),       //               .we_n
        /* EPCS interface */
        .epcs_dclk                         (EPCS_DCLK),       //    epcs_flash_controller_0.dclk
        .epcs_sce                          (EPCS_NCSO),       //               .sce
        .epcs_sdo                          (EPCS_ASDO),       //               .sdo
        .epcs_data0                        (EPCS_DATA0), 
        
        .ledg_export                       (LED[7:4]),        //           ledg.export
        .uart0_rxd                         (GPIO_1_IN[1]),    //          uart0.rxd
        .uart0_txd                         (GPIO_1_D[2] ),    //               .txd
        .switch_export                     (SW),              //         switch.export
        .bitton_export                     (KEY),             //         bitton.export
        
        /* G sensor */
        .motordriverreg_iIMUAcc            (wGsensor),         //               .iIMUAcc
        .motordriverreg_iIMUGYro           (/* no use */),     //               .iIMUGYro
        .motordriverreg_iIMUMagn           (/* no use */),     //               .iIMUMagn
        
        /* motor module signals */
        .motordriverreg_iMotorClk          (wMotorClk),        //motordriverreg.iMotorClk
        .motordriverreg_oPWMduty           (wPWMduty),         //             .oPWMduty
        .motordriverreg_oMotorDir          (wMotorDriverDir),  //             .oMotorDir
        .motordriverreg_iMotorA_Encoder    (wMotorFBCnt[0]),   //             .iMotorRightFBCnt
        .motordriverreg_iMotorA_Speed      (wMotorSpeed[0]),   //             .iMotorRightSpeed
        .motordriverreg_iMotorA_Sensor     (wSensor[0]),       //             .iMotorA_Sensor
        .motordriverreg_iMotorB_Encoder    (wMotorFBCnt[1]),   //             .iMotorBottomFBCnt
        .motordriverreg_iMotorB_Speed      (wMotorSpeed[1]),   //             .iMotorBottomSpeed
        .motordriverreg_iMotorB_Sensor     (wSensor[1]),       //             .iMotorA_Sensor
        .motordriverreg_iMotorC_Encoder    (wMotorFBCnt[2]),   //             .iMotorLeftFB
        .motordriverreg_iMotorC_Speed      (wMotorSpeed[2]),   //             .iMotorLeftSpeed
        .motordriverreg_iMotorC_Sensor     (wSensor[2]),       //             .iMotorA_Sensor
        .motordriverreg_iMotorD_Encoder    (wMotorFBCnt[3]),   //             .iMotorTopFB
        .motordriverreg_iMotorD_Speed      (wMotorSpeed[3]),   //             .iMotorTopSpeed
        .motordriverreg_iMotorD_Sensor     (wSensor[3]),       //             .iMotorA_Sensor
        .motordriverreg_iMotorFBDirection  (wMotorFBDirection),//             .iMotorFBDirection
        .motordriverreg_oMotorCtrl         (wMotorCtrl),       //             .oMotorCtrl
        .motordriverreg_iMotorFifoStatus   (wMotorFifoStatus)  //             .iMotorFifoStatus
    );
    
/*------------------test function start  ------------*/
/* for test motor phase A and phase B feedback */
wire  wA, wB;
GenABphase Test(
           .iClk50M(CLOCK_50),
           .iRst_n(reset_n),
           
           .iSwitch(SW[3:0]), /* select frequency */
           .oPhaA(wA),       /* phase A */
           .oPhaB(wB)        /* phase B */
);
/*------------------test function end ------------*/

/*---------- voltage and current sensor value from ADC  -------*/
wire    [15:0]  wADCch[7:0];    /* ADC channel 0~7 */
wire    [7:0]   wADCchDval;     /* ADC channel dval */
ADC_Top ADC_Top(
            .iClk50M  (CLOCK_50),  /* 50Mhz */
            .iSPICLK3M(wSPIClk3M), /* SPI clock 3Mhz */
            .iRst_n (reset_n),
            
            
                                       /* modify 0825 */
            .oCH5   (wADCch[5]),       /* ADC channel 5 data, motor A voltage feedback */
            .oCH2   (wADCch[2]),       /* ADC channel 2 data, motor A current feedback */
            
            .oCH7   (wADCch[7]),       /* ADC channel 7 data, motor B voltage feedback */
            .oCH0   (wADCch[0]),       /* ADC channel 0 data, motor B current feedback */
            
            
            .oCH6   (wADCch[6]),       /* ADC channel 6 data, motor C voltage feedback */
            .oCH4   (wADCch[4]),       /* ADC channel 4 data, motor C current feedback */
            
            .oCH3   (wADCch[3]),       /* ADC channel 3 data, motor D voltage feedback */
            .oCH1   (wADCch[1]),       /* ADC channel 1 data, motor D current feedback */

            .oCHDvl (wADCchDval),      /* ADC Data valid */
            
            .oSPI_CLK_SAMP( /* no use */),  /* 9Mhz, for debug  */ 
            /* ADC SPI wires */
            .oDIN   (ADC_SADDR),     /* Din */
            .oCS_n  (ADC_CS_N),      /* CS_n */
            .oSCLK  (ADC_SCLK),      /* SCLK */
            .iDOUT  (ADC_SDAT)       /* Dout */
    );
/*---------- voltage and current sensor value from ADC end -------*/

 
/* Gsensor  Accelerometer */
wire    [9:0]   wGSensorAxisZ, wGSensorAxisY, wGSensorAxisX;
wire    [31:0]  wGsensor;
wire            wGsensorDval;
assign wGsensor = {wGsensorDval, 1'b0, wGSensorAxisZ, wGSensorAxisY, wGSensorAxisX};
GSensor_Top GSensor_Top( 
        .iClk50M(CLOCK_50),    /* clock 50Mhz */
        .iRst_n (reset_n),
        
        .oAxisX (wGSensorAxisX),     /* X-axis data */
        .oAxisY (wGSensorAxisY),     /* Y-axis data */
        .oAxisZ (wGSensorAxisZ),     /* Z-axis data */
        .oGSenorDval(wGsensorDval),/* Gsensor Dval, about 9.8616ms one data */
        
        /* export GPIO */
        .oLED(/* no use */),
        
        /* G-Sensor signals (3-Wires)*/
        .iG_SENSOR_INT  (G_SENSOR_INT),  /*G_SENSOR Interrupt*/
        .SPI_SDIO       (I2C_SDAT),   /* SPI Data */
        .oSPI_CSn       (G_SENSOR_CS_N),   /* SPI CS_n */
        .oSPI_CLK       (I2C_SCLK)    /* SPI clock */
);

FourWheelMotorDriverTop FourWheelMotorDriverTop(
            .iClk50M    (wMotorClk),        /* 50Mhz CLock*/
            .iRst_n     (reset_n),         /* reset negitive */
            
            /* To motor driver signal */
            .iMotorDriverPwmDuty        (wPWMduty),        /* 32bit, 
                                           [6:0]   PWM duty 0~100,for 1st motor 
                                           [13:7]  PWM duty 0~100,for 2nd motor 
                                           [20:14] PWM duty 0~100,for 3rd motor 
                                           [17:21] PWM duty 0~100,for 4th motor 
                                           [32]    PWM Sync_t
                                        */
            .iMotorDriverPwmDutySync_t  (wPWMduty[31]),  /* PWM duty sync for all motor */
            .iMotorDriverDir(wMotorDriverDir),            /* 8bits, motor directio control, 0:CW, 1:CCW, 2:no control, 3:brak
                                           [1:0] 1st motor direction control. 
                                           [3:2] 2nd motor direction control. 
                                           [5:4] 3rd motor direction control. 
                                           [7:6] 4th motor direction control.
                                           [32]  motor direction sync
 
                                        */
            .iClearMotorCnt_t(wMotorCtrl[3:0]),   /* 4bits, clear motor counter 
                                           [0] clear 1st motor accumulat feedback AB phase counter. 
                                           [1] clear 2nd motor accumulat feedback AB phase counter. 
                                           [2] clear 3rd motor accumulat feedback AB phase counter. 
                                           [3] clear 4th motor accumulat feedback AB phase counter. 
                                        */
            /* Export to Motor Driver Hardware */
            .oMotorDriverHWDir(wMotorDriverHWDir),          /* 4bit, direction signals for motor Driver board, CW/CCW
                                           [0] 1st motor direction CW/CCW.
                                           [1] 2nd motor direction CW/CCW.
                                           [2] 3rd motor direction CW/CCW.
                                           [3] 4th motor direction CW/CCW.
                                        */
            .oMotorDriverHWPWM(wMotorDriverHWPWM),          /* 4bit, PWM signal for four motor driver */

            /* motor feedback signal */
            .iWheel1Phase(wMotorEncoder[0]),       /* 2bit, [1:0]={pha, phb} 1st motor feedback phase A,B */
            .iWheel2Phase(wMotorEncoder[1]),       /* 2bit, [1:0]={pha, phb} 2nd motor feedback phase A,B */
            .iWheel3Phase(wMotorEncoder[2]),       /* 2bit, [1:0]={pha, phb} 3rd motor feedback phase A,B */
            .iWheel4Phase(wMotorEncoder[3]),       /* 2bit, [1:0]={pha, phb} 4th motor feedback phase A,B */
 
            /* To MCU signals */
                /* motor 1*/
                    .oMotor1Speed(wMotorSpeed[0]),          /* 16bits, motor #1 velocity(unit: counter/ms ),
                                                            [31]: sync_t,
                                                            [30:0]: Motor #1 Speed conuter.
                                                            */
                    .oMotor1SpeedDval_t(),                  /* 1bits, motor #1 speed dval output */
                    .oMotor1FBAccmCnt(wMotorFBCnt[0]),      /* 32bits, current motor #1 feedback counter,
                                                            [31:0]: signed number for Motor #1 feedback conuter.
                                                            */ 
                    .oMotor1FBDir(wMotorFBDirection[0]),    /* feedback motor direction, CW/CCW */
                /* motor 2*/
                    .oMotor2Speed(wMotorSpeed[1]),          /* 32bits, motor #2 velocity(unit: counter/ms ),
                                                            [31]: sync_t,
                                                            [30:0]: Motor #2 Speed conuter.
                                                            */
                    .oMotor2SpeedDval_t(),                  /* 1bits, motor 2 speed dval output */
                    .oMotor2FBAccmCnt(wMotorFBCnt[1]),      /* 32bits, current motor #2 feedback counter,
                                                               [31:0]: signed number for Motor #1 feedback conuter.
                                                            */ 
                    .oMotor2FBDir(wMotorFBDirection[1]),    /* feedback motor #2 direction, CW/CCW */
                /* motor 3*/
                    .oMotor3Speed(wMotorSpeed[2]),         /* 32bits, motor #3 velocity(unit: counter/ms ),
                                                            [31]: sync_t,
                                                            [301:0]: Motor #3 Speed conuter.
                                                            */
                    .oMotor3SpeedDval_t(),                  /* 1bits, motor #3 speed dval output */
                    .oMotor3FBAccmCnt(wMotorFBCnt[2]),     /* 32bits, current motor #3 feedback counter,
                                                                [31:0]: signed number for Motor #3 feedback conuter.
                                                            */ 
                    .oMotor3FBDir(wMotorFBDirection[2]),    /* feedback motor #3 direction, CW/CCW */
                /* motor 4*/
                    .oMotor4Speed(wMotorSpeed[3]),          /* 32bits, motor #4 velocity(unit: counter/ms ),
                                                                [31]: sync_t,
                                                                [30:0]: Motor #4 Speed conuter.
                                                            */
                    .oMotor4SpeedDval_t(),                  /* 1bits, motor #4 speed dval output */
                    .oMotor4FBAccmCnt(wMotorFBCnt[3]),      /* 32bits, current motor #4 feedback counter,
                                                                [31:0]: signed number for Motor #4 feedback conuter.
                                                            */ 
                    .oMotor4FBDir(wMotorFBDirection[3])     /* feedback motor #4 direction, CW/CCW */

);

endmodule
