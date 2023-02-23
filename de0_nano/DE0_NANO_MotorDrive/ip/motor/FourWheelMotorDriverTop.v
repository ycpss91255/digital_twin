/*
    function description:
        Four Wheel Motor Driver Top file.
    Input:
        four motor signals.

    Output:
        Motor sensor signals
        include speed, encoder counter, direction.

*/
module FourWheelMotorDriverTop (
            iClk50M,        /* 50Mhz CLock*/
            iRst_n,         /* reset negitive */
            
            /* To motor driver signal */
            iMotorDriverPwmDuty,        /* 32bit, 
                                           [6:0]   PWM duty 0~100,for 1st motor 
                                           [13:7]  PWM duty 0~100,for 2nd motor 
                                           [20:14] PWM duty 0~100,for 3rd motor 
                                           [17:21] PWM duty 0~100,for 4th motor 
                                           [32]    PWM Sync_t
                                        */
            iMotorDriverPwmDutySync_t,  /* PWM duty sync for all motor */
            iMotorDriverDir,            /* 8bits, motor directio control, 0:CW, 1:CCW, 2:no control, 3:brak
                                           [1:0] 1st motor direction control. 
                                           [3:2] 2nd motor direction control. 
                                           [5:4] 3rd motor direction control. 
                                           [7:6] 4th motor direction control.
                                           [32]  motor direction sync
 
                                        */
            iClearMotorCnt_t,           /* 4bits, clear motor counter 
                                           [0] clear 1st motor accumulat feedback AB phase counter. 
                                           [1] clear 2nd motor accumulat feedback AB phase counter. 
                                           [2] clear 3rd motor accumulat feedback AB phase counter. 
                                           [3] clear 4th motor accumulat feedback AB phase counter. 
                                        */
            /* Export to Motor Driver Hardware */
            oMotorDriverHWDir,            /* 4bit, direction signals for motor Driver board, CW/CCW
                                           [0] 1st motor direction CW/CCW.
                                           [1] 2nd motor direction CW/CCW.
                                           [2] 3rd motor direction CW/CCW.
                                           [3] 4th motor direction CW/CCW.
                                        */
            oMotorDriverHWPWM,            /* 4bit, PWM signal for four motor driver */

            /* motor feedback signal */
            iWheel1Phase,       /* 2bit, [1:0]={pha, phb} 1st motor feedback phase A,B */
            iWheel2Phase,       /* 2bit, [1:0]={pha, phb} 2nd motor feedback phase A,B */
            iWheel3Phase,       /* 2bit, [1:0]={pha, phb} 3rd motor feedback phase A,B */
            iWheel4Phase,       /* 2bit, [1:0]={pha, phb} 4th motor feedback phase A,B */

            /* To MCU signals */
                /* motor 1*/
                    oMotor1Speed,       /* 16bits, motor #1 velocity(unit: counter/ms ),
                                           [15]: sync_t,
                                           [14:0]: Motor #1 Speed conuter.
                                        */
                    oMotor1SpeedDval_t, /* 1bits, motor #1 speed dval output */
                    oMotor1FBAccmCnt,   /* 32bits, current motor #1 feedback counter,
                                           [31]: sync_t,
                                           [30:0]: signed number for Motor #1 feedback conuter.
                                        */ 
                    oMotor1FBDir,        /* feedback motor direction, CW/CCW */
                /* motor 2*/
                    oMotor2Speed,       /* 16bits, motor #2 velocity(unit: counter/ms ),
                                           [15]: sync_t,
                                           [14:0]: Motor #2 Speed conuter.
                                        */
                    oMotor2SpeedDval_t, /* 1bits, motor 2 speed dval output */
                    oMotor2FBAccmCnt,   /* 32bits, current motor #2 feedback counter,
                                           [31]: sync_t,
                                           [30:0]: signed number for Motor #1 feedback conuter.
                                        */ 
                    oMotor2FBDir,        /* feedback motor #2 direction, CW/CCW */
                /* motor 3*/
                    oMotor3Speed,       /* 16bits, motor #3 velocity(unit: counter/ms ),
                                           [15]: sync_t,
                                           [14:0]: Motor #3 Speed conuter.
                                        */
                    oMotor3SpeedDval_t, /* 1bits, motor #3 speed dval output */
                    oMotor3FBAccmCnt,   /* 32bits, current motor #3 feedback counter,
                                           [31]: sync_t,
                                           [30:0]: signed number for Motor #3 feedback conuter.
                                        */ 
                    oMotor3FBDir,        /* feedback motor #3 direction, CW/CCW */
                /* motor 4*/
                    oMotor4Speed,       /* 16bits, motor #4 velocity(unit: counter/ms ),
                                           [15]: sync_t,
                                           [14:0]: Motor #4 Speed conuter.
                                        */
                    oMotor4SpeedDval_t, /* 1bits, motor #4 speed dval output */
                    oMotor4FBAccmCnt,   /* 32bits, current motor #4 feedback counter,
                                           [31]: sync_t,
                                           [30:0]: signed number for Motor #4 feedback conuter.
                                        */ 
                    oMotor4FBDir        /* feedback motor #4 direction, CW/CCW */

);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter CLKFREQ = 50_000_000; /* input clock */
parameter ExpectClk = 1;       /* Expect clock 1s */

//=======================================================
//  PORT declarations
//=======================================================
input            iClk50M;        /* 50Mhz CLock*/
input            iRst_n;         /* reset negitive */

            
            /* To motor driver signal */
input   [31:0]  iMotorDriverPwmDuty;    /* 32bit, 
                                           [6:0]   PWM duty 0~100,for 1st motor 
                                           [13:7]  PWM duty 0~100,for 2nd motor 
                                           [20:14] PWM duty 0~100,for 3rd motor 
                                           [17:21] PWM duty 0~100,for 4th motor 
                                           [32]    PWM Sync_t
                                        */
input           iMotorDriverPwmDutySync_t;  /* PWM duty sync for all motor */
input   [31:0]   iMotorDriverDir;        /* 8bits, motor directio control, 0:CW, 1:CCW, 2:no control, 3:brak
                                           [1:0] 1st motor direction control. 
                                           [3:2] 2nd motor direction control. 
                                           [5:4] 3rd motor direction control. 
                                           [7:6] 4th motor direction control.
                                           [32]  motor direction sync
 
                                        */
input   [3:0]   iClearMotorCnt_t;       /* 4bits, clear motor counter 
                                           [0] clear 1st motor accumulat feedback AB phase counter. 
                                           [1] clear 2nd motor accumulat feedback AB phase counter. 
                                           [2] clear 3rd motor accumulat feedback AB phase counter. 
                                           [3] clear 4th motor accumulat feedback AB phase counter. 
                                        */
            /* Export to Motor Driver Hardware */
output  [3:0]    oMotorDriverHWDir;        /* 4bit, direction signals for motor Driver board, CW/CCW
                                           [0] 1st motor direction CW/CCW.
                                           [1] 2nd motor direction CW/CCW.
                                           [2] 3rd motor direction CW/CCW.
                                           [3] 4th motor direction CW/CCW.
                                        */
output  [3:0]    oMotorDriverHWPWM;     /* 4bit, PWM signal for four motor driver */

            /* motor feedback signal */
input   [1:0]    iWheel1Phase;      /* 2bit, [1:0]={pha, phb} 1st motor feedback phase A,B */
input   [1:0]    iWheel2Phase;      /* 2bit, [1:0]={pha, phb} 2nd motor feedback phase A,B */
input   [1:0]    iWheel3Phase;      /* 2bit, [1:0]={pha, phb} 3rd motor feedback phase A,B */
input   [1:0]    iWheel4Phase;      /* 2bit, [1:0]={pha, phb} 4th motor feedback phase A,B */

            /* To MCU signals */
//output  [31:0]   oMotorSpeed[3:0];          /* 16bits, motor #1 velocity(unit: counter/ms ),
//                                           [31]: sync_t,
//                                           [14:0]: Motor #1 Speed conuter.
//                                        */
//output           oMotorSpeedDval_t[3:0]; /* 1bits, motor #1 speed dval output */
//output  [31:0]   oMotorFBAccmCnt[3:0];   /* 32bits, current motor #1 feedback counter,
//                                           [31]: sync_t,
//                                           [30:0]: signed number for Motor #1 feedback conuter.
//                                        */ 
//output           oMotorFBDir[3:0];        /* feedback motor direction, CW/CCW */

                /* ========motor 1==========*/
output  [31:0]   oMotor1Speed;          /* 16bits, motor #1 velocity(unit: counter/ms ),
                                           [31]: sync_t,
                                           [14:0]: Motor #1 Speed conuter.
                                        */
output           oMotor1SpeedDval_t; /* 1bits, motor #1 speed dval output */
output  [31:0]   oMotor1FBAccmCnt;   /* 32bits, current motor #1 feedback counter,
                                           [31:0]: signed number for Motor #1 feedback conuter.
                                        */ 
output           oMotor1FBDir;        /* feedback motor direction, CW/CCW */

                /* ==========motor 2==========*/
output  [31:0]   oMotor2Speed;       /* 16bits, motor #2 velocity(unit: counter/ms ),
                                           [31]: sync_t,
                                           [14:0]: Motor #2 Speed conuter.
                                        */
output           oMotor2SpeedDval_t; /* 1bits, motor 2 speed dval output */
output  [31:0]   oMotor2FBAccmCnt;   /* 32bits, current motor #2 feedback counter,
                                           [31:0]: signed number for Motor #1 feedback conuter.
                                        */ 
output           oMotor2FBDir;        /* feedback motor #2 direction, CW/CCW */

                /* ==========motor 3==========*/
output  [31:0]   oMotor3Speed;       /* 16bits, motor #3 velocity(unit: counter/ms ),
                                           [31]: sync_t,
                                           [14:0]: Motor #3 Speed conuter.
                                        */
output           oMotor3SpeedDval_t; /* 1bits, motor #3 speed dval output */
output  [31:0]   oMotor3FBAccmCnt;   /* 32bits, current motor #3 feedback counter,
                                           [31:0]: signed number for Motor #3 feedback conuter.
                                        */ 
output           oMotor3FBDir;        /* feedback motor #3 direction, CW/CCW */

                /* ==========motor 4==========*/
output  [31:0]   oMotor4Speed;       /* 16bits, motor #4 velocity(unit: counter/ms ),
                                           [31]: sync_t,
                                           [14:0]: Motor #4 Speed conuter.
                                        */
output           oMotor4SpeedDval_t; /* 1bits, motor #4 speed dval output */
output  [31:0]   oMotor4FBAccmCnt;   /* 32bits, current motor #4 feedback counter,
                                           [31:0]: signed number for Motor #4 feedback conuter.
                                        */ 
output           oMotor4FBDir;        /* feedback motor #4 direction, CW/CCW */
//=======================================================
//  REG/WIRE declarations
//=======================================================
wire signed [31:0]   oMotor1FBAccmCnt;   /* 32bits, current motor #1 feedback counter,*/
wire signed [31:0]   oMotor2FBAccmCnt;   /* 32bits, current motor #2 feedback counter,*/
wire signed [31:0]   oMotor3FBAccmCnt;   /* 32bits, current motor #3 feedback counter,*/
wire signed [31:0]   oMotor4FBAccmCnt;   /* 32bits, current motor #4 feedback counter,*/



wire    [1:0]   wMotorDriverHWDir[3:0];
//=======================================================
//  Structural coding
//=======================================================
assign oMotorDriverHWDir[0] = wMotorDriverHWDir[0][0];
assign oMotorDriverHWDir[1] = wMotorDriverHWDir[1][0];
assign oMotorDriverHWDir[2] = wMotorDriverHWDir[2][0];
assign oMotorDriverHWDir[3] = wMotorDriverHWDir[3][0];
/* Right wheel */
MotorDriveTop MotorA_DriveTop(
            .iClk50M        (iClk50M),                  /* 50Mhz CLock*/
            .iRst_n         (iRst_n),                   /* reset negitive */
            
            /* motor control signal */
            .iPwmDuty       (iMotorDriverPwmDuty[6:0]), /* PWM duty 0~100 */
            .iPwmDutySync_t (iMotorDriverPwmDuty[31]),  /* PWM duty sync for all motor */
            .iMotorDir      (iMotorDriverDir[1:0]),     /* motor directio control, 0:CW, 1:CCW */
            .iClearMotorCnt_t(iClearMotorCnt_t[0]),     /* clear motor counter */
            
            /* export to motor signal */
            .oMotorDriverDir      (wMotorDriverHWDir[0]),     /* output motor direction */
            .oMotorDriverPWM      (oMotorDriverHWPWM[0]),     /* output PWM motor */

            /* motor feedback signal */
            .iPhA           (iWheel1Phase[1]),          /* motor feedback phase A */
            .iPhB           (iWheel1Phase[0]),          /* motor feedback phase B */
            
            .oMotorSpeed    (oMotor1Speed),             /* motor velocity(unit: counter/ms ) */
            .oMotorSpeedDval_t(oMotor1SpeedDval_t),                       /* motor velocity dval output */
            
            .oMotorFBAccmCnt(oMotor1FBAccmCnt),         /* current motor feedback counter */
            .oMotorFBDir    (oMotor1FBDir)              /* feedback motor direction */
);
 

/* bottom wheel */
MotorDriveTop MotorB_DriveTop(
            .iClk50M        (iClk50M),                  /* 50Mhz CLock*/
            .iRst_n         (iRst_n),                   /* reset negitive */
            
            /* motor control signal */
            .iPwmDuty       (iMotorDriverPwmDuty[13:7]),/* PWM duty 0~100 */
            .iPwmDutySync_t (iMotorDriverPwmDuty[31]),  /* PWM duty sync for all motor */
            .iMotorDir      (iMotorDriverDir[3:2]),     /* motor directio control, 0:CW, 1:CCW */
            .iClearMotorCnt_t(iClearMotorCnt_t[1]),     /* clear motor counter */
            
            /* export to motor signal */
            .oMotorDriverDir      (wMotorDriverHWDir[1]),     /* output motor direction */
            .oMotorDriverPWM      (oMotorDriverHWPWM[1]),     /* output PWM motor */

            /* motor feedback signal */
            .iPhA           (iWheel2Phase[1]),          /* motor feedback phase A */
            .iPhB           (iWheel2Phase[0]),          /* motor feedback phase B */
            
            .oMotorSpeed    (oMotor2Speed),             /* motor velocity(unit: counter/ms ) */
            .oMotorSpeedDval_t(oMotor2SpeedDval_t),                       /* motor velocity dval output */
            
            .oMotorFBAccmCnt(oMotor2FBAccmCnt),         /* current motor feedback counter */
            .oMotorFBDir    (oMotor2FBDir)              /* feedback motor direction */
);

/* left wheel */
MotorDriveTop MotorC_DriveTop(
            .iClk50M        (iClk50M),                  /* 50Mhz CLock*/
            .iRst_n         (iRst_n),                   /* reset negitive */
            
            /* motor control signal */
            .iPwmDuty       (iMotorDriverPwmDuty[20:14]),/* PWM duty 0~100 */
            .iPwmDutySync_t (iMotorDriverPwmDuty[31]),   /* PWM duty sync for all motor */
            .iMotorDir      (iMotorDriverDir[5:4]),     /* motor directio control, 0:CW, 1:CCW */
            .iClearMotorCnt_t(iClearMotorCnt_t[2]),     /* clear motor counter */
            
            /* export to motor signal */
            .oMotorDriverDir      (wMotorDriverHWDir[2]),     /* output motor direction */
            .oMotorDriverPWM      (oMotorDriverHWPWM[2]),     /* output PWM motor */

            /* motor feedback signal */
            .iPhA           (iWheel3Phase[1]),          /* motor feedback phase A */
            .iPhB           (iWheel3Phase[0]),          /* motor feedback phase B */
            
            .oMotorSpeed    (oMotor3Speed),             /* motor velocity(unit: counter/ms ) */
            .oMotorSpeedDval_t(oMotor3SpeedDval_t),                       /* motor velocity dval output */
            
            .oMotorFBAccmCnt(oMotor3FBAccmCnt),         /* current motor feedback counter */
            .oMotorFBDir    (oMotor3FBDir)              /* feedback motor direction */
);
/* Top wheel */
MotorDriveTop MotorD_DriveTop(
            .iClk50M        (iClk50M),                  /* 50Mhz CLock*/
            .iRst_n         (iRst_n),                   /* reset negitive */
            
            /* motor control signal */
            .iPwmDuty       (iMotorDriverPwmDuty[27:21]),/* PWM duty 0~100 */
            .iPwmDutySync_t (iMotorDriverPwmDuty[31]),   /* PWM duty sync for all motor */
            .iMotorDir      (iMotorDriverDir[7:6]),     /* motor directio control, 0:CW, 1:CCW */
            .iClearMotorCnt_t(iClearMotorCnt_t[3]),     /* clear motor counter */
            
            /* export to motor signal */
            .oMotorDriverDir      (wMotorDriverHWDir[3]),     /* output motor direction */
            .oMotorDriverPWM      (oMotorDriverHWPWM[3]),     /* output PWM motor */

            /* motor feedback signal */
            .iPhA           (iWheel4Phase[1]),          /* motor feedback phase A */
            .iPhB           (iWheel4Phase[0]),          /* motor feedback phase B */
            
            .oMotorSpeed    (oMotor4Speed),             /* motor velocity(unit: counter/ms ) */
            .oMotorSpeedDval_t(oMotor4SpeedDval_t),                       /* motor velocity dval output */
            
            .oMotorFBAccmCnt(oMotor4FBAccmCnt),         /* current motor feedback counter */
            .oMotorFBDir    (oMotor4FBDir)              /* feedback motor direction */
);

endmodule
