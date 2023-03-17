
module SensorFifoShowAhead (
        aclr,
        /* write side */
        wrclk,
        wrreq,
        data,
        wrfull,
        /* read side */
        rdclk,
        rdreq,
        q,
        rdNoEmpty  /* 1: fifo have data to read */
    );

    parameter DW = 32; /* data width */
    parameter depth = 8; /* fifo depth */
    
    input           aclr;
    input   [DW-1:0]  data;
    input           rdclk;
    input           rdreq;
    input           wrclk;
    input           wrreq;
    output  [DW-1:0]  q;
    output          rdNoEmpty;
    output          wrfull;
    
    wire    wFifoEmpty;
    assign rdNoEmpty = ~wFifoEmpty;

    dcfifo  dcfifo_component (
                .aclr (aclr),
                /* write side */
                .wrclk (wrclk),
                .wrreq (wrreq),
                .data   (data),
                .wrfull (wrfull),
                
                /* read side */
                .rdclk  (rdclk),
                .rdreq  (rdreq),
                .q      (q),
                .rdempty (wFifoEmpty),
                .rdfull (),
                .rdusedw (),
                .wrempty (),
                .wrusedw ());
    defparam
        dcfifo_component.intended_device_family = "Cyclone IV E",
        dcfifo_component.lpm_numwords = depth,
        dcfifo_component.lpm_showahead = "ON",
        dcfifo_component.lpm_type = "dcfifo",
        dcfifo_component.lpm_width = DW,
        dcfifo_component.lpm_widthu = $clog2(depth),
        dcfifo_component.overflow_checking = "ON",
        dcfifo_component.rdsync_delaypipe = 4,
        dcfifo_component.read_aclr_synch = "OFF",
        dcfifo_component.underflow_checking = "ON",
        dcfifo_component.use_eab = "ON",
        dcfifo_component.write_aclr_synch = "OFF",
        dcfifo_component.wrsync_delaypipe = 4;


endmodule

