/*
    function description:
    Input:
        phase A xor phaseB

    Output:
        Motor speed (unit: count/s )

*/
module MotorCalcSpeed (
           iClk50M,     /* 50Mhz */
           iRst_n,      /* reset negitive */
           
           /* motor encoder signal */
           iPhAXorPhB,        /* phase A Xor Phase B*/
           
           /* export to NIOS */
           oMotorSpeed,      /* motor speed (unit: counter/s ) */
           oMotorSpeedDval_t /* motor speed dval output 50Mhz trigger  */

);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter CLKFREQ = 50_000_000;     /* input clock */
parameter ExpectClkFreq = 100;      /* speed sample clock */

//=======================================================
//  PORT declarations
//=======================================================
input           iClk50M;     /* 50Mhz */
input           iRst_n;      /* reset negitive */

           
           /* motor encoder signal */
input           iPhAXorPhB;         /* phase A Xor Phase B*/
           
           /* export to NIOS */
output [31:0]   oMotorSpeed;      /* motor speed(unit: counter/1s ), 
                                       [31]: Data valid 
                                     [30:0]: speed Data, Max 2^31 */
output          oMotorSpeedDval_t;/* motor speed dval output, 50M pulse */


//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [31:0]      oMotorSpeed; /* motor speed(unit: counter/s ) */
reg             oMotorSpeedDval_t; /* motor speed dval output, 50M pulse */

wire            wExpectClk;



//=======================================================
//  Structural coding
//=======================================================


/* generate 1Hz freuency */
clkdiv #(.ExpectClkFreq(ExpectClkFreq))/* generate speed sample clock */
      uClkdiv1Hz(
           .iClk50M     (iClk50M),
           .iRst_n      (iRst_n),
           
           .oExpectClk  (wExpectClk),        /* Expect Clock */
           .oExpectClk4X(/*no use */)        /* 4X expectclk */
);

/*=======================================================*/
/* count (Phase Xor Phase B) feedback signal */
reg [30:0] rFBCnt; /* count feedback */
reg               rTmpPhaXorPhb;
reg               rMotorFBClr;
always@(posedge iClk50M or negedge iRst_n) begin
    if(!iRst_n) begin
        rTmpPhaXorPhb <= 0;
        rFBCnt <= 0;/* start count at half of 65536 */
    end else begin
        rTmpPhaXorPhb <= iPhAXorPhB;
        if(rMotorFBClr) begin
            rFBCnt <= 0;
        end else if({rTmpPhaXorPhb, iPhAXorPhB}== 2'b01 ) begin
            rFBCnt <= rFBCnt + 1; 
        end else if({rTmpPhaXorPhb, iPhAXorPhB}== 2'b10 ) begin
            rFBCnt <= rFBCnt + 1; 
        end else begin
            rFBCnt <= rFBCnt;
        end
    end
end

/*=======================================================*/


reg rDlyClk;
always@(posedge iClk50M or negedge iRst_n)begin
    if(!iRst_n)begin
        rDlyClk <= 0;
        oMotorSpeedDval_t <= 0;
        oMotorSpeed <= 0;
    end else begin
        rDlyClk <= wExpectClk;
        if({rDlyClk, wExpectClk}==2'b01)begin
            oMotorSpeed <= {1'b1, rFBCnt};
            rMotorFBClr <= 1;                 /* clear rFBCnt*/
            oMotorSpeedDval_t <= 1;
        end else begin
            oMotorSpeed <= {16'h0, 16'hBEEF}; /* data not ready */
            rMotorFBClr <= 0;                 /* clear rFBCnt*/
            oMotorSpeedDval_t <= 0;
        end

    end
end



endmodule
