// ============================================================================
// Copyright (c) 2011 by Terasic Technologies Inc. 
// ============================================================================
// ============================================================================
// Major Functions/Design Description:
//
//   Please refer to DE0_Nano_User_manual.pdf in DE0_Nano system CD.
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:   |Mod. Date:    |Changes Made:
//   V1.0  |EricChen  |02/01/2011    | terasic initial version
//   V2.0  |LiShihAn  |08/19/2015    | scan all channel, (note. each input must add a copule capcator.)
//                                     if ain input has no connect and then this pin you will receive a big noise.
// ============================================================================
module ADC_CTRL ( 
            
            iClk50M,
            iRST_n,
            iCLK,
            iCLK_n,
            iGO,
            iCH,
         
            oDval,
            oADCData, /* {dval, ch, adc_data}*/
            oCh,
         
            oDIN,
            oCS_n,
            oSCLK,
            iDOUT
    );
     
input           iClk50M;
input           iRST_n;
input           iCLK;
input           iCLK_n;
input           iGO;
input [2:0]     iCH;
output          oDval;
output [15:0]   oADCData;
output [2:0]    oCh;

output      oDIN;
output      oCS_n;
output      oSCLK;
input       iDOUT;

parameter SAMPLECNT = 2;
parameter SHIFTBIT = 2;  // log2(SAMPLECNT)

reg         data;
reg         go_en;
wire [2:0]  ch_sel;
reg         sclk;
reg  [3:0]  cont;
reg  [3:0]  m_cont;
reg  [2:0]  rChannel;
reg  [11:0]  adc_data;
reg  [15:0]  led;

assign oCS_n  = ~go_en;
assign oSCLK  = (go_en)? iCLK:1;
assign oDIN  = data;
assign ch_sel  = iCH;

reg rDlySCLK;
always@(posedge iClk50M or negedge iRST_n) begin
 if(!iRST_n)
  go_en <= 0;
 else  begin
 rDlySCLK <= iCLK;
 go_en <= go_en;
  if(iGO)
     go_en <= 1;
 end
end

always@(posedge iCLK or negedge go_en) begin
 if(!go_en)
  cont <= 0;
 else  begin
   cont <= cont + 1;
 end
end

always@(posedge iCLK_n) begin
  m_cont <= cont;
end

/* */
reg [2:0] rDlyChannel;
always@(posedge iCLK_n or negedge go_en) begin
 if(!go_en) begin
  data <= 0; rDlyChannel <= 0;
 end else  begin
    rDlyChannel <= rDlyChannel;
    case(cont)
        2: data <= rChannel[2]; //iCH[2];
        3: data <= rChannel[1]; //iCH[1];
        4: data <= rChannel[0]; //iCH[0];
        5: rDlyChannel <= rChannel;
        default: data <= 0;
    endcase
 end
end

reg rADC_Dval;
assign  oCh = rCh; // rChannel-2;  
reg [2:0]   rCh;
always@(posedge iCLK or negedge go_en) begin
    if(!go_en) begin
        adc_data <= 0;
        led   <= led;
        rADC_Dval <= 0;
        rChannel <= rChannel;
        rCh <= 0;
    end
    else begin
            rCh <= rCh;
            led <= led;
            adc_data <= adc_data;
            rADC_Dval <= 0;
            rChannel <= rChannel;
            rCh <= rCh;
            case(m_cont)
                1: begin rDlyChannel <= rChannel; end 
                4: begin adc_data[11] <= iDOUT;  end
                5: adc_data[10] <= iDOUT;
                6: adc_data[9] <= iDOUT;
                7: adc_data[8] <= iDOUT;
                8: adc_data[7] <= iDOUT; 
                9: adc_data[6] <= iDOUT;
               10: adc_data[5] <= iDOUT;
               11: adc_data[4] <= iDOUT;
               12: adc_data[3] <= iDOUT;
               13: adc_data[2] <= iDOUT;
               14: begin adc_data[1] <= iDOUT; rCh <= rChannel -1; end
               15: begin 

                    adc_data[0] <= iDOUT;
                    led <= {1'b0, rCh, adc_data[11:1], iDOUT};
                    rADC_Dval <= 1;
                    rChannel <= rChannel +1;
                    end
                1: begin 
                    
//                    led <= adc_data;
//                    rADC_Dval <= 1;
                   end
                default:  adc_data <= adc_data;
            endcase
    end  // if(!go_en) begin
end // always

reg     rDlyDval, rDval50M_t;
reg [15:0]  rTmpAdcData[1:0];
always@(posedge iClk50M or negedge iRST_n) begin
    if(!iRST_n)begin
        rDval50M_t <= 0;
        rDlyDval <= 0;
//        rTmpAdcData[0] <= 0;
        rTmpAdcData[1] <= 0;
 
    end else begin
        rDlyDval <= rADC_Dval;
//        rTmpAdcData[0] <= led;
         if({rDlyDval, rADC_Dval}==2'b01) begin
            rDval50M_t <= 1;
            rTmpAdcData[1] <= led;
        end else begin
            rDval50M_t <= 0; /* 50Mhz tirgger */
            rTmpAdcData[1] <= rTmpAdcData[1];
        end
    end
end
assign  oADCData = rTmpAdcData[1]; /**/
assign  oDval = rDval50M_t; /* 50Mhz trigger  */
/*
reg     [20:0]  rMeanADCValue, rMeanADCValueOut;
reg     [9:0]   rCnt;
reg             rDlyDval;
reg             rMeanADCValueDval;
always@(posedge iClk50M or negedge iRST_n) begin
    if(!iRST_n) begin
        rDlyDval <= 0;
        rCnt <= 0;
        rMeanADCValue <= 0;
        rMeanADCValueDval <= 0;
        rMeanADCValueOut <= 0;
    end
    else begin
        rDlyDval <= rADC_Dval;
        rMeanADCValue <= rMeanADCValue;
        if({rDlyDval, rADC_Dval}==2'b01) begin
           if(rCnt > (SAMPLECNT-1)) begin
                rMeanADCValue <= 0;
                rCnt <= 0;
                rMeanADCValueDval <= 1;
                rMeanADCValueOut <= rMeanADCValue;
            end
            else begin
                rMeanADCValue <= rMeanADCValue + led;
                rCnt <= rCnt +1;
                rMeanADCValueDval <= 0;
                rMeanADCValueOut <= rMeanADCValueOut;
            end
                
        end
        else begin
            rCnt <= rCnt;
            rMeanADCValueDval <= 0;
            rMeanADCValueOut <= rMeanADCValueOut;
        end
    end
end


assign  wDvalsort = rMeanADCValueDval;
assign  wADCDatasort = rMeanADCValueOut[$clog2(SAMPLECNT)+11:$clog2(SAMPLECNT)];

//assign  oDval = rMeanADCValueDval;
//assign  oADCData = rMeanADCValueOut[$clog2(SAMPLECNT)+11:$clog2(SAMPLECNT)];

wire           wDvalsort;
wire [11:0]    wADCDatasort;

sortmid #(.Datawidth(12)) sortmid
                (   
            
                    .iClk50M(iClk50M),           // clock input
                    .iRst_n(iRST_n),         // reset_n input
                    
                    .iDval(wDvalsort),          // data valid
                    .iDataIn(wADCDatasort),        // data input 
                    
                    .oDval(wDval_Layer2),          // data output valid
                    .oData(wData_Layer2),          // data output 
            );

wire            wDval_Layer2;
wire    [11:0]  wData_Layer2;
reg     [20:0]  rMeanADCValueL2, rMeanADCValueOutL2;
reg     [9:0]   rCntL2;
reg             rDlyDvalL2;
reg             rMeanADCValueDvalL2;
always@(posedge iClk50M or negedge iRST_n) begin
    if(!iRST_n) begin
        rDlyDvalL2 <= 0;
        rCntL2 <= 0;
        rMeanADCValueL2 <= 0;
        rMeanADCValueDvalL2 <= 0;
        rMeanADCValueOutL2 <= 0;
    end
    else begin
        rDlyDvalL2 <= wDval_Layer2;
        rMeanADCValueL2 <= rMeanADCValueL2;
        if({rDlyDvalL2, wDval_Layer2}==2'b01) begin
           if(rCntL2 > (SAMPLECNT-1)) begin
                rMeanADCValueL2 <= 0;
                rCntL2 <= 0;
                rMeanADCValueDvalL2 <= 1;
                rMeanADCValueOutL2 <= rMeanADCValueL2;
            end
            else begin
                rMeanADCValueL2 <= rMeanADCValueL2 + wData_Layer2;
                rCntL2 <= rCntL2 +1;
                rMeanADCValueDvalL2 <= 0;
                rMeanADCValueOutL2 <= rMeanADCValueOutL2;
            end
                
        end
        else begin
            rCntL2 <= rCntL2;
            rMeanADCValueDvalL2 <= 0;
            rMeanADCValueOutL2 <= rMeanADCValueOutL2;
        end
    end
end

LinearLeastSquare   # (.Datawidth(12),.DATANUM(256))  LLE (   
            
                    .iClk50M(iClk50M),           // clock input
                    .iRst_n(iRST_n),         // reset_n input
                    
                    .iDval(rMeanADCValueDvalL2),          // data valid
                    .iDataIn(rMeanADCValueOutL2[$clog2(SAMPLECNT)+11:$clog2(SAMPLECNT)]),        // data input 
//                    .iDval(rADC_Dval),          // data valid
//                    .iDataIn(led),        // data input 
                    
                    .oDval(oDval),          // data output valid
                    .oFout(oADCData)
 
            );
*/

//assign  oDval = rMeanADCValueDvalL2;
//assign  oADCData = rMeanADCValueOutL2[$clog2(SAMPLECNT)+11:$clog2(SAMPLECNT)];
//assign  oDval = rADC_Dval;
//assign  oADCData = led;
/*
 LowpassFilter_ADC #( .GAIN(0), .COUNTER(50)  )     uLow    (   
            
                    .iClk50M(iCLK),           // clock input
                    .iRst_n(iRst_n),         // reset_n input
                    
                    .iDval(rADC_Dval),          // data valid
                    .iDataIn({4'd0,led}),        // data input
                    
                    .oDval(oDval),          // data output valid
                    .oLowpassFilterDataOut(oADCData)       // average data    

            );

*/
/*
averagefilterADC   u0
                (   
            
                    .iClk50M(iCLK),           // clock input
                    .iRst_n(iRST_n),         // reset_n input
                    
                    .iDval(rADC_Dval),          // data valid
                    .iDataIn({4'd0, led}),        // data input
                    
                    .oDval(oDval),          // data output valid
                    .oAverageDataOut(oADCData),       // average data    

            );
*/

endmodule 



//============================Average Filter=============================================================
module averagefilterADC
                (   
            
                    iClk50M,           // clock input
                    iRst_n,         // reset_n input
                    
                    iDval,          // data valid
                    iDataIn,        // data input
                    
                    oDval,          // data output valid
                    oAverageDataOut       // average data    

            );

//=======================================================
//  PARAMETER declarations
//=======================================================
parameter   PIPELINELAYER = 64;                      // divide number must be 2^n
parameter   SHIFTVALUE = $clog2(PIPELINELAYER);     // shift value = $clog2(PIPELINELAYER)

//=======================================================
//  PORT declarations
//=======================================================
input               iClk50M;              // clock input
input               iRst_n;            // reset_n input
                    

input               iDval;             // data valid
input   [15:0]      iDataIn;           // data input

output              oDval;             // data output valid
output  [15:0]      oAverageDataOut;   // average data  


//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [PIPELINELAYER-1:0]      rDval;    
reg [15:0]  rTempRegister[PIPELINELAYER-1:0];
reg [15:0]  rTempAverageFilter[PIPELINELAYER-1:0];


//=======================================================
//  Structural coding
//=======================================================

integer I;



wire            wClk1ms;

Clkdiv    #( .CLKFREQ(50000000), .EXCEPTCLK(2000), .multipleX(4) ) clkdiv1ms( 
                     .iClk50M(iClk50M), // 50Mhz clock 
                     .iRst_n(iRst_n),
                     .oClk(wClk1ms)     // ExpectClk clock
                 );
                 
                 
reg     rDlyClk1ms, rDvalDly;
// pipelin save input data
always@(posedge iClk50M or negedge iRst_n) begin
    if(!iRst_n) begin
        for(I=0; I<PIPELINELAYER; I=I+1) begin
            rTempRegister[I] <= 0;
        end

    end
    else begin
        rDlyClk1ms <= wClk1ms;
        rDvalDly <= iDval;
//        if(iDval) begin
        if({rDvalDly, iDval}==2'b01) begin
            rTempRegister[0] <= iDataIn;
            for(I=0; I<PIPELINELAYER-1; I=I+1) begin
                rTempRegister[I+1] <= rTempRegister[I];
            end
        end
        else begin
            for(I=0; I<PIPELINELAYER; I=I+1) begin
                rTempRegister[I] <= rTempRegister[I];
            end
        end
    end
end

reg     rDataoutValid, r1msTriger;
// calculate average
always@(posedge iClk50M or negedge iRst_n) begin
    if(!iRst_n) begin
        rDataoutValid <= 0;
        for(I=0; I<PIPELINELAYER; I=I+1) begin
            rTempAverageFilter[I] <= 0;
            rDval[I] <= 0;
        end

    end
    else begin

        
//        if(iDval) begin
        if({rDvalDly, iDval}==2'b01) begin
            rDataoutValid <= rDval[PIPELINELAYER-1];

            rDval[0]    <= iDval;
            for(I=0; I<PIPELINELAYER-1; I=I+1) begin
                rDval[I+1] <= rDval[I];
            end
            
            rTempAverageFilter[0] <= iDataIn[15:SHIFTVALUE] + rTempRegister[0][15:SHIFTVALUE];
            for(I=0; I<PIPELINELAYER-1; I=I+1) begin
                rTempAverageFilter[I+1] <= rTempAverageFilter[I] + rTempRegister[I+1][15:SHIFTVALUE];
            end
        end
        else begin
            rDataoutValid <= 0;
            for(I=0; I<PIPELINELAYER; I=I+1) begin
                rDval[I] <= rDval[I];
            end 
            for(I=0; I<PIPELINELAYER; I=I+1) begin
                rTempAverageFilter[I] <= rTempAverageFilter[I];
            end
        end
    end
end


assign oDval = rDataoutValid; //rDval[PIPELINELAYER-1];
assign oAverageDataOut = rTempAverageFilter[PIPELINELAYER-1];

endmodule

//============================================================================================
module LowpassFilter_ADC 
                ( 
 
                    iClk50M,           // clock input 
                    iRst_n,         // reset_n input 
 
                    iDval,          // data valid 
                    iDataIn,        // data input 
 
                    oDval,          // data output valid 
                    oLowpassFilterDataOut       // average data 
 
            );  
 
//=======================================================                                     
//  PARAMETER declarations                                                                    
//=======================================================                                     
parameter   GAIN = 3'd0;                       //  divide number must be 2^n                  
parameter   COUNTER = 60;                   //  how many phase angles in each command?        
                                                                                              
//=======================================================                                     
//  PORT declarations                                                                         
//=======================================================                                     
input               	iClk50M;              // clock input                                      
input               	iRst_n;            // reset_n input                                       
                                                                                              
                                                                                              
input               	iDval;             // data valid                                          
input   signed [15:0] iDataIn;           // data input                                          
                                                                                              
output              	oDval;             // data output valid                                   
output  signed [15:0] oLowpassFilterDataOut;   // average data                                  
                                                                                              
                                                                                              
//=======================================================                                     
//  REG/WIRE declarations                                                                     
//=======================================================                                     
reg         [1:0]   rDval;
reg signed  [23:0]  rData_h; 
reg signed  [23:0]  rTempValue; 
//======================================================= 
//  Structural coding 
//======================================================= 
 
assign oDval = rDval[1]; 
assign oLowpassFilterDataOut[15:0] = rData_h[15:0]; 
 
 
always@(posedge iClk50M or negedge iRst_n) begin 
    if(!iRst_n) begin 
        rData_h <= 900;  // initial value 
        rTempValue <= 0; 
        rDval[0] <= 0; 
        rDval[1] <= 0; 
    end 
    else begin 
        rDval[0] <= iDval; 
        rDval[1] <= rDval[0]; 
        if(iDval) begin 
                // x'(t)/x(t) = a/(s+a) 
                // x'(t)-x'(t-1) = a[x(t)-x'(t)] 
                // (a+1)*x'(t)=a*x(t)+x'(t-1) 
 
//                rData_h=rData_h+8*(iDataIn-rData_h)/1000; 

 
                rTempValue <= iDataIn-rData_h;// Gain 
                rData_h <= rData_h + $signed(rTempValue)>>1;
        end 
        else begin 
//            rDval[0] <= rDval[0]; 
//            rDval[1] <= rDval[1]; 
            rTempValue <= rTempValue; 
            rData_h <= rData_h; 
        end
    end
end

endmodule 

//============================Lowpass Filter End============================================================


