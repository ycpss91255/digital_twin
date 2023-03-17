/*
    function description:
    Input:
        PWM duty cycle 0~100 value, 
        iDir
    Output:
        1. Motor feedback counter
        2. Motor velcity

*/
module PWMGen (
           iClk50M,    /* 50Mhz clock */
           iRst_n,     /* reset */
           
           iPwmDuty,    /* PWM duty cycle */
           iPwmDutySync_p,/* PWM duty sync for all motor */

           oPWM         /* PWM waveform */
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter CLKFREQ = 50_000_000; /* input clock */
parameter PWMFREQ = 10_000;     /* PWM frequency */

//=======================================================
//  PORT declarations
//=======================================================
input           iClk50M;
input           iRst_n;
           
input [6:0]     iPwmDuty;    /* PWM duty cycle */
input           iPwmDutySync_p;/* PWM duty sync for all motor */

output          oPWM;         /* PWM waveform */
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg     [31:0]  rDivClkCnt;
wire            wClk1Mhz; /* 1Mhz = PWMFREQ*100, PWMFREQ is PWM Freq */

//=======================================================
//  Structural coding
//=======================================================
/* generate pwm freuency */
clkdiv #(.ExpectClkFreq(PWMFREQ*100))/* generate 10K *100 */
      uClkdiv(
           .iClk50M     (iClk50M),
           .iRst_n      (iRst_n),
           
           .oExpectClk  (wClk1Mhz),         /* Expect Clock */
           .oExpectClk4X(/*no use */)        /* 4X expectclk */
);

reg [6:0]   rPwmDuty; /* store pwmduty */
reg         rPwmDutySync_p;
always@(posedge iClk50M or negedge iRst_n) begin
    if(!iRst_n) begin
        rPwmDuty <= 0; rPwmDutySync_p <=0;
    end else begin
        rPwmDutySync_p <= iPwmDutySync_p;
        if({rPwmDutySync_p, iPwmDutySync_p} == 2'b01) begin /*detect iPwmDutySync_p trigger to update */
            rPwmDuty <= iPwmDuty;
        end else begin
            rPwmDuty <= rPwmDuty;
        end
    end
end


/* PWM counter */
reg [6:0]   rPwmCnt; /* 0~ 100*/

always@(posedge wClk1Mhz or negedge iRst_n) begin
    if(!iRst_n) begin
        rPwmCnt <= 0; 
    end else begin
        if(rPwmCnt >= (100-1) ) begin
            rPwmCnt <= 0;
        end else begin
            rPwmCnt <= rPwmCnt+1;
        end
    end
end

/* generate pwm */
assign oPWM = (rPwmDuty > rPwmCnt)? 1'b1: 1'b0; /* generate PWM duty */
endmodule
