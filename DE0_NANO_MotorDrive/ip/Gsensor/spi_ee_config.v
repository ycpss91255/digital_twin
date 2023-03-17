module spi_ee_config (
                    iRSTN,       /* reset_n */
                    iSPI_CLK,    /* SPI clock */
                    iSPI_CLK_OUT,/* SPI clock_n */

                    oDATA_L,,    /* G-sensor Data (Low Byte)*/
                    oDATA_H,,    /* G-sensor Data (High Byte) */
                    
                    /* export G-sensor data */
                    oAxisX,     /* X-axis data */
                    oAxisY,     /* Y-axis data */
                    oAxisZ,     /* X-axis data */
                    oDval,      /* X,Y,Z Data valid */
                    
                    /* G-sensor signals */
                    iG_INT2,     /* G-sensor interrupt */
                    SPI_SDIO,    /* SPI DATA */
                    oSPI_CSN,    /* SPI CS_n */
                    oSPI_CLK);   /* SPI CLK */

            
`include "spi_param.h"
    
//=======================================================
//  PORT declarations
//=======================================================
/*  Host Side   */
input                   iRSTN;  /* reset_n */
input                   iSPI_CLK; /* SPI clock */
input                   iSPI_CLK_OUT; /* SPI clock */
input                   iG_INT2;
output reg [SO_DataL-1:0] oDATA_L;
output reg [SO_DataL-1:0] oDATA_H;

output reg [15:0]   oAxisX;/* X-axis data */
output reg [15:0]   oAxisY;/* Y-axis data */
output reg [15:0]   oAxisZ;/* Z-axis data */
output reg          oDval; /* X,Y,Z Data valid */


/*  SPI Side (3-wires ) */
inout                   SPI_SDIO;  /* SPI data */
output                  oSPI_CSN;  /* SPI cs_n */
output                  oSPI_CLK;  /* SPI clock */       
                               
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg     [3:0]          ini_index;
reg     [SI_DataL-3:0] write_data;  /* {A[5:0], D[7:0]}, SPI data not include R/Wn and MB */
reg     [SI_DataL-1:0] p2s_data;
reg                    spi_go;
wire                   spi_end;
wire    [SO_DataL-1:0] s2p_data; 
reg     [SO_DataL-1:0] low_byte_data;
reg                    spi_state;
reg                    high_byte; /* indicate to read the high or low byte */
reg                    read_back; /* indicate to read back data */
reg                    clear_status, read_ready;
reg     [3:0]          clear_status_d;  /* clear_status delay shift */
reg                    high_byte_d, read_back_d;
reg	    [IDLE_MSB:0]   read_idle_count; // reducing the reading rate

//=======================================================
//  Sub-module
//=======================================================
spi_controller u_spi_controller (   
                            /* sync signals */
                            .iRSTN      (iRSTN),
                            .iSPI_CLK   (iSPI_CLK),
                            .iSPI_CLK_OUT(iSPI_CLK_OUT),
                            
                            .iP2S_DATA  (p2s_data), /* send host data to SPI */
                            .iSPI_GO    (spi_go),   /* SPI go start */
                            .oSPI_END   (spi_end),  /* SPI send data complete */
                            .oS2P_DATA  (s2p_data), /* SPI read data */
                            
                            /* SPI -3Wires */ 
                            .SPI_SDIO   (SPI_SDIO),
                            .oSPI_CSN   (oSPI_CSN),
                            .oSPI_CLK   (oSPI_CLK));
                            
//=======================================================
//  Structural coding
//=======================================================
// Initial Setting Table
always @ (ini_index)
    case (ini_index)
    0      : write_data = {THRESH_ACT,    8'h20}; /* set Activity threshold to 8'h20 */
    1      : write_data = {THRESH_INACT,  8'h03}; /* set Inactivity threshold to 8'h03 */
    2      : write_data = {TIME_INACT,    8'h01}; /* set Inactivity time to 8'h01 */
    3      : write_data = {ACT_INACT_CTL, 8'h7f}; /* Axis enable control for activity and inactivity detection */
    4      : write_data = {THRESH_FF,     8'h09}; /* set Free-fall threshold to 8'h09 */
    5      : write_data = {TIME_FF,       8'h46}; /* set Free-fall time to 8'h46 */
    6      : write_data = {BW_RATE,       8'h0F}; /* output data rate : 50 Hz */
                                                  /* Register 0x2C—BW_RATE (Read/Write)
                                                    [D7:D5]: 3'b000. no use
                                                         D4: LOW_POWER, 0: normal operation.
                                                    [D3:D0]: Rate, These bits select the device bandwidth and output data rate 
                                                    (see Table 7 and Table 8 for details). The default value is 0x0A, which 
                                                    translates to a 100 Hz output data rate.
                                                    output data tate
                                                    4'b1111: 3200Hz
                                                    4'b1001: 50Hz
                                                    
                                                  */
    7      : write_data = {INT_ENABLE,    8'h10}; /* set Interrupt enable control to 8'h10 */
                                                  /* Register 0x2E—INT_ENABLE (Read/Write)
                                                         D7         D6         D5        D4
                                                     DATA_READY SINGLE_TAP DOUBLE_TAP Activity
                                                         D3         D2         D1        D0
                                                     Inactivity FREE_FALL  Watermark  Overrun 
                                                     >> Setting bits in this register to a value of 1 enables their respective
                                                     >> functions to generate interrupts, whereas a value of 0 prevents
                                                     >> the functions from generating interrupts. 
                                                  */
    
    8      : write_data = {INT_MAP,       8'h10}; /* set Interrupt mapping control to 8'h10 */
                                                  /* Register 0x2F—INT_MAP (R/W)
                                                        D7         D6        D5        D4
                                                    DATA_READY SINGLE_TAP DOUBLE_TAP Activity
                                                        D3        D2         D1        D0
                                                    Inactivity FREE_FALL  Watermark  Overrun
                                                    >> Any bits set to 0 in this register send their respective interrupts to the INT1 pin, 
                                                    >> whereas bits set to 1 send their respective interrupts to the INT2 pin. 
                                                    >> All selected interrupts for a given pin are OR’ed.
                                                  */
    9      : write_data = {DATA_FORMAT,   8'h40}; /* set 3 wires, 
                                                     bit7(SELF_TEST Bit): 0, disables the self-test force.  
                                                     bit6(SPI Bit): 1, in the SPI bit sets the device to 3-wire SPI mode
                                                     bit5(INT_INVERT Bit): 0, sets the interrupts to active high 
                                                     bit4(No Use): 0
                                                     bit3(FULL_RES Bit): 0, the device is in 10-bit mode
                                                     bit2(Justify Bit):  0, selects right-justified mode with sign extension
                                                     bit[1,0](Range Bits ): 0, g range setting. set g to +-2g
                                                  */
    default: write_data = {POWER_CONTROL, 8'h08}; /* set Power-saving features control to 8'h08 */
    endcase

reg [1:0] rRegCnt;
always@(posedge iSPI_CLK or negedge iRSTN) begin
    if(!iRSTN)  begin
        ini_index   <= 4'b0;
        spi_go      <= 1'b0;
        spi_state   <= IDLE;
        read_idle_count <= 0;   // read mode only
        high_byte   <= 1'b0;    // read mode only
        read_back   <= 1'b0;    // read mode only
        clear_status <= 1'b0;
        read_ready <= 1'b0;
        rRegCnt  <= 0;  /* register counter */
        oAxisX <= 0;oAxisY <= 0;oAxisZ <= 0;
        oDval <= 0; 
    end
    else begin 
        oAxisX <= oAxisX; oAxisY <= oAxisY; oAxisZ <= oAxisZ;
        ini_index   <= ini_index;
        spi_go      <= spi_go;
        spi_state   <= spi_state;
        read_idle_count <= read_idle_count;   // read mode only
        high_byte <= high_byte;      // read mode only
        read_back <= read_back;      // read mode only
        read_ready <= read_ready;
        clear_status <= clear_status;
        low_byte_data <= low_byte_data;
        rRegCnt <= rRegCnt;
        p2s_data <= p2s_data;
        oDval <= 0;
        // initial setting (write mode)
        if(ini_index < INI_NUMBER) begin
            rRegCnt <= 0;
            case(spi_state)
                IDLE : begin
                        p2s_data    <= {WRITE_MODE, write_data}; /* {Wn, MB(0), write_data } */
                        spi_go      <= 1'b1;        /* enable SPI controller */
                        spi_state   <= TRANSFER;    /* goto TRANSFER state */
                end
                TRANSFER : begin
                        if (spi_end) begin /* wait SPI transfer complete */
                            ini_index   <= ini_index + 4'b1; /* read next ini_index */
                            spi_go      <= 1'b0;
                            spi_state   <= IDLE;
                        end
                end
            endcase
        // read data and clear interrupt (read mode)
        end else begin
            case(spi_state)
                IDLE : begin
                        read_idle_count <= read_idle_count + 1;
                        if (high_byte) begin // multiple-byte read
                                             /* 2nd send High byte */
//                            p2s_data[15:8] <= {READ_MODE, X_HB};
                            case (rRegCnt)
                                0: p2s_data[15:8] <= {READ_MODE, X_HB};
                                1: p2s_data[15:8] <= {READ_MODE, Y_HB};
                                2: p2s_data[15:8] <= {READ_MODE, Z_HB};
                            endcase 
                            read_back <= 1'b1;
                            if( rRegCnt >= 2 ) begin
                                rRegCnt <= 0;
                            end else begin
                                rRegCnt <= rRegCnt +1;
                            end
                        end
                        else if (read_ready) begin /* 1st send LOw byte register */
//                            p2s_data[15:8] <= {READ_MODE, X_LB};
                            case (rRegCnt)
                                0: p2s_data[15:8] <= {READ_MODE, X_LB};
                                1: p2s_data[15:8] <= {READ_MODE, Y_LB};
                                2: p2s_data[15:8] <= {READ_MODE, Z_LB};
                            endcase 
                            read_back      <= 1'b1;
                        end else if (!clear_status_d[3] && iG_INT2 || read_idle_count[IDLE_MSB]) begin 
                            p2s_data[15:8] <= {READ_MODE, INT_SOURCE}; /* read Interrupt status register */
                            clear_status   <= 1'b1;
                        end
                            
                         /* wait iG_INT2 and send SPI go */
                        if (high_byte || read_ready || read_idle_count[IDLE_MSB] || !clear_status_d[3] && iG_INT2) begin
                            spi_go    <= 1'b1;
                            spi_state <= TRANSFER;
                        end

                        if (read_back_d) begin// update the read back data
                            if (high_byte_d) begin
                                oDATA_H <= s2p_data;
                                oDATA_L <= low_byte_data;
                                case (rRegCnt)
                                    0: begin oAxisZ <= {s2p_data, low_byte_data}; oDval <= 1; end
                                    1: oAxisX <= {s2p_data, low_byte_data};
                                    2: oAxisY <= {s2p_data, low_byte_data};
                                endcase 
                            end
                            else
                                low_byte_data <= s2p_data;
                        end
                end /* IDLE end*/
                TRANSFER : begin
                        if (spi_end) begin
                            spi_go      <= 1'b0;
                            spi_state   <= IDLE;
                            
                            if (read_back) begin
                                read_back <= 1'b0;
                                high_byte <= !high_byte;
                                read_ready <= 1'b0;
                            end
                            else begin
                                clear_status <= 1'b0;
                                read_ready <= s2p_data[6];
                                read_idle_count <= 0;
                            end
                        end
                end/* TRANSFER end */
            endcase
        end
    end
 end

 always@(posedge iSPI_CLK or negedge iRSTN)
    if(!iRSTN) begin
        high_byte_d <= 1'b0;
        read_back_d <= 1'b0;
        clear_status_d <= 4'b0;
    end
    else begin
        high_byte_d <= high_byte;
        read_back_d <= read_back;
        clear_status_d <= {clear_status_d[2:0], clear_status};
    end

endmodule
