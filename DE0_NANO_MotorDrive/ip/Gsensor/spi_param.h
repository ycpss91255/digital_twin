// Data MSB Bit
parameter   IDLE_MSB    = 14;
parameter   SI_DataL    = 16;/* input data bits to SPI */
parameter   SO_DataL    = 8; /* SPI output data bits */

// Write/Read Mode 
parameter   WRITE_MODE  = 2'b00; /* {Wn, MB} , MB: Multi-Byte */
parameter   READ_MODE   = 2'b10; /* {R, MB}  , MB: Multi-Byte */

// Initial Reg Number 
parameter   INI_NUMBER  = 4'd11;

// SPI State 
parameter   IDLE        = 1'b0;
parameter   TRANSFER    = 1'b1;

// Write Reg Address 
parameter   BW_RATE         =   6'h2c; /* Data rate and power mode control */
                                       /* [D7:D5]= 3'b000
                                               D4= LOW_POWER
                                          [D3:D0]= Rate
                                       */
parameter   POWER_CONTROL   =   6'h2d; /* Power-saving features control*/
                                       /*Register 0x2D—POWER_CTL (Read/Write)
                                         D7D6: 2'b00
                                         D5(Link):
                                         D4(AUTO_SLEEP)
                                         D3(Measure)
                                         D2(Sleep)
                                         D1D0(Wakeup): Frequency of Readings in Sleep Mode
                                        */
parameter   DATA_FORMAT     =   6'h31; /* Data format control */
                                        /* Register 0x31—DATA_FORMAT (Read/Write)
                                            D7 SELF_TEST
                                            D6 SPI
                                            D5 INT_INVERT
                                            D4 0
                                            D3 FULL_RES
                                            D2 Justify
                                            [D1:D0] Range
                                        */
parameter   INT_ENABLE      =   6'h2E; /* Interrupt enable control */
parameter   INT_MAP         =   6'h2F; /* Interrupt mapping control */
parameter   THRESH_ACT      =   6'h24; /* Activity threshold */
parameter   THRESH_INACT    =   6'h25; /* Inactivity threshold */
parameter   TIME_INACT      =   6'h26; /* Inactivity time */
parameter   ACT_INACT_CTL   =   6'h27; /* Axis enable control for activity and inactivity detection*/
parameter   THRESH_FF       =   6'h28; /* Free-fall threshold */
parameter   TIME_FF         =   6'h29; /* Free-fall time */

/* add by LSA, 20210528 */
parameter   FIFO_CTL        =   6'h38; /* Register 0x38—FIFO_CTL (Read/Write)  */
                                /*  [D7:D6] FIFO Modes,
                                    D7 D6 Mode Function
                                     0 0 Bypass FIFO is bypassed.
                                     0 1 FIFO FIFO collects up to 32 values and then stops collecting data, collecting new data only when FIFO is not full.
                                     1 0 Stream FIFO holds the last 32 data values. When FIFO is full, the oldest data is overwritten with newer data.
                                     1 1 Trigger When triggered by the trigger bit, FIFO holds the last data samples before the trigger event and then 
                                         continues to collect data until full. New data is collected only when FIFO is not full.
                                    [D5]: Trigger bit, 0 in the trigger bit links the trigger event of trigger mode to INT1,
                                                       1 links the trigger event to INT2. 
                                    [D4:D0]: Samples bit, The function of these bits depends on the FIFO mode selected(see Table 23). 
                                        (Table 23. Samples Bits Functions)
                                            FIFO Mode   | Samples Bits Function
                                            Bypass      |     None.
                                            FIFO        | Specifies how many FIFO entries are needed to trigger a watermark interrupt.
                                            Stream      | Specifies how many FIFO entries are needed to trigger a watermark interrupt.
                                            Trigger     | Specifies how many FIFO samples are retained in the FIFO buffer before a trigger event. 
                                */
parameter   FIFO_STATUS      =   6'h39; /* Register 0x39—FIFO_STATUS (Read Only)  */
                                /*  [D7] FIFO_TRIG bit, 1 in the FIFO_TRIG bit corresponds to a trigger event occurring,
                                                        0 means that a FIFO trigger event has not occurred.
                                    [D6] 0
                                    [D5:D0] Entries bits, These bits report how many data values are stored in FIFO.
                                            Access to collect the data from FIFO is provided through the
                                            DATAX, DATAY, and DATAZ registers. FIFO reads must be
                                            done in burst or multiple-byte mode because each FIFO level is
                                            cleared after any read (single- or multiple-byte) of FIFO. FIFO
                                            stores a maximum of 32 entries, which equates to a maximum
                                            of 33 entries available at any given time because an additional
                                            entry is available at the output filter of the device


                                */

// Read Reg Address
parameter   INT_SOURCE      =   6'h30; /* INT Status  */ 
                            /*  Register 0x30—INT_SOURCE (Read Only)
                                     D7        D6        D5        D4
                                DATA_READY SINGLE_TAP DOUBLE_TAP Activity
                                     D3        D2        D1        D0
                                Inactivity FREE_FALL  Watermark  Overrun
                                >> Bits set to 1 in this register indicate that their respective functions
                                >> have triggered an event, whereas a value of 0 indicates that the
                                >> corresponding event has not occurred.
                            */

parameter   X_LB            =   6'h32; /* Low Byte,  X-Axis Data 0 */  
parameter   X_HB            =   6'h33; /* High Byte, X-Axis Data 1 */
parameter   Y_LB            =   6'h34; /* Low Byte,  Y-Axis Data 0 */
parameter   Y_HB            =   6'h35; /* High Byte, Y-Axis Data 1 */
parameter   Z_LB            =   6'h36; /* Low Byte,  Z-Axis Data 0 */ 
parameter   Z_HB            =   6'h37; /* High Byte, Z-Axis Data 1 */
