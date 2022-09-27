/*
    function description:
    Input:
        PWM duty cycle 0~100 value, 
    
    Output:
        1. Motor feedback counter
        2. Motor velcity
*/
module MotorDriveTop(
            iClk50M,        /* 50Mhz CLock*/
            iRst_n,         /* reset negitive */
            
            /* motor control signal */
            iPwmDuty,           /* PWM duty 0~100 */
            iPwmDutySync_t,     /* PWM duty sync for all motor */
            iMotorDir,          /* motor directio control, 0:CW, 1:CCW */
            iClearMotorCnt_t,   /* clear motor counter */
            
            /* export to motor signal */
            oMotorDriverDir,    /* output motor direction */
            oMotorDriverPWM,    /* output PWM motor */

            /* motor feedback signal */
            iPhA,               /* motor feedback phase A */
            iPhB,               /* motor feedback phase B */
            
            oMotorSpeed,        /* motor speed(unit: counter/ms ) */
            oMotorSpeedDval_t,  /* motor speed dval output */
            
            oMotorFBAccmCnt,    /* current motor feedback counter */
            oMotorFBDir         /* feedback motor direction */

            

);
//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================
input            iClk50M;        /* 50Mhz CLock*/
input            iRst_n;         /* reset negitive */
            
            /* motor control signal */
input  [6:0]     iPwmDuty;       /* PWM duty 0~100 */
input            iPwmDutySync_t; /* PWM duty sync for all motor, trigger */
input  [1:0]     iMotorDir;      /* motor directio control, 0:CW, 1:CCW */
            
            /* export to motor driver signal */
output [1:0]     oMotorDriverDir;       /* output motor direction */
output           oMotorDriverPWM;       /* output PWM motor */

            /* motor feedback signal */
input            iClearMotorCnt_t; /* clear motor accumulate counter */
input            iPhA;  /* motor feedback phase A */
input            iPhB;  /* motor feedback phase B */
            
output [31:0]    oMotorSpeed;      /* motor speed(unit: counter/ms ) */
output           oMotorSpeedDval_t;/* motor speed dval output */
            
output signed [31:0]    oMotorFBAccmCnt; /* current motor feedback accumulate counter, it is signed number. */
output           oMotorFBDir;     /* feedback motor direction */

            
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
assign oMotorDriverDir = iMotorDir;
PWMGen uPWMGen  (
           .iClk50M (iClk50M),
           .iRst_n  (iRst_n),
           
           .iPwmDuty(iPwmDuty),    /* PWM duty cycle */
           .iPwmDutySync_p(iPwmDutySync_t), /* PWM duty sync for all motor */

           .oPWM    (oMotorDriverPWM)    /* PWM waveform */
);

MotorFBTop uMotorFBTop(
           .iClk50M (iClk50M),     /* 50Mhz */
           .iRst_n  (iRst_n),      /* reset negitive */
           
           /* clear */
           .iMotorFBClr_t(iClearMotorCnt_t),  /* clear motor feedback counter */
           /* motor encoder signal */
           .iPhA    (iPhA),        /* phase A */
           .iPhB    (iPhB),        /* phase B */
           
           /* export to NIOS */
           .oMotorSpeed         (oMotorSpeed),      /* motor Speed(unit: counter/ms ) */
           .oMotorSpeedDval_t   (oMotorSpeedDval_t),/* motor Speed dval output, trigger */
           
           .oMotorFBAccmCnt (oMotorFBAccmCnt),   /* current motor feedback accumulate counter, it is signed number. 
                                                   [31:0] export Accumulate counter, signed number */
           .oMotorFBDir       (oMotorFBDir)       /* 0: pha > phb, 1: pha < phb */
           

);



endmodule
