/*
    function description:
    Input:
        Phase A and Phase B

    Output:
        1. Motor feedback counter
        2. Motor speed

*/
module MotorFBTop (
           iClk50M,     /* 50Mhz */
           iRst_n,      /* reset negitive */
           
           /* clear */
           iMotorFBClr_t,  /* clear motor feedback counter */
           /* motor encoder signal */
           iPhA,        /* phase A */
           iPhB,        /* phase B */
           
           /* export to NIOS */
           oMotorSpeed,      /* motor Speed(unit: counter/ms ) */
           oMotorSpeedDval_t,/* motor Speed dval output, trigger */
           
           oMotorFBAccmCnt,    /* current motor feedback accumulate counter, it is signed number. 
                                 [31]: Dval, [30:0] export Accumulate counter, signed number */
           oMotorFBDir       /* 0: pha > phb, 1: pha < phb */
           

);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter CLKFREQ = 50_000_000; /* input clock */
parameter CLK1KHz = 1;       /* clock 1s */

//=======================================================
//  PORT declarations
//=======================================================
input           iClk50M;     /* 50Mhz */
input           iRst_n;      /* reset negitive */

           /* clear */
input           iMotorFBClr_t;  /* clear motor feedback counter */
           
           /* motor encoder signal */
input           iPhA;        /* phase A */
input           iPhB;        /* phase B */
           
           /* export to NIOS */
output [31:0]   oMotorSpeed;      /* motor Speed(unit: counter/ms ) */
output          oMotorSpeedDval_t;/* motor Speed dval output, 50M pulse */
           
output [31:0]   oMotorFBAccmCnt;    /* current motor feedback accumulate counter, it is signed number. 
                                       [31:0] export Accumulate counter, signed number */
output  reg     oMotorFBDir;      /* 0: pha > phb, 1: pha < phb */
//=======================================================
//  REG/WIRE declarations
//=======================================================
wire wMotorFBDir;

//=======================================================
//  Structural coding
//=======================================================
always@(posedge iClk50M or negedge iRst_n) begin
    if(!iRst_n) begin
        oMotorFBDir <= 0;
    end else begin
        if(oMotorSpeedDval_t) begin 
            oMotorFBDir <= wMotorFBDir;
        end else begin
            oMotorFBDir <= oMotorFBDir;
        end
    end
end
wire    wPhA, wPhB;
MotorPhaseFilterp(
            .iClk50M(iClk50M),        /* 50Mhz CLock*/
            .iRst_n(iRst_n),         /* reset negitive */
            
            /* motor control signal */
            .iPhA(iPhA),           /* PWM duty 0~100 */
            .iPhB(iPhB),     /* PWM duty sync for all motor */

            /* motor feedback signal */
            .oPhA(wPhA),               /* motor feedback phase A */
            .oPhB(wPhB),               /* motor feedback phase B */
);
/* motor feedback Accumulate counter */
MotorFBAccumulate MotorFBAccumulate(
           .iClk50M     (iClk50M),     /* 50Mhz */
           .iRst_n      (iRst_n),      /* reset negitive */
           
           /* clear */
           .iMotorFBClr_t(iMotorFBClr_t),  /* clear motor feedback counter */
           /* motor encoder signal */
           .iPhA        (wPhA),        /* phase A */
           .iPhB        (wPhB),        /* phase B */
           
           /* export to NIOS */
           
           .oMotorFBAccmCnt (oMotorFBAccmCnt),    /* current motor feedback accumulate counter, it is signed number. 
                                                     [31]: Dval, [30:0] export Accumulate counter, signed number */
           .oMotorFBDir   (wMotorFBDir)      /* 0: pha > phb, 1: pha < phb */

);

/* calculate motor speed */
MotorCalcSpeed MotorCalcSpeed(
           .iClk50M (iClk50M),     /* 50Mhz */
           .iRst_n  (iRst_n),      /* reset negitive */
           
           /* motor encoder signal */
           .iPhAXorPhB( wPhA ^ wPhB),            /* phase A Xor Phase B*/
           
           /* export to NIOS */
           .oMotorSpeed(oMotorSpeed),            /* motor speed (unit: counter/s ) */
           .oMotorSpeedDval_t(oMotorSpeedDval_t)/* motor speed dval output trigger, 50Mhz */

);

endmodule
