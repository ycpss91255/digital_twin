/*
    function description:
    Input:
        PWM duty cycle 0~100 value, 
    
    Output:
        1. Motor feedback counter
        2. Motor velcity
*/
module MotorPhaseFilterp(
            iClk50M,        /* 50Mhz CLock*/
            iRst_n,         /* reset negitive */
            
            /* motor control signal */
            iPhA,           /* PWM duty 0~100 */
            iPhB,     /* PWM duty sync for all motor */

            /* motor feedback signal */
            oPhA,               /* motor feedback phase A */
            oPhB,               /* motor feedback phase B */
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

input            iPhA; /* PWM duty sync for all motor, trigger */
input            iPhB; /* PWM duty sync for all motor, trigger */

output reg          oPhA;
output reg          oPhB;
 
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [2:0]   rDlyPhA, rDlyPhB;
reg [31:0]  rCnt;
wire        wExpectClk;
//=======================================================
//  Structural coding
//=======================================================


clkdiv #( .ExpectClkFreq(1_000_000) )
        clk1u(
           .iClk50M(iClk50M),
           .iRst_n(iRst_n),
           
           .oExpectClk(wExpectClk),         /* Expect Clock */
           .oExpectClk4X()        /* 4X expectclk */
);

integer I;
always@(posedge wExpectClk or negedge iRst_n)begin
    if(!iRst_n) begin
        rDlyPhA <= 0; rDlyPhB <= 0;
        oPhA <= 0; oPhB <= 0;
    end else begin
        rDlyPhA[0] <= iPhA; rDlyPhB[0] <= iPhB;
        for (I=0;I<(3-1);I=I+1) begin
            rDlyPhA[I+1] <= rDlyPhA[I];
            rDlyPhB[I+1] <= rDlyPhB[I];
        end
        case (rDlyPhA)
            3'b000: oPhA <= 0;
            3'b001: oPhA <= 0;
            3'b010: oPhA <= 0;
            3'b011: oPhA <= 1;
            3'b100: oPhA <= 0;
            3'b101: oPhA <= 1;
            3'b110: oPhA <= 1;
            3'b111: oPhA <= 1;
        endcase
        case (rDlyPhB)
            3'b000: oPhB <= 0;
            3'b001: oPhB <= 0;
            3'b010: oPhB <= 0;
            3'b011: oPhB <= 1;
            3'b100: oPhB <= 0;
            3'b101: oPhB <= 1;
            3'b110: oPhB <= 1;
            3'b111: oPhB <= 1;
        endcase
    end
end



endmodule
