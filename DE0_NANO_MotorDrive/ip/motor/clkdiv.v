/*
    function description:
    Input:
        iClk50M: 50Mhz clk

    Output:
        Expect clock
        Expect clock 4X (for debug )
*/
module clkdiv (
           iClk50M,
           iRst_n,
           
           oExpectClk,         /* Expect Clock */
           oExpectClk4X        /* 4X expectclk */
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter CLKFREQ = 50_000_000; /* input clock */
parameter ExpectClkFreq = 10_000;     /* expect clock */

//=======================================================
//  PORT declarations
//=======================================================
input           iClk50M;            /* 50M clock */
input           iRst_n;
           
output          oExpectClk;         /* Expect Clock */
output          oExpectClk4X;       /* 4X oExpectClk */
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg            oExpectClk;         /* Expect Clock */
reg            oExpectClk4X;       /* 4X oExpectClk */

reg     [31:0] rDivClkCnt;
reg     [31:0] rDivClkCnt4X;

//=======================================================
//  Structural coding
//=======================================================
/* generate pwm freuency */
always@(posedge iClk50M or negedge iRst_n) begin
    if(!iRst_n) begin
        rDivClkCnt <= 0;
        oExpectClk <= 0; 
        
        rDivClkCnt4X<= 0;  
        oExpectClk4X <= 0;
    end else begin
        if(rDivClkCnt >= ((CLKFREQ/(2*ExpectClkFreq))-1) ) begin
            oExpectClk <= ~oExpectClk;
            rDivClkCnt <= 0;
        end else begin
            oExpectClk <= oExpectClk;
            rDivClkCnt <= rDivClkCnt+1;
        end
        
        if(rDivClkCnt4X >= ((CLKFREQ/(2*ExpectClkFreq*4))-1) ) begin
            rDivClkCnt4X <= 0;
            oExpectClk4X <= ~oExpectClk4X;
        end else begin
            rDivClkCnt4X <= rDivClkCnt4X+1;
            oExpectClk4X <= oExpectClk4X;
        end
    end
end

endmodule
