module ADC_Current_top (
            iClk,
            iRst_n,

            // Current Data
            iGO,
            iCH,
            oADCData,
            
            // SPI
            oDIN,
            oCS_n,
            oSCLK,
            iDOUT
            

            );
            
input          iClk;
input          iRst_n;

            // Current Data
input           iGO;
input           iCH;
output  [11:0]  oADCData;
            
            // SPI
output          oDIN;
output          oCS_n;
output          oSCLK;
input           iDOUT;
            
//=====ADC SPI===========
wire            wSPI_CLK;
wire            wSPI_CLK_n;
wire    [11:0]  wADC_Data;
SPIPLL  U0  (
                        .inclk0(iClk),
                        .c0(wSPI_CLK),
                        .c1(wSPI_CLK_n)
                    );

ADC_CTRL    U1  (
                        .iRST_n(iRst_n),
                        .iCLK(wSPI_CLK),
                        
                        .iCLK_n(wSPI_CLK_n),
                        .iGO(iGO),
                        .iCH(iCH),
                        .oADCData(oADCData),
                        
                        .oDIN(oDIN),
                        .oCS_n(oCS_n),
                        .oSCLK(oSCLK),
                        .iDOUT(iDOUT)
                    );

                    
endmodule
