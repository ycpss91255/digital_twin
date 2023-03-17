// ============================================================================
// Copyright (c) 2021 by TKU I.C.LAB. 
// ============================================================================
// Major Functions/Design Description:
//
//   Gsensor Top module
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:      |Mod. Date:     |Changes Made:
//   V1.0  |Terasic Inc. |2021.5.4       | initial 
//   V2.0  |Shih-An Li   |2021.5.30      | add gsensor register
// ============================================================================
module GSensor_Top(
        iClk50M,    /* clock 50Mhz */
        iRst_n,
        
        oAxisX,     /* X-axis data */
        oAxisY,     /* Y-axis data */
        oAxisZ,     /* Z-axis data */
        oGSenorDval,/* Gsensor Dval */
        
        /* export GPIO */
        oLED,
        
        /* G-Sensor signals (3-Wires)*/
        iG_SENSOR_INT,  /*G_SENSOR Interrupt*/
        SPI_SDIO,   /* SPI Data */
        oSPI_CSn,   /* SPI CS_n */
        oSPI_CLK    /* SPI clock */
);

input           iClk50M;
input           iRst_n;
        
output [9:0]   oAxisX; /* X-axis data */
output [9:0]   oAxisY; /* Y-axis data */
output [9:0]   oAxisZ; /* Z-axis data */
output reg      oGSenorDval;    /* Gsensor Dval */

        /* export GPIO */
output [7:0]    oLED;
        
        /* G-Sensor signals (3-Wires)*/
input           iG_SENSOR_INT;  /*G_SENSOR Interrupt*/
inout           SPI_SDIO;       /* SPI Data */
output          oSPI_CSn;       /* SPI CS_n */
output          oSPI_CLK;       /* SPI clock */

wire            spi_clk, spi_clk_n;
wire    [15:0]  data_x, data_y, data_z;
reg             rDval_d;
wire            wGSensorDval;
//  PLL            
//spipll u_spipll (
//            .areset (!iRst_n),
//            .inclk0 (iClk50M),
//            .c0     (spi_clk),       // 2MHz, clock phase shift 
////            .c1     (spi_clk_n)      // 2MHz, clock phase shift 180 degree
//            );
ClkDiv5Mhz ClkDiv5Mhz(
        .iClk50M(iClk50M),
        .iRst_n(iRst_n),
        
        .oClk5M(spi_clk),
        .oClk5M_n(spi_clk_n)
);
 
//assign spi_clk_n = ~spi_clk;
//  Initial Setting and Data Read Back
wire    [15:0]  wAxisX, wAxisY, wAxisZ;
assign oAxisX = wAxisX[9:0];
assign oAxisY = wAxisY[9:0];
assign oAxisZ = wAxisZ[9:0];
 spi_ee_config u_spi_ee_config (
                        .iRSTN          (iRst_n),       /* reset_n */
                        .iSPI_CLK       (spi_clk),      /* SPI clock */
                        .iSPI_CLK_OUT   (spi_clk_n),   /* SPI clock_n */
                        
                        /* export data */
//                        .oDATA_L    (data_x[7:0]),
//                        .oDATA_H    (data_x[15:8]),
                        /* export G-sensor data */
                        .oAxisX (wAxisX),        /* X-axis data */
                        .oAxisY (wAxisY),        /* Y-axis data */
                        .oAxisZ (wAxisZ),        /* Z-axis data */
                        .oDval  (wGSensorDval),   /* GSensor Dval*/
                        
                        /* G-sensor signals */
                        .iG_INT2    (iG_SENSOR_INT),/* G-sensor interrupt */
                        .SPI_SDIO   (SPI_SDIO),     /* SPI DATA */
                        .oSPI_CSN   (oSPI_CSn),     /* SPI CS_n */
                        .oSPI_CLK   (oSPI_CLK));    /* SPI CLK */
                        
/* generate 50Mhz Dval trigger */
always@(posedge iClk50M or negedge iRst_n )begin
    if(!iRst_n) begin
        rDval_d <= 0; oGSenorDval <= 0;
    end else begin
        rDval_d <= wGSensorDval;
        if({rDval_d, wGSensorDval}==2'b01)begin
            oGSenorDval <= 1;
        end else begin
            oGSenorDval <= 0;
        end
    end
end
 
endmodule

module ClkDiv5Mhz(
        iClk50M,
        iRst_n,
        
        oClk5M,
        oClk5M_n
);
input           iClk50M;
input           iRst_n;
        
output reg      oClk5M;
output          oClk5M_n;
reg [31:0]      rCnt;
assign oClk5M_n = ~oClk5M;
always@(posedge iClk50M or negedge iRst_n)begin
    if(!iRst_n )begin
        rCnt <= 0;
        oClk5M <= 0;
    end else begin
        if(rCnt >=(50000000/(5000000*2)-1))begin
            oClk5M <= ~oClk5M;
            rCnt <= 0;
        end else begin
            oClk5M <= oClk5M;
            rCnt <= rCnt+1;
        end 
    end
end


endmodule
