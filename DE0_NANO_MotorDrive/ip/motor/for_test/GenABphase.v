/*
    function description:
    Input:
        iClk50M: 50Mhz clk
        frequency select
    Output:
        phase oA & phase oB waveform
*/
module GenABphase (
           iClk50M,
           iRst_n,
           iSwitch,     /* select frequency */

                      
           oPhaA,       /* phase A waveform*/
           oPhaB        /* phase B waveform*/
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter CLKFREQ = 50_000_000;       /* input clock */
parameter ExpectClkFreq = 10_000;     /* expect clock */

//=======================================================
//  PORT declarations
//=======================================================
input           iClk50M;        /* 50M clock */
input           iRst_n;
input   [3:0]   iSwitch;        /* select frequency */
           
output          oPhaA;          /* phase A */
output          oPhaB;          /* phase B */
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg            oPhaA;       /* phase A */
reg            oPhaB;       /* phase B */

reg     [31:0] rDivClkCntA, rDivClkCntB;
reg     [31:0] rDivClkCnt4X;

//=======================================================
//  Structural coding
//=======================================================
/* generate pwm freuency */
reg rEnablePhaB;
always@(posedge iClk50M or negedge iRst_n) begin
    if(!iRst_n) begin
        rDivClkCntA <= 0; rDivClkCntB <= 0;
        rDivClkCnt4X<= 0;  
        rEnablePhaB <= 0; oPhaA <= 0; oPhaB<= 0;
    end else begin
        case(iSwitch)
            4'b0000: begin /* CW,10Khz */
                /* delay 90 degree */
                if(rDivClkCnt4X >= ((CLKFREQ/(2*10000*2))-1) ) begin
                    rEnablePhaB <= 1;
                    rDivClkCnt4X <= rDivClkCnt4X;
                end else begin
                    rEnablePhaB <= rEnablePhaB;
                    rDivClkCnt4X <= rDivClkCnt4X+1;
                end
                /* generate phase A*/
                if(rDivClkCntA >= ((CLKFREQ/(2*10000))-1) ) begin
                    oPhaA <= ~oPhaA;
                    rDivClkCntA <= 0;
                end else begin
                    oPhaA <= oPhaA;
                    rDivClkCntA <= rDivClkCntA+1;
                end
                
                if(rEnablePhaB) begin
                   /* oPhab start count */
                    if(rDivClkCntB >= ((CLKFREQ/(2*10000))-1) ) begin
                        oPhaB <= ~oPhaB;
                        rDivClkCntB <= 0;
                    end else begin
                        oPhaB <= oPhaB;
                        rDivClkCntB <= rDivClkCntB+1;
                    end
                end else begin
                    oPhaB <= 0;
                    rDivClkCntB <= 0;
                end
            end
            4'b0001: begin /* CW,100Khz */
                /* delay 90 degree */
                if(rDivClkCnt4X >= ((CLKFREQ/(2*100000*2))-1) ) begin
                    rEnablePhaB <= 1;
                    rDivClkCnt4X <= rDivClkCnt4X;
                end else begin
                    rEnablePhaB <= rEnablePhaB;
                    rDivClkCnt4X <= rDivClkCnt4X+1;
                end
                /* generate phase A*/
                if(rDivClkCntA >= ((CLKFREQ/(2*100000))-1) ) begin
                    oPhaA <= ~oPhaA;
                    rDivClkCntA <= 0;
                end else begin
                    oPhaA <= oPhaA;
                    rDivClkCntA <= rDivClkCntA+1;
                end
                
                if(rEnablePhaB) begin
                    /* oPhab start count */
                    if(rDivClkCntB >= ((CLKFREQ/(2*100000))-1) ) begin
                        oPhaB <= ~oPhaB;
                        rDivClkCntB <= 0;
                    end else begin
                        oPhaB <= oPhaB;
                        rDivClkCntB <= rDivClkCntB+1;
                    end
                end else begin
                    oPhaB <= 0;
                    rDivClkCntB <= 0;
                end
            end
            4'b0010: begin /* CCW,10Khz */
                /* delay 90 degree */
                if(rDivClkCnt4X >= ((CLKFREQ/(2*10000*2))-1) ) begin
                    rEnablePhaB <= 1;
                    rDivClkCnt4X <= rDivClkCnt4X;
                end else begin
                    rEnablePhaB <= rEnablePhaB;
                    rDivClkCnt4X <= rDivClkCnt4X+1;
                end
                /* generate phase A*/
                if(rDivClkCntA >= ((CLKFREQ/(2*10000))-1) ) begin
                    oPhaB <= ~oPhaB;
                    rDivClkCntA <= 0;
                end else begin
                    oPhaB <= oPhaB;
                    rDivClkCntA <= rDivClkCntA+1;
                end
                
                if(rEnablePhaB) begin
                    /* oPhab start count */
                    if(rDivClkCntB >= ((CLKFREQ/(2*10000))-1) ) begin
                        oPhaA <= ~oPhaA;
                        rDivClkCntB <= 0;
                    end else begin
                        oPhaA <= oPhaA;
                        rDivClkCntB <= rDivClkCntB+1;
                    end
                end else begin
                    oPhaA <= 0;
                    rDivClkCntB <= 0;
                end
            end
            4'b0011: begin /* CCW, freq 100K */
                /* delay 90 degree */
                if(rDivClkCnt4X >= ((CLKFREQ/(2*100000*2))-1) ) begin
                    rEnablePhaB <= 1;
                    rDivClkCnt4X <= rDivClkCnt4X;
                end else begin
                    rEnablePhaB <= rEnablePhaB;
                    rDivClkCnt4X <= rDivClkCnt4X+1;
                end
                /* generate phase A*/
                if(rDivClkCntA >= ((CLKFREQ/(2*100000))-1) ) begin
                    oPhaB <= ~oPhaB;
                    rDivClkCntA <= 0;
                end else begin
                    oPhaB <= oPhaB;
                    rDivClkCntA <= rDivClkCntA+1;
                end
                
                if(rEnablePhaB) begin
                    /* oPhab start count */
                    if(rDivClkCntB >= ((CLKFREQ/(2*100000))-1) ) begin
                        oPhaA <= ~oPhaA;
                        rDivClkCntB <= 0;
                    end else begin
                        oPhaA <= oPhaA;
                        rDivClkCntB <= rDivClkCntB+1;
                    end
                end else begin
                    oPhaA <= 0;
                    rDivClkCntB <= 0;
                end
            end
            default: begin /* CW,10Khz */
                   /* disable oPhaA  and oPhaB */
                    oPhaA <= 0;
                    oPhaB <= 0;
            end
        endcase
    end
end

endmodule