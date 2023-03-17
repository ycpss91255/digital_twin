/*
    function description:
            Analog to digital convert, 8 channel for de0-nano use  
    Input:
        SPI 4 wires
    
    Output:
        8 channel digital data
*/
//`define USE_KALMAN /* use or not kalman */

module  ADC_Top(
            iClk50M,
            iSPICLK3M,  /* SPI clock 3Mhz */
            iRst_n,
            
            
            oCH0,       /* channel 0 data */
            oCH1,       /* channel 1 data */
            oCH2,       /* channel 2 data */
            oCH3,       /* channel 3 data */
            oCH4,       /* channel 4 data */
            oCH5,       /* channel 5 data */
            oCH6,       /* channel 6 data */ 
            oCH7,       /* channel 7 data */
            oCHDvl,
            
            oSPI_CLK_SAMP,  /* 9Mhz clock for debug */
            /* ADC SPI wires */
            oDIN,       /* Din */
            oCS_n,      /* CS_n */
            oSCLK,      /* SCLK */
            iDOUT       /* Dout */
    );
//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================
input           iClk50M;
input           iSPICLK3M;
input           iRst_n;
output  [15:0]  oCH0;
output  [15:0]  oCH1;
output  [15:0]  oCH2;
output  [15:0]  oCH3;
output  [15:0]  oCH4;
output  [15:0]  oCH5;
output  [15:0]  oCH6;
output  [15:0]  oCH7; 
output  [7:0]   oCHDvl;

            /* ADC SPI wires */
output          oSPI_CLK_SAMP;
output          oDIN;       /* Din */
output          oCS_n;      /* CS_n */
output          oSCLK;      /* SCLK */
input           iDOUT;      /* DO */


//=======================================================
//  REG/WIRE declarations
//=======================================================
//reg     [15:0]  oCH0, oCH1, oCH2, oCH3, oCH4, oCH5, oCH6, oCH7;
reg     [15:0]  rCH0, rCH1, rCH2, rCH3, rCH4, rCH5, rCH6, rCH7;
wire            wSPI_CLK;
wire            wSPI_CLK_n;
wire    [15:0]  wADC_Data;
wire            wADC_DataDVAl;
reg             rGo;
reg  [7:0]      rCHDvl;
wire    [2:0]   wCh;

//=======================================================
//  Structural coding
//=======================================================
`ifndef USE_KALMAN

/*======== Export data ===========*/
assign oCHDvl = rCHDvl;
assign oCH0 = rCH0;
assign oCH1 = rCH1;
assign oCH2 = rCH2;
assign oCH3 = rCH3;
assign oCH4 = rCH4;
assign oCH5 = rCH5;
assign oCH6 = rCH6;
assign oCH7 = rCH7;
/*========================*/
`endif /* `ifndef USE_KALMAN */

/* generate 3Mhz clock */
//SPIPLL  U0  (
//                        .inclk0(iClk50M),   /* 50Mhz clock */
//                        .c0(wSPI_CLK),      /* 3Mhz clock */
//                        .c1(wSPI_CLK_n),    /* 3Mhz clock, 180 degree */
//                        .c2(oSPI_CLK_SAMP)  /* 9Mhz clock for debug */
//                    );
assign wSPI_CLK = iSPICLK3M;
assign wSPI_CLK_n = ~iSPICLK3M;

reg         rDlyDval;

always@(posedge iClk50M or  negedge iRst_n) begin
    if(!iRst_n) begin
        rGo <= 0; rDlyDval <= 0;
        rCH0 <= 0; rCH1 <= 0; rCH2 <= 0; rCH3 <= 0;
        rCH4 <= 0; rCH5 <= 0; rCH6 <= 0; rCH7 <= 0;
        rCHDvl <= 0; 
    end
    else begin
        rGo <= 1;
//        rDlyDval <= wADC_DataDVAl;
//        rCHDvl <= 0; 
        rCH0 <= rCH0; rCH1 <= rCH1; rCH2 <= rCH2; rCH3 <= rCH3;
        rCH4 <= rCH4; rCH5 <= rCH5; rCH6 <= rCH6; rCH7 <= rCH7;
//        if({rDlyDval,wADC_DataDVAl}==2'b01) begin
        if(wADC_DataDVAl) begin
            case(wCh)
                0: begin rCHDvl[0] <= wADC_DataDVAl; end
                1: begin rCHDvl[1] <= wADC_DataDVAl; end
                2: begin rCHDvl[2] <= wADC_DataDVAl; end 
                3: begin rCHDvl[3] <= wADC_DataDVAl; end
                4: begin rCHDvl[4] <= wADC_DataDVAl; end 
                5: begin rCHDvl[5] <= wADC_DataDVAl; end
                6: begin rCHDvl[6] <= wADC_DataDVAl; end
                7: begin rCHDvl[7] <= wADC_DataDVAl; end
            endcase
        end else begin
            rCHDvl <= 0; 
        end

        if(wADC_DataDVAl) begin
            case(wCh)
                0: begin rCH0 <= wADC_Data;   end
                1: begin rCH1 <= wADC_Data;   end
                2: begin rCH2 <= wADC_Data;   end 
                3: begin rCH3 <= wADC_Data;   end
                4: begin rCH4 <= wADC_Data;   end 
                5: begin rCH5 <= wADC_Data;   end
                6: begin rCH6 <= wADC_Data;   end
                7: begin rCH7 <= wADC_Data;   end
            endcase
        end

    end
end

wire        wADCDATAError;


ADC_CTRL ADC_CTRL( 
            
            .iClk50M    (iClk50M),
            .iRST_n     (iRst_n),
            .iCLK       (wSPI_CLK),
            .iCLK_n     (wSPI_CLK_n),
            .iGO        (rGo),
//            .iCH,
         
            .oDval      (wADC_DataDVAl),
            .oADCData   (wADC_Data),
            .oCh        (wCh),
            /* SPI protocol */
            .oDIN       (oDIN),
            .oCS_n      (oCS_n),
            .oSCLK      (oSCLK),
            .iDOUT      (iDOUT)
    );

`ifdef USE_KALMAN
        /* Kalman filter for channel 0 */
    kfa_v2 ch0(
        .iClk_50M(iClk50M),     // 50 clk
        .iRst_n(iRst_n),        // iRst_n 
        
        .iData(rCH0[11:0]),           // sensor data 
        .iDval(rCHDvl[0]),      // data valid trigger

        .oEstData(oCH0),        // estimate value
        .oDval(oCHDvl[0])

    );
    /* Kalman filter for channel 1 */
    kfa_v2 ch1(
        .iClk_50M(iClk50M),     // 50 clk
        .iRst_n(iRst_n),        // iRst_n 
        
        .iData(rCH1[11:0]),           // sensor data 
        .iDval(rCHDvl[1]),      // data valid trigger

        .oEstData(oCH1),        // estimate value
        .oDval(oCHDvl[1])

    );
    /* Kalman filter for channel 2 */
    kfa_v2 ch2(
        .iClk_50M(iClk50M),     // 50 clk
        .iRst_n(iRst_n),        // iRst_n 
        
        .iData(rCH2[11:0]),     // sensor data 
        .iDval(rCHDvl[2]),      // data valid trigger

        .oEstData(oCH2),        // estimate value
        .oDval(oCHDvl[2])

    );
    /* Kalman filter for channel 3 */
    kfa_v2 ch3(
        .iClk_50M(iClk50M),     // 50 clk
        .iRst_n(iRst_n),        // iRst_n 
        
        .iData(rCH3[11:0]),     // sensor data 
        .iDval(rCHDvl[3]),      // data valid trigger

        .oEstData(oCH3),        // estimate value
        .oDval(oCHDvl[3])

    );
    /* Kalman filter for channel 4 */
    kfa_v2 ch4(
        .iClk_50M(iClk50M),     // 50 clk
        .iRst_n(iRst_n),        // iRst_n 
        
        .iData(rCH4[11:0]),     // sensor data 
        .iDval(rCHDvl[4]),      // data valid trigger

        .oEstData(oCH4),        // estimate value
        .oDval(oCHDvl[4])
        

    );
    /* Kalman filter for channel 5 */
    kfa_v2 ch5(
        .iClk_50M(iClk50M),     // 50 clk
        .iRst_n(iRst_n),        // iRst_n 
        
        .iData(rCH5[11:0]),           // sensor data 
        .iDval(rCHDvl[5]),      // data valid trigger

        .oEstData(oCH5),        // estimate value
        .oDval(oCHDvl[5])

    );
    /* Kalman filter for channel 6 */
    kfa_v2 ch6(
        .iClk_50M(iClk50M),     // 50 clk
        .iRst_n(iRst_n),        // iRst_n 
        
        .iData(rCH6[11:0]),     // sensor data 
        .iDval(rCHDvl[6]),      // data valid trigger

        .oEstData(oCH6),        // estimate value
        .oDval(oCHDvl[6])
        

    );
    /* Kalman filter for channel 7 */
    kfa_v2 ch7(
        .iClk_50M(iClk50M),     // 50 clk
        .iRst_n(iRst_n),        // iRst_n 
        
        .iData(rCH7[11:0]),     // sensor data 
        .iDval(rCHDvl[7]),      // data valid trigger

        .oEstData(oCH7),        // estimate value
        .oDval(oCHDvl[7])

    );
`endif /* `ifdef USE_KALMAN */
endmodule 




