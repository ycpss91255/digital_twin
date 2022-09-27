/*
    function : 3 wires SPI protocol
*/
module spi_controller (
                        /*  SPI sync */
                            iRSTN,
                            iSPI_CLK,
                            iSPI_CLK_OUT,
                            /* host signals*/
                            iP2S_DATA,  /* Host to slave data */
                            iSPI_GO,    /* SPI Activate */
                            oSPI_END,   /* SPI transfer complete */
                            oS2P_DATA,  /* SPI read data */
                            
                            /* SPI 3wires */
                            SPI_SDIO,  /* SPI SDA */
                            oSPI_CSN,  /* SPI CSn */
                            oSPI_CLK   /* SPI SCLK */
                            );
    
`include "spi_param.h"  

//=======================================================
//  PORT declarations
//=======================================================
//	Host Side
input                       iRSTN;
input                       iSPI_CLK;
input                       iSPI_CLK_OUT;
input       [SI_DataL-1:0]  iP2S_DATA; 
input                       iSPI_GO;
output                      oSPI_END;
output  reg [SO_DataL-1:0]  oS2P_DATA;
//	SPI Side              
inout                       SPI_SDIO; /* SPI SDA */
output                      oSPI_CSN; /* SPI CSn */
output                      oSPI_CLK; /* SPI SCLK */

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire                read_mode, write_address;
reg                 spi_count_en;
reg     [3:0]		spi_count;

//=======================================================
//  Structural coding
//=======================================================
assign read_mode = iP2S_DATA[SI_DataL-1];
assign write_address = spi_count[3];
assign oSPI_END = ~|spi_count;
assign oSPI_CSN = ~iSPI_GO;
assign oSPI_CLK = spi_count_en ? iSPI_CLK_OUT : 1'b1;
assign SPI_SDIO = spi_count_en && (!read_mode || write_address) ? iP2S_DATA[spi_count] : 1'bz;

always @ (posedge iSPI_CLK or negedge iRSTN) 
    if (!iRSTN) begin
        spi_count_en <= 1'b0;
        spi_count <= 4'hf;
        oS2P_DATA <= 0;
    end
    else begin
        spi_count_en <= spi_count_en;
        spi_count <= spi_count;
        oS2P_DATA <= oS2P_DATA;
        if (oSPI_END)
            spi_count_en <= 1'b0;
        else if (iSPI_GO)
            spi_count_en <= 1'b1;
            
        if (!spi_count_en)
            spi_count <= 4'hf;
        else
            spi_count <= spi_count - 4'b1;

        if (read_mode && !write_address)
            oS2P_DATA <= {oS2P_DATA[SO_DataL-1:0], SPI_SDIO};
    end

endmodule
