//Legal Notice: (C)2021 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_ic_data_module (
                                     // inputs:
                                      clock,
                                      data,
                                      rdaddress,
                                      rden,
                                      wraddress,
                                      wren,

                                     // outputs:
                                      q
                                   )
;

  parameter lpm_file = "UNUSED";


  output  [ 31: 0] q;
  input            clock;
  input   [ 31: 0] data;
  input   [  9: 0] rdaddress;
  input            rden;
  input   [  9: 0] wraddress;
  input            wren;

  wire    [ 31: 0] q;
  wire    [ 31: 0] ram_q;
  assign q = ram_q;
  altsyncram the_altsyncram
    (
      .address_a (wraddress),
      .address_b (rdaddress),
      .clock0 (clock),
      .data_a (data),
      .q_b (ram_q),
      .rden_b (rden),
      .wren_a (wren)
    );

  defparam the_altsyncram.address_reg_b = "CLOCK0",
           the_altsyncram.maximum_depth = 0,
           the_altsyncram.numwords_a = 1024,
           the_altsyncram.numwords_b = 1024,
           the_altsyncram.operation_mode = "DUAL_PORT",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.rdcontrol_reg_b = "CLOCK0",
           the_altsyncram.read_during_write_mode_mixed_ports = "DONT_CARE",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_b = 32,
           the_altsyncram.widthad_a = 10,
           the_altsyncram.widthad_b = 10;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_ic_tag_module (
                                    // inputs:
                                     clock,
                                     data,
                                     rdaddress,
                                     rden,
                                     wraddress,
                                     wren,

                                    // outputs:
                                     q
                                  )
;

  parameter lpm_file = "UNUSED";


  output  [ 22: 0] q;
  input            clock;
  input   [ 22: 0] data;
  input   [  6: 0] rdaddress;
  input            rden;
  input   [  6: 0] wraddress;
  input            wren;

  wire    [ 22: 0] q;
  wire    [ 22: 0] ram_q;
  assign q = ram_q;
  altsyncram the_altsyncram
    (
      .address_a (wraddress),
      .address_b (rdaddress),
      .clock0 (clock),
      .data_a (data),
      .q_b (ram_q),
      .rden_b (rden),
      .wren_a (wren)
    );

  defparam the_altsyncram.address_reg_b = "CLOCK0",
           the_altsyncram.init_file = lpm_file,
           the_altsyncram.maximum_depth = 0,
           the_altsyncram.numwords_a = 128,
           the_altsyncram.numwords_b = 128,
           the_altsyncram.operation_mode = "DUAL_PORT",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.rdcontrol_reg_b = "CLOCK0",
           the_altsyncram.read_during_write_mode_mixed_ports = "OLD_DATA",
           the_altsyncram.width_a = 23,
           the_altsyncram.width_b = 23,
           the_altsyncram.widthad_a = 7,
           the_altsyncram.widthad_b = 7;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_bht_module (
                                 // inputs:
                                  clock,
                                  data,
                                  rdaddress,
                                  rden,
                                  wraddress,
                                  wren,

                                 // outputs:
                                  q
                               )
;

  parameter lpm_file = "UNUSED";


  output  [  1: 0] q;
  input            clock;
  input   [  1: 0] data;
  input   [  7: 0] rdaddress;
  input            rden;
  input   [  7: 0] wraddress;
  input            wren;

  wire    [  1: 0] q;
  wire    [  1: 0] ram_q;
  assign q = ram_q;
  altsyncram the_altsyncram
    (
      .address_a (wraddress),
      .address_b (rdaddress),
      .clock0 (clock),
      .data_a (data),
      .q_b (ram_q),
      .rden_b (rden),
      .wren_a (wren)
    );

  defparam the_altsyncram.address_reg_b = "CLOCK0",
           the_altsyncram.init_file = lpm_file,
           the_altsyncram.maximum_depth = 0,
           the_altsyncram.numwords_a = 256,
           the_altsyncram.numwords_b = 256,
           the_altsyncram.operation_mode = "DUAL_PORT",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.rdcontrol_reg_b = "CLOCK0",
           the_altsyncram.read_during_write_mode_mixed_ports = "OLD_DATA",
           the_altsyncram.width_a = 2,
           the_altsyncram.width_b = 2,
           the_altsyncram.widthad_a = 8,
           the_altsyncram.widthad_b = 8;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_register_bank_a_module (
                                             // inputs:
                                              clock,
                                              data,
                                              rdaddress,
                                              wraddress,
                                              wren,

                                             // outputs:
                                              q
                                           )
;

  parameter lpm_file = "UNUSED";


  output  [ 31: 0] q;
  input            clock;
  input   [ 31: 0] data;
  input   [  4: 0] rdaddress;
  input   [  4: 0] wraddress;
  input            wren;

  wire    [ 31: 0] q;
  wire    [ 31: 0] ram_q;
  assign q = ram_q;
  altsyncram the_altsyncram
    (
      .address_a (wraddress),
      .address_b (rdaddress),
      .clock0 (clock),
      .data_a (data),
      .q_b (ram_q),
      .wren_a (wren)
    );

  defparam the_altsyncram.address_reg_b = "CLOCK0",
           the_altsyncram.init_file = lpm_file,
           the_altsyncram.maximum_depth = 0,
           the_altsyncram.numwords_a = 32,
           the_altsyncram.numwords_b = 32,
           the_altsyncram.operation_mode = "DUAL_PORT",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.rdcontrol_reg_b = "CLOCK0",
           the_altsyncram.read_during_write_mode_mixed_ports = "OLD_DATA",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_b = 32,
           the_altsyncram.widthad_a = 5,
           the_altsyncram.widthad_b = 5;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_register_bank_b_module (
                                             // inputs:
                                              clock,
                                              data,
                                              rdaddress,
                                              wraddress,
                                              wren,

                                             // outputs:
                                              q
                                           )
;

  parameter lpm_file = "UNUSED";


  output  [ 31: 0] q;
  input            clock;
  input   [ 31: 0] data;
  input   [  4: 0] rdaddress;
  input   [  4: 0] wraddress;
  input            wren;

  wire    [ 31: 0] q;
  wire    [ 31: 0] ram_q;
  assign q = ram_q;
  altsyncram the_altsyncram
    (
      .address_a (wraddress),
      .address_b (rdaddress),
      .clock0 (clock),
      .data_a (data),
      .q_b (ram_q),
      .wren_a (wren)
    );

  defparam the_altsyncram.address_reg_b = "CLOCK0",
           the_altsyncram.init_file = lpm_file,
           the_altsyncram.maximum_depth = 0,
           the_altsyncram.numwords_a = 32,
           the_altsyncram.numwords_b = 32,
           the_altsyncram.operation_mode = "DUAL_PORT",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.rdcontrol_reg_b = "CLOCK0",
           the_altsyncram.read_during_write_mode_mixed_ports = "OLD_DATA",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_b = 32,
           the_altsyncram.widthad_a = 5,
           the_altsyncram.widthad_b = 5;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_dc_tag_module (
                                    // inputs:
                                     clock,
                                     data,
                                     rdaddress,
                                     wraddress,
                                     wren,

                                    // outputs:
                                     q
                                  )
;

  parameter lpm_file = "UNUSED";


  output  [ 17: 0] q;
  input            clock;
  input   [ 17: 0] data;
  input   [  5: 0] rdaddress;
  input   [  5: 0] wraddress;
  input            wren;

  wire    [ 17: 0] q;
  wire    [ 17: 0] ram_q;
  assign q = ram_q;
  altsyncram the_altsyncram
    (
      .address_a (wraddress),
      .address_b (rdaddress),
      .clock0 (clock),
      .data_a (data),
      .q_b (ram_q),
      .wren_a (wren)
    );

  defparam the_altsyncram.address_reg_b = "CLOCK0",
           the_altsyncram.init_file = lpm_file,
           the_altsyncram.maximum_depth = 0,
           the_altsyncram.numwords_a = 64,
           the_altsyncram.numwords_b = 64,
           the_altsyncram.operation_mode = "DUAL_PORT",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.rdcontrol_reg_b = "CLOCK0",
           the_altsyncram.read_during_write_mode_mixed_ports = "OLD_DATA",
           the_altsyncram.width_a = 18,
           the_altsyncram.width_b = 18,
           the_altsyncram.widthad_a = 6,
           the_altsyncram.widthad_b = 6;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_dc_data_module (
                                     // inputs:
                                      byteenable,
                                      clock,
                                      data,
                                      rdaddress,
                                      wraddress,
                                      wren,

                                     // outputs:
                                      q
                                   )
;

  parameter lpm_file = "UNUSED";


  output  [ 31: 0] q;
  input   [  3: 0] byteenable;
  input            clock;
  input   [ 31: 0] data;
  input   [  8: 0] rdaddress;
  input   [  8: 0] wraddress;
  input            wren;

  wire    [ 31: 0] q;
  wire    [ 31: 0] ram_q;
  assign q = ram_q;
  altsyncram the_altsyncram
    (
      .address_a (wraddress),
      .address_b (rdaddress),
      .byteena_a (byteenable),
      .clock0 (clock),
      .data_a (data),
      .q_b (ram_q),
      .wren_a (wren)
    );

  defparam the_altsyncram.address_reg_b = "CLOCK0",
           the_altsyncram.maximum_depth = 0,
           the_altsyncram.numwords_a = 512,
           the_altsyncram.numwords_b = 512,
           the_altsyncram.operation_mode = "DUAL_PORT",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.rdcontrol_reg_b = "CLOCK0",
           the_altsyncram.read_during_write_mode_mixed_ports = "DONT_CARE",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_b = 32,
           the_altsyncram.width_byteena_a = 4,
           the_altsyncram.widthad_a = 9,
           the_altsyncram.widthad_b = 9;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_dc_victim_module (
                                       // inputs:
                                        clock,
                                        data,
                                        rdaddress,
                                        rden,
                                        wraddress,
                                        wren,

                                       // outputs:
                                        q
                                     )
;

  parameter lpm_file = "UNUSED";


  output  [ 31: 0] q;
  input            clock;
  input   [ 31: 0] data;
  input   [  2: 0] rdaddress;
  input            rden;
  input   [  2: 0] wraddress;
  input            wren;

  wire    [ 31: 0] q;
  wire    [ 31: 0] ram_q;
  assign q = ram_q;
  altsyncram the_altsyncram
    (
      .address_a (wraddress),
      .address_b (rdaddress),
      .clock0 (clock),
      .data_a (data),
      .q_b (ram_q),
      .rden_b (rden),
      .wren_a (wren)
    );

  defparam the_altsyncram.address_reg_b = "CLOCK0",
           the_altsyncram.maximum_depth = 0,
           the_altsyncram.numwords_a = 8,
           the_altsyncram.numwords_b = 8,
           the_altsyncram.operation_mode = "DUAL_PORT",
           the_altsyncram.outdata_reg_b = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.rdcontrol_reg_b = "CLOCK0",
           the_altsyncram.read_during_write_mode_mixed_ports = "OLD_DATA",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_b = 32,
           the_altsyncram.widthad_a = 3,
           the_altsyncram.widthad_b = 3;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_debug (
                                      // inputs:
                                       clk,
                                       dbrk_break,
                                       debugreq,
                                       hbreak_enabled,
                                       jdo,
                                       jrst_n,
                                       ocireg_ers,
                                       ocireg_mrs,
                                       reset,
                                       st_ready_test_idle,
                                       take_action_ocimem_a,
                                       take_action_ocireg,
                                       xbrk_break,

                                      // outputs:
                                       debugack,
                                       monitor_error,
                                       monitor_go,
                                       monitor_ready,
                                       oci_hbreak_req,
                                       resetlatch,
                                       resetrequest
                                    )
;

  output           debugack;
  output           monitor_error;
  output           monitor_go;
  output           monitor_ready;
  output           oci_hbreak_req;
  output           resetlatch;
  output           resetrequest;
  input            clk;
  input            dbrk_break;
  input            debugreq;
  input            hbreak_enabled;
  input   [ 37: 0] jdo;
  input            jrst_n;
  input            ocireg_ers;
  input            ocireg_mrs;
  input            reset;
  input            st_ready_test_idle;
  input            take_action_ocimem_a;
  input            take_action_ocireg;
  input            xbrk_break;

  reg              break_on_reset /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  wire             debugack;
  reg              jtag_break /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg              monitor_error /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  reg              monitor_go /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  reg              monitor_ready /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  wire             oci_hbreak_req;
  wire             reset_sync;
  reg              resetlatch /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg              resetrequest /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  wire             unxcomplemented_resetxx0;
  assign unxcomplemented_resetxx0 = jrst_n;
  altera_std_synchronizer the_altera_std_synchronizer
    (
      .clk (clk),
      .din (reset),
      .dout (reset_sync),
      .reset_n (unxcomplemented_resetxx0)
    );

  defparam the_altera_std_synchronizer.depth = 2;

  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          break_on_reset <= 1'b0;
          resetrequest <= 1'b0;
          jtag_break <= 1'b0;
        end
      else if (take_action_ocimem_a)
        begin
          resetrequest <= jdo[22];
          jtag_break <= jdo[21]     ? 1 
                    : jdo[20]  ? 0 
                    : jtag_break;

          break_on_reset <= jdo[19]     ? 1
                    : jdo[18]  ? 0
                    :  break_on_reset;

          resetlatch <= jdo[24] ? 0 : resetlatch;
        end
      else if (reset_sync)
        begin
          jtag_break <= break_on_reset;
          resetlatch <= 1;
        end
      else if (debugreq & ~debugack & break_on_reset)
          jtag_break <= 1'b1;
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          monitor_ready <= 1'b0;
          monitor_error <= 1'b0;
          monitor_go <= 1'b0;
        end
      else 
        begin
          if (take_action_ocimem_a && jdo[25])
              monitor_ready <= 1'b0;
          else if (take_action_ocireg && ocireg_mrs)
              monitor_ready <= 1'b1;
          if (take_action_ocimem_a && jdo[25])
              monitor_error <= 1'b0;
          else if (take_action_ocireg && ocireg_ers)
              monitor_error <= 1'b1;
          if (take_action_ocimem_a && jdo[23])
              monitor_go <= 1'b1;
          else if (st_ready_test_idle)
              monitor_go <= 1'b0;
        end
    end


  assign oci_hbreak_req = jtag_break | dbrk_break | xbrk_break | debugreq;
  assign debugack = ~hbreak_enabled;

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_ociram_sp_ram_module (
                                           // inputs:
                                            address,
                                            byteenable,
                                            clock,
                                            data,
                                            wren,

                                           // outputs:
                                            q
                                         )
;

  parameter lpm_file = "UNUSED";


  output  [ 31: 0] q;
  input   [  7: 0] address;
  input   [  3: 0] byteenable;
  input            clock;
  input   [ 31: 0] data;
  input            wren;

  wire    [ 31: 0] q;
  wire    [ 31: 0] ram_q;
  assign q = ram_q;
  altsyncram the_altsyncram
    (
      .address_a (address),
      .byteena_a (byteenable),
      .clock0 (clock),
      .data_a (data),
      .q_a (ram_q),
      .wren_a (wren)
    );

  defparam the_altsyncram.init_file = lpm_file,
           the_altsyncram.maximum_depth = 0,
           the_altsyncram.numwords_a = 256,
           the_altsyncram.operation_mode = "SINGLE_PORT",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_byteena_a = 4,
           the_altsyncram.widthad_a = 8;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_ocimem (
                                   // inputs:
                                    address,
                                    byteenable,
                                    clk,
                                    debugaccess,
                                    jdo,
                                    jrst_n,
                                    read,
                                    take_action_ocimem_a,
                                    take_action_ocimem_b,
                                    take_no_action_ocimem_a,
                                    write,
                                    writedata,

                                   // outputs:
                                    MonDReg,
                                    ociram_readdata,
                                    waitrequest
                                 )
;

  output  [ 31: 0] MonDReg;
  output  [ 31: 0] ociram_readdata;
  output           waitrequest;
  input   [  8: 0] address;
  input   [  3: 0] byteenable;
  input            clk;
  input            debugaccess;
  input   [ 37: 0] jdo;
  input            jrst_n;
  input            read;
  input            take_action_ocimem_a;
  input            take_action_ocimem_b;
  input            take_no_action_ocimem_a;
  input            write;
  input   [ 31: 0] writedata;

  reg     [ 10: 0] MonAReg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire    [  8: 0] MonARegAddrInc;
  wire             MonARegAddrIncAccessingRAM;
  reg     [ 31: 0] MonDReg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              avalon_ociram_readdata_ready /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire             avalon_ram_wr;
  wire    [ 31: 0] cfgrom_readdata;
  reg              jtag_ram_access /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              jtag_ram_rd /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              jtag_ram_rd_d1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              jtag_ram_wr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              jtag_rd /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  reg              jtag_rd_d1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire    [  7: 0] ociram_addr;
  wire    [  3: 0] ociram_byteenable;
  wire    [ 31: 0] ociram_readdata;
  wire    [ 31: 0] ociram_wr_data;
  wire             ociram_wr_en;
  reg              waitrequest /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          jtag_rd <= 1'b0;
          jtag_rd_d1 <= 1'b0;
          jtag_ram_wr <= 1'b0;
          jtag_ram_rd <= 1'b0;
          jtag_ram_rd_d1 <= 1'b0;
          jtag_ram_access <= 1'b0;
          MonAReg <= 0;
          MonDReg <= 0;
          waitrequest <= 1'b1;
          avalon_ociram_readdata_ready <= 1'b0;
        end
      else 
        begin
          if (take_no_action_ocimem_a)
            begin
              MonAReg[10 : 2] <= MonARegAddrInc;
              jtag_rd <= 1'b1;
              jtag_ram_rd <= MonARegAddrIncAccessingRAM;
              jtag_ram_access <= MonARegAddrIncAccessingRAM;
            end
          else if (take_action_ocimem_a)
            begin
              MonAReg[10 : 2] <= { jdo[17],
                            jdo[33 : 26] };

              jtag_rd <= 1'b1;
              jtag_ram_rd <= ~jdo[17];
              jtag_ram_access <= ~jdo[17];
            end
          else if (take_action_ocimem_b)
            begin
              MonAReg[10 : 2] <= MonARegAddrInc;
              MonDReg <= jdo[34 : 3];
              jtag_ram_wr <= MonARegAddrIncAccessingRAM;
              jtag_ram_access <= MonARegAddrIncAccessingRAM;
            end
          else 
            begin
              jtag_rd <= 0;
              jtag_ram_wr <= 0;
              jtag_ram_rd <= 0;
              jtag_ram_access <= 0;
              if (jtag_rd_d1)
                  MonDReg <= jtag_ram_rd_d1 ? ociram_readdata : cfgrom_readdata;
            end
          jtag_rd_d1 <= jtag_rd;
          jtag_ram_rd_d1 <= jtag_ram_rd;
          if (~waitrequest)
            begin
              waitrequest <= 1'b1;
              avalon_ociram_readdata_ready <= 1'b0;
            end
          else if (write)
              waitrequest <= ~address[8] & jtag_ram_access;
          else if (read)
            begin
              avalon_ociram_readdata_ready <= ~(~address[8] & jtag_ram_access);
              waitrequest <= ~avalon_ociram_readdata_ready;
            end
          else 
            begin
              waitrequest <= 1'b1;
              avalon_ociram_readdata_ready <= 1'b0;
            end
        end
    end


  assign MonARegAddrInc = MonAReg[10 : 2]+1;
  assign MonARegAddrIncAccessingRAM = ~MonARegAddrInc[8];
  assign avalon_ram_wr = write & ~address[8] & debugaccess;
  assign ociram_addr = jtag_ram_access ? MonAReg[9 : 2] : address[7 : 0];
  assign ociram_wr_data = jtag_ram_access ? MonDReg[31 : 0] : writedata;
  assign ociram_byteenable = jtag_ram_access ? 4'b1111 : byteenable;
  assign ociram_wr_en = jtag_ram_wr | avalon_ram_wr;
//sopc_nios2_0_ociram_sp_ram, which is an nios_sp_ram
sopc_nios2_0_ociram_sp_ram_module sopc_nios2_0_ociram_sp_ram
  (
    .address    (ociram_addr),
    .byteenable (ociram_byteenable),
    .clock      (clk),
    .data       (ociram_wr_data),
    .q          (ociram_readdata),
    .wren       (ociram_wr_en)
  );

//synthesis translate_off
`ifdef NO_PLI
defparam sopc_nios2_0_ociram_sp_ram.lpm_file = "sopc_nios2_0_ociram_default_contents.dat";
`else
defparam sopc_nios2_0_ociram_sp_ram.lpm_file = "sopc_nios2_0_ociram_default_contents.hex";
`endif
//synthesis translate_on
//synthesis read_comments_as_HDL on
//defparam sopc_nios2_0_ociram_sp_ram.lpm_file = "sopc_nios2_0_ociram_default_contents.mif";
//synthesis read_comments_as_HDL off
  assign cfgrom_readdata = (MonAReg[4 : 2] == 3'd0)? 32'h04000000 :
    (MonAReg[4 : 2] == 3'd1)? 32'h02021b1b :
    (MonAReg[4 : 2] == 3'd2)? 32'h00040100 :
    (MonAReg[4 : 2] == 3'd3)? 32'h00000000 :
    (MonAReg[4 : 2] == 3'd4)? 32'h20000b0c :
    (MonAReg[4 : 2] == 3'd5)? 32'h00000000 :
    (MonAReg[4 : 2] == 3'd6)? 32'h00000000 :
    32'h00000000;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_avalon_reg (
                                       // inputs:
                                        address,
                                        clk,
                                        debugaccess,
                                        monitor_error,
                                        monitor_go,
                                        monitor_ready,
                                        reset_n,
                                        write,
                                        writedata,

                                       // outputs:
                                        oci_ienable,
                                        oci_reg_readdata,
                                        oci_single_step_mode,
                                        ocireg_ers,
                                        ocireg_mrs,
                                        take_action_ocireg
                                     )
;

  output  [ 31: 0] oci_ienable;
  output  [ 31: 0] oci_reg_readdata;
  output           oci_single_step_mode;
  output           ocireg_ers;
  output           ocireg_mrs;
  output           take_action_ocireg;
  input   [  8: 0] address;
  input            clk;
  input            debugaccess;
  input            monitor_error;
  input            monitor_go;
  input            monitor_ready;
  input            reset_n;
  input            write;
  input   [ 31: 0] writedata;

  reg     [ 31: 0] oci_ienable;
  wire             oci_reg_00_addressed;
  wire             oci_reg_01_addressed;
  wire    [ 31: 0] oci_reg_readdata;
  reg              oci_single_step_mode;
  wire             ocireg_ers;
  wire             ocireg_mrs;
  wire             ocireg_sstep;
  wire             take_action_oci_intr_mask_reg;
  wire             take_action_ocireg;
  wire             write_strobe;
  assign oci_reg_00_addressed = address == 9'h100;
  assign oci_reg_01_addressed = address == 9'h101;
  assign write_strobe = write & debugaccess;
  assign take_action_ocireg = write_strobe & oci_reg_00_addressed;
  assign take_action_oci_intr_mask_reg = write_strobe & oci_reg_01_addressed;
  assign ocireg_ers = writedata[1];
  assign ocireg_mrs = writedata[0];
  assign ocireg_sstep = writedata[3];
  assign oci_reg_readdata = oci_reg_00_addressed ? {28'b0, oci_single_step_mode, monitor_go,
    monitor_ready, monitor_error} : 
    oci_reg_01_addressed ?  oci_ienable :   
    32'b0;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          oci_single_step_mode <= 1'b0;
      else if (take_action_ocireg)
          oci_single_step_mode <= ocireg_sstep;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          oci_ienable <= 32'b00000000000000000000000000011111;
      else if (take_action_oci_intr_mask_reg)
          oci_ienable <= writedata | ~(32'b00000000000000000000000000011111);
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_break (
                                      // inputs:
                                       clk,
                                       dbrk_break,
                                       dbrk_goto0,
                                       dbrk_goto1,
                                       dbrk_hit0,
                                       dbrk_hit1,
                                       jdo,
                                       jrst_n,
                                       reset_n,
                                       take_action_break_a,
                                       take_action_break_b,
                                       take_action_break_c,
                                       take_no_action_break_a,
                                       take_no_action_break_b,
                                       take_no_action_break_c,
                                       xbrk_goto0,
                                       xbrk_goto1,

                                      // outputs:
                                       break_readreg,
                                       dbrk0,
                                       dbrk1,
                                       dbrk_hit0_latch,
                                       dbrk_hit1_latch,
                                       dbrk_hit2_latch,
                                       dbrk_hit3_latch,
                                       trigbrktype,
                                       trigger_state_0,
                                       trigger_state_1,
                                       xbrk0,
                                       xbrk1,
                                       xbrk_ctrl0,
                                       xbrk_ctrl1,
                                       xbrk_ctrl2,
                                       xbrk_ctrl3
                                    )
;

  output  [ 31: 0] break_readreg;
  output  [ 77: 0] dbrk0;
  output  [ 77: 0] dbrk1;
  output           dbrk_hit0_latch;
  output           dbrk_hit1_latch;
  output           dbrk_hit2_latch;
  output           dbrk_hit3_latch;
  output           trigbrktype;
  output           trigger_state_0;
  output           trigger_state_1;
  output  [ 26: 0] xbrk0;
  output  [ 26: 0] xbrk1;
  output  [  7: 0] xbrk_ctrl0;
  output  [  7: 0] xbrk_ctrl1;
  output  [  7: 0] xbrk_ctrl2;
  output  [  7: 0] xbrk_ctrl3;
  input            clk;
  input            dbrk_break;
  input            dbrk_goto0;
  input            dbrk_goto1;
  input            dbrk_hit0;
  input            dbrk_hit1;
  input   [ 37: 0] jdo;
  input            jrst_n;
  input            reset_n;
  input            take_action_break_a;
  input            take_action_break_b;
  input            take_action_break_c;
  input            take_no_action_break_a;
  input            take_no_action_break_b;
  input            take_no_action_break_c;
  input            xbrk_goto0;
  input            xbrk_goto1;

  wire    [  3: 0] break_a_wpr;
  wire    [  1: 0] break_a_wpr_high_bits;
  wire    [  1: 0] break_a_wpr_low_bits;
  wire    [  1: 0] break_b_rr;
  wire    [  1: 0] break_c_rr;
  reg     [ 31: 0] break_readreg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg     [ 77: 0] dbrk0 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  wire             dbrk0_high_value;
  wire             dbrk0_low_value;
  reg     [ 77: 0] dbrk1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  wire             dbrk1_high_value;
  wire             dbrk1_low_value;
  wire             dbrk2_high_value;
  wire             dbrk2_low_value;
  wire             dbrk3_high_value;
  wire             dbrk3_low_value;
  reg              dbrk_hit0_latch /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  reg              dbrk_hit1_latch /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  wire             dbrk_hit2_latch;
  wire             dbrk_hit3_latch;
  wire             take_action_any_break;
  reg              trigbrktype /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg              trigger_state;
  wire             trigger_state_0;
  wire             trigger_state_1;
  reg     [ 26: 0] xbrk0 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  wire    [ 31: 0] xbrk0_value;
  reg     [ 26: 0] xbrk1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  wire    [ 31: 0] xbrk1_value;
  wire    [ 31: 0] xbrk2_value;
  wire    [ 31: 0] xbrk3_value;
  reg     [  7: 0] xbrk_ctrl0 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg     [  7: 0] xbrk_ctrl1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg     [  7: 0] xbrk_ctrl2 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  reg     [  7: 0] xbrk_ctrl3 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,R101\""  */;
  assign break_a_wpr = jdo[35 : 32];
  assign break_a_wpr_high_bits = break_a_wpr[3 : 2];
  assign break_a_wpr_low_bits = break_a_wpr[1 : 0];
  assign break_b_rr = jdo[33 : 32];
  assign break_c_rr = jdo[33 : 32];
  assign take_action_any_break = take_action_break_a | take_action_break_b | take_action_break_c;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          xbrk_ctrl0 <= 0;
          xbrk_ctrl1 <= 0;
          xbrk_ctrl2 <= 0;
          xbrk_ctrl3 <= 0;
          trigbrktype <= 0;
        end
      else 
        begin
          if (take_action_any_break)
              trigbrktype <= 0;
          else if (dbrk_break)
              trigbrktype <= 1;
          if (take_action_break_b)
            begin
              if ((break_b_rr == 2'b00) && (2 >= 1))
                begin
                  xbrk_ctrl0[0] <= jdo[27];
                  xbrk_ctrl0[1] <= jdo[28];
                  xbrk_ctrl0[2] <= jdo[29];
                  xbrk_ctrl0[3] <= jdo[30];
                  xbrk_ctrl0[4] <= jdo[21];
                  xbrk_ctrl0[5] <= jdo[20];
                  xbrk_ctrl0[6] <= jdo[19];
                  xbrk_ctrl0[7] <= jdo[18];
                end
              if ((break_b_rr == 2'b01) && (2 >= 2))
                begin
                  xbrk_ctrl1[0] <= jdo[27];
                  xbrk_ctrl1[1] <= jdo[28];
                  xbrk_ctrl1[2] <= jdo[29];
                  xbrk_ctrl1[3] <= jdo[30];
                  xbrk_ctrl1[4] <= jdo[21];
                  xbrk_ctrl1[5] <= jdo[20];
                  xbrk_ctrl1[6] <= jdo[19];
                  xbrk_ctrl1[7] <= jdo[18];
                end
              if ((break_b_rr == 2'b10) && (2 >= 3))
                begin
                  xbrk_ctrl2[0] <= jdo[27];
                  xbrk_ctrl2[1] <= jdo[28];
                  xbrk_ctrl2[2] <= jdo[29];
                  xbrk_ctrl2[3] <= jdo[30];
                  xbrk_ctrl2[4] <= jdo[21];
                  xbrk_ctrl2[5] <= jdo[20];
                  xbrk_ctrl2[6] <= jdo[19];
                  xbrk_ctrl2[7] <= jdo[18];
                end
              if ((break_b_rr == 2'b11) && (2 >= 4))
                begin
                  xbrk_ctrl3[0] <= jdo[27];
                  xbrk_ctrl3[1] <= jdo[28];
                  xbrk_ctrl3[2] <= jdo[29];
                  xbrk_ctrl3[3] <= jdo[30];
                  xbrk_ctrl3[4] <= jdo[21];
                  xbrk_ctrl3[5] <= jdo[20];
                  xbrk_ctrl3[6] <= jdo[19];
                  xbrk_ctrl3[7] <= jdo[18];
                end
            end
        end
    end


  always @(posedge clk)
    begin
      if (take_action_any_break)
          dbrk_hit0_latch <= 1'b0;
      else if (dbrk_hit0 & dbrk0[69])
          dbrk_hit0_latch <= 1'b1;
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          dbrk0 <= 0;
      else if (take_action_break_a && break_a_wpr_low_bits == 2'b00)
        begin
          if (break_a_wpr_high_bits == 2)
              dbrk0[26 : 0] <= jdo[31 : 0];
          if (break_a_wpr_high_bits == 3)
              dbrk0[63 : 32] <= jdo[31 : 0];
        end
      else if (take_action_break_c && break_c_rr == 2'b00)
        begin
          dbrk0[65] <= jdo[23];
          dbrk0[66] <= jdo[24];
          dbrk0[67] <= jdo[25];
          dbrk0[68] <= jdo[26];
          dbrk0[69] <= jdo[27];
          dbrk0[70] <= jdo[28];
          if (1)
              dbrk0[64] <= jdo[22];
          if (0)
            begin
              dbrk0[71] <= jdo[29];
              dbrk0[72] <= jdo[30];
              dbrk0[73] <= jdo[31];
            end
          dbrk0[74] <= jdo[21];
          dbrk0[75] <= jdo[20];
          dbrk0[76] <= jdo[19];
          dbrk0[77] <= jdo[18];
        end
    end


  assign dbrk0_low_value = dbrk0[26 : 0];
  assign dbrk0_high_value = dbrk0[63 : 32];
  always @(posedge clk)
    begin
      if (take_action_any_break)
          dbrk_hit1_latch <= 1'b0;
      else if (dbrk_hit1 & dbrk1[69])
          dbrk_hit1_latch <= 1'b1;
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          dbrk1 <= 0;
      else if (take_action_break_a && break_a_wpr_low_bits == 2'b01)
        begin
          if (break_a_wpr_high_bits == 2)
              dbrk1[26 : 0] <= jdo[31 : 0];
          if (break_a_wpr_high_bits == 3)
              dbrk1[63 : 32] <= jdo[31 : 0];
        end
      else if (take_action_break_c && break_c_rr == 2'b01)
        begin
          dbrk1[65] <= jdo[23];
          dbrk1[66] <= jdo[24];
          dbrk1[67] <= jdo[25];
          dbrk1[68] <= jdo[26];
          dbrk1[69] <= jdo[27];
          dbrk1[70] <= jdo[28];
          if (1)
              dbrk1[64] <= jdo[22];
          if (0)
            begin
              dbrk1[71] <= jdo[29];
              dbrk1[72] <= jdo[30];
              dbrk1[73] <= jdo[31];
            end
          dbrk1[74] <= jdo[21];
          dbrk1[75] <= jdo[20];
          dbrk1[76] <= jdo[19];
          dbrk1[77] <= jdo[18];
        end
    end


  assign dbrk1_low_value = dbrk1[26 : 0];
  assign dbrk1_high_value = dbrk1[63 : 32];
  assign dbrk_hit2_latch = 1'b0;
  assign dbrk2_low_value = 0;
  assign dbrk2_high_value = 0;
  assign dbrk_hit3_latch = 1'b0;
  assign dbrk3_low_value = 0;
  assign dbrk3_high_value = 0;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          xbrk0 <= 0;
      else if (take_action_break_a 
                 && (break_a_wpr_high_bits == 0) 
                 && (break_a_wpr_low_bits == 2'b00))
          xbrk0[26 : 0] <= jdo[31 : 0];
    end


  assign xbrk0_value = xbrk0;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          xbrk1 <= 0;
      else if (take_action_break_a 
                 && (break_a_wpr_high_bits == 0) 
                 && (break_a_wpr_low_bits == 2'b01))
          xbrk1[26 : 0] <= jdo[31 : 0];
    end


  assign xbrk1_value = xbrk1;
  assign xbrk2_value = 32'b0;
  assign xbrk3_value = 32'b0;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          break_readreg <= 32'b0;
      else if (take_action_any_break)
          break_readreg <= jdo[31 : 0];
      else if (take_no_action_break_a)
          case (break_a_wpr_high_bits)
          
              2'd0: begin
                  case (break_a_wpr_low_bits) // synthesis full_case
                  
                      2'd0: begin
                          break_readreg <= xbrk0_value;
                      end // 2'd0 
                  
                      2'd1: begin
                          break_readreg <= xbrk1_value;
                      end // 2'd1 
                  
                      2'd2: begin
                          break_readreg <= xbrk2_value;
                      end // 2'd2 
                  
                      2'd3: begin
                          break_readreg <= xbrk3_value;
                      end // 2'd3 
                  
                  endcase // break_a_wpr_low_bits
              end // 2'd0 
          
              2'd1: begin
                  break_readreg <= 32'b0;
              end // 2'd1 
          
              2'd2: begin
                  case (break_a_wpr_low_bits) // synthesis full_case
                  
                      2'd0: begin
                          break_readreg <= dbrk0_low_value;
                      end // 2'd0 
                  
                      2'd1: begin
                          break_readreg <= dbrk1_low_value;
                      end // 2'd1 
                  
                      2'd2: begin
                          break_readreg <= dbrk2_low_value;
                      end // 2'd2 
                  
                      2'd3: begin
                          break_readreg <= dbrk3_low_value;
                      end // 2'd3 
                  
                  endcase // break_a_wpr_low_bits
              end // 2'd2 
          
              2'd3: begin
                  case (break_a_wpr_low_bits) // synthesis full_case
                  
                      2'd0: begin
                          break_readreg <= dbrk0_high_value;
                      end // 2'd0 
                  
                      2'd1: begin
                          break_readreg <= dbrk1_high_value;
                      end // 2'd1 
                  
                      2'd2: begin
                          break_readreg <= dbrk2_high_value;
                      end // 2'd2 
                  
                      2'd3: begin
                          break_readreg <= dbrk3_high_value;
                      end // 2'd3 
                  
                  endcase // break_a_wpr_low_bits
              end // 2'd3 
          
          endcase // break_a_wpr_high_bits
      else if (take_no_action_break_b)
          break_readreg <= jdo[31 : 0];
      else if (take_no_action_break_c)
          break_readreg <= jdo[31 : 0];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          trigger_state <= 0;
      else if (trigger_state_1 & (xbrk_goto0 | dbrk_goto0))
          trigger_state <= 0;
      else if (trigger_state_0 & (xbrk_goto1 | dbrk_goto1))
          trigger_state <= -1;
    end


  assign trigger_state_0 = ~trigger_state;
  assign trigger_state_1 = trigger_state;

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_xbrk (
                                     // inputs:
                                      D_en,
                                      E_en,
                                      E_valid,
                                      F_pc,
                                      M_en,
                                      clk,
                                      reset_n,
                                      trigger_state_0,
                                      trigger_state_1,
                                      xbrk0,
                                      xbrk1,
                                      xbrk_ctrl0,
                                      xbrk_ctrl1,
                                      xbrk_ctrl2,
                                      xbrk_ctrl3,

                                     // outputs:
                                      xbrk_break,
                                      xbrk_goto0,
                                      xbrk_goto1,
                                      xbrk_traceoff,
                                      xbrk_traceon,
                                      xbrk_trigout
                                   )
;

  output           xbrk_break;
  output           xbrk_goto0;
  output           xbrk_goto1;
  output           xbrk_traceoff;
  output           xbrk_traceon;
  output           xbrk_trigout;
  input            D_en;
  input            E_en;
  input            E_valid;
  input   [ 24: 0] F_pc;
  input            M_en;
  input            clk;
  input            reset_n;
  input            trigger_state_0;
  input            trigger_state_1;
  input   [ 26: 0] xbrk0;
  input   [ 26: 0] xbrk1;
  input   [  7: 0] xbrk_ctrl0;
  input   [  7: 0] xbrk_ctrl1;
  input   [  7: 0] xbrk_ctrl2;
  input   [  7: 0] xbrk_ctrl3;

  wire             D_cpu_addr_en;
  wire             E_cpu_addr_en;
  reg              E_xbrk_goto0;
  reg              E_xbrk_goto1;
  reg              E_xbrk_traceoff;
  reg              E_xbrk_traceon;
  reg              E_xbrk_trigout;
  reg              M_xbrk_goto0;
  reg              M_xbrk_goto1;
  reg              M_xbrk_traceoff;
  reg              M_xbrk_traceon;
  reg              M_xbrk_trigout;
  wire    [ 26: 0] cpu_i_address;
  wire             xbrk0_armed;
  wire             xbrk0_break_hit;
  wire             xbrk0_goto0_hit;
  wire             xbrk0_goto1_hit;
  wire             xbrk0_toff_hit;
  wire             xbrk0_ton_hit;
  wire             xbrk0_tout_hit;
  wire             xbrk1_armed;
  wire             xbrk1_break_hit;
  wire             xbrk1_goto0_hit;
  wire             xbrk1_goto1_hit;
  wire             xbrk1_toff_hit;
  wire             xbrk1_ton_hit;
  wire             xbrk1_tout_hit;
  wire             xbrk2_armed;
  wire             xbrk2_break_hit;
  wire             xbrk2_goto0_hit;
  wire             xbrk2_goto1_hit;
  wire             xbrk2_toff_hit;
  wire             xbrk2_ton_hit;
  wire             xbrk2_tout_hit;
  wire             xbrk3_armed;
  wire             xbrk3_break_hit;
  wire             xbrk3_goto0_hit;
  wire             xbrk3_goto1_hit;
  wire             xbrk3_toff_hit;
  wire             xbrk3_ton_hit;
  wire             xbrk3_tout_hit;
  reg              xbrk_break;
  wire             xbrk_break_hit;
  wire             xbrk_goto0;
  wire             xbrk_goto0_hit;
  wire             xbrk_goto1;
  wire             xbrk_goto1_hit;
  reg              xbrk_hit0;
  reg              xbrk_hit1;
  wire             xbrk_toff_hit;
  wire             xbrk_ton_hit;
  wire             xbrk_tout_hit;
  wire             xbrk_traceoff;
  wire             xbrk_traceon;
  wire             xbrk_trigout;
  assign cpu_i_address = {F_pc, 2'b00};
  assign D_cpu_addr_en = D_en;
  assign E_cpu_addr_en = E_en;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          xbrk_hit0 <= 0;
      else if (D_cpu_addr_en)
          xbrk_hit0 <= cpu_i_address == xbrk0[26 : 0];
    end


  assign xbrk0_break_hit = xbrk_hit0 & xbrk0_armed & xbrk_ctrl0[0];
  assign xbrk0_ton_hit = xbrk_hit0 & xbrk0_armed & xbrk_ctrl0[3];
  assign xbrk0_toff_hit = xbrk_hit0 & xbrk0_armed & xbrk_ctrl0[2];
  assign xbrk0_tout_hit = xbrk_hit0 & xbrk0_armed & xbrk_ctrl0[1];
  assign xbrk0_goto0_hit = xbrk_hit0 & xbrk0_armed & xbrk_ctrl0[6];
  assign xbrk0_goto1_hit = xbrk_hit0 & xbrk0_armed & xbrk_ctrl0[7];
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          xbrk_hit1 <= 0;
      else if (D_cpu_addr_en)
          xbrk_hit1 <= cpu_i_address == xbrk1[26 : 0];
    end


  assign xbrk1_break_hit = xbrk_hit1 & xbrk1_armed & xbrk_ctrl1[0];
  assign xbrk1_ton_hit = xbrk_hit1 & xbrk1_armed & xbrk_ctrl1[3];
  assign xbrk1_toff_hit = xbrk_hit1 & xbrk1_armed & xbrk_ctrl1[2];
  assign xbrk1_tout_hit = xbrk_hit1 & xbrk1_armed & xbrk_ctrl1[1];
  assign xbrk1_goto0_hit = xbrk_hit1 & xbrk1_armed & xbrk_ctrl1[6];
  assign xbrk1_goto1_hit = xbrk_hit1 & xbrk1_armed & xbrk_ctrl1[7];
  assign xbrk2_break_hit = 0;
  assign xbrk2_ton_hit = 0;
  assign xbrk2_toff_hit = 0;
  assign xbrk2_tout_hit = 0;
  assign xbrk2_goto0_hit = 0;
  assign xbrk2_goto1_hit = 0;
  assign xbrk3_break_hit = 0;
  assign xbrk3_ton_hit = 0;
  assign xbrk3_toff_hit = 0;
  assign xbrk3_tout_hit = 0;
  assign xbrk3_goto0_hit = 0;
  assign xbrk3_goto1_hit = 0;
  assign xbrk_break_hit = (xbrk0_break_hit) | (xbrk1_break_hit) | (xbrk2_break_hit) | (xbrk3_break_hit);
  assign xbrk_ton_hit = (xbrk0_ton_hit) | (xbrk1_ton_hit) | (xbrk2_ton_hit) | (xbrk3_ton_hit);
  assign xbrk_toff_hit = (xbrk0_toff_hit) | (xbrk1_toff_hit) | (xbrk2_toff_hit) | (xbrk3_toff_hit);
  assign xbrk_tout_hit = (xbrk0_tout_hit) | (xbrk1_tout_hit) | (xbrk2_tout_hit) | (xbrk3_tout_hit);
  assign xbrk_goto0_hit = (xbrk0_goto0_hit) | (xbrk1_goto0_hit) | (xbrk2_goto0_hit) | (xbrk3_goto0_hit);
  assign xbrk_goto1_hit = (xbrk0_goto1_hit) | (xbrk1_goto1_hit) | (xbrk2_goto1_hit) | (xbrk3_goto1_hit);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          xbrk_break <= 0;
      else if (E_cpu_addr_en)
          xbrk_break <= xbrk_break_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_traceon <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_traceon <= xbrk_ton_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_traceoff <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_traceoff <= xbrk_toff_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_trigout <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_trigout <= xbrk_tout_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_goto0 <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_goto0 <= xbrk_goto0_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_xbrk_goto1 <= 0;
      else if (E_cpu_addr_en)
          E_xbrk_goto1 <= xbrk_goto1_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_xbrk_traceon <= 0;
      else if (M_en)
          M_xbrk_traceon <= E_xbrk_traceon & E_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_xbrk_traceoff <= 0;
      else if (M_en)
          M_xbrk_traceoff <= E_xbrk_traceoff & E_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_xbrk_trigout <= 0;
      else if (M_en)
          M_xbrk_trigout <= E_xbrk_trigout & E_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_xbrk_goto0 <= 0;
      else if (M_en)
          M_xbrk_goto0 <= E_xbrk_goto0 & E_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_xbrk_goto1 <= 0;
      else if (M_en)
          M_xbrk_goto1 <= E_xbrk_goto1 & E_valid;
    end


  assign xbrk_traceon = M_xbrk_traceon;
  assign xbrk_traceoff = M_xbrk_traceoff;
  assign xbrk_trigout = M_xbrk_trigout;
  assign xbrk_goto0 = M_xbrk_goto0;
  assign xbrk_goto1 = M_xbrk_goto1;
  assign xbrk0_armed = (xbrk_ctrl0[4] & trigger_state_0) ||
    (xbrk_ctrl0[5] & trigger_state_1);

  assign xbrk1_armed = (xbrk_ctrl1[4] & trigger_state_0) ||
    (xbrk_ctrl1[5] & trigger_state_1);

  assign xbrk2_armed = (xbrk_ctrl2[4] & trigger_state_0) ||
    (xbrk_ctrl2[5] & trigger_state_1);

  assign xbrk3_armed = (xbrk_ctrl3[4] & trigger_state_0) ||
    (xbrk_ctrl3[5] & trigger_state_1);


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_match_single (
                                             // inputs:
                                              addr,
                                              data,
                                              dbrk,
                                              read,
                                              write,

                                             // outputs:
                                              match_single
                                           )
;

  output           match_single;
  input   [ 26: 0] addr;
  input   [ 31: 0] data;
  input   [ 70: 0] dbrk;
  input            read;
  input            write;

  wire             match_single;
  wire             match_single_combinatorial;
  assign match_single_combinatorial = (~dbrk[67] || (addr == dbrk[26 : 0]))  && (~dbrk[68] || (data == dbrk[63 : 32]))  && (    (dbrk[66] & read)       || (dbrk[65] & write));
  assign match_single = match_single_combinatorial;

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_match_paired (
                                             // inputs:
                                              addr,
                                              data,
                                              dbrka,
                                              dbrkb,
                                              read,
                                              write,

                                             // outputs:
                                              match_paired
                                           )
;

  output           match_paired;
  input   [ 26: 0] addr;
  input   [ 31: 0] data;
  input   [ 70: 0] dbrka;
  input   [ 70: 0] dbrkb;
  input            read;
  input            write;

  wire             match_paired;
  wire             match_paired_combinatorial;
  assign match_paired_combinatorial = (~dbrka[67]       || ((addr >= dbrka[26 : 0])            && (addr <= dbrkb[26 : 0]))) && (~dbrka[68]       || (((data ^ dbrka[63 : 32])             & dbrkb[63 : 32]) == 0)) && ((dbrka[66] & read)       || (dbrka[65] & write));
  assign match_paired = match_paired_combinatorial;

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_dbrk (
                                     // inputs:
                                      A_ctrl_ld,
                                      A_ctrl_st,
                                      A_en,
                                      A_mem_baddr,
                                      A_st_data,
                                      A_valid,
                                      A_wr_data_filtered,
                                      clk,
                                      dbrk0,
                                      dbrk1,
                                      debugack,
                                      reset_n,
                                      trigger_state_0,
                                      trigger_state_1,

                                     // outputs:
                                      cpu_d_address,
                                      cpu_d_read,
                                      cpu_d_readdata,
                                      cpu_d_wait,
                                      cpu_d_write,
                                      cpu_d_writedata,
                                      dbrk_break,
                                      dbrk_goto0,
                                      dbrk_goto1,
                                      dbrk_hit0,
                                      dbrk_hit1,
                                      dbrk_traceme,
                                      dbrk_traceoff,
                                      dbrk_traceon,
                                      dbrk_trigout
                                   )
;

  output  [ 26: 0] cpu_d_address;
  output           cpu_d_read;
  output  [ 31: 0] cpu_d_readdata;
  output           cpu_d_wait;
  output           cpu_d_write;
  output  [ 31: 0] cpu_d_writedata;
  output           dbrk_break;
  output           dbrk_goto0;
  output           dbrk_goto1;
  output           dbrk_hit0;
  output           dbrk_hit1;
  output           dbrk_traceme;
  output           dbrk_traceoff;
  output           dbrk_traceon;
  output           dbrk_trigout;
  input            A_ctrl_ld;
  input            A_ctrl_st;
  input            A_en;
  input   [ 26: 0] A_mem_baddr;
  input   [ 31: 0] A_st_data;
  input            A_valid;
  input   [ 31: 0] A_wr_data_filtered;
  input            clk;
  input   [ 77: 0] dbrk0;
  input   [ 77: 0] dbrk1;
  input            debugack;
  input            reset_n;
  input            trigger_state_0;
  input            trigger_state_1;

  wire    [ 26: 0] cpu_d_address;
  wire             cpu_d_read;
  wire             cpu_d_read_valid;
  wire    [ 31: 0] cpu_d_readdata;
  wire             cpu_d_wait;
  wire             cpu_d_write;
  wire    [ 31: 0] cpu_d_writedata;
  wire             dbrk0_armed;
  wire             dbrk0_break_pulse;
  wire             dbrk0_goto0;
  wire             dbrk0_goto1;
  wire             dbrk0_traceme;
  wire             dbrk0_traceoff;
  wire             dbrk0_traceon;
  wire             dbrk0_trigout;
  wire             dbrk1_armed;
  wire             dbrk1_break_pulse;
  wire             dbrk1_goto0;
  wire             dbrk1_goto1;
  wire             dbrk1_traceme;
  wire             dbrk1_traceoff;
  wire             dbrk1_traceon;
  wire             dbrk1_trigout;
  wire             dbrk2_armed;
  wire             dbrk2_break_pulse;
  wire             dbrk2_goto0;
  wire             dbrk2_goto1;
  wire             dbrk2_traceme;
  wire             dbrk2_traceoff;
  wire             dbrk2_traceon;
  wire             dbrk2_trigout;
  wire             dbrk3_armed;
  wire             dbrk3_break_pulse;
  wire             dbrk3_goto0;
  wire             dbrk3_goto1;
  wire             dbrk3_traceme;
  wire             dbrk3_traceoff;
  wire             dbrk3_traceon;
  wire             dbrk3_trigout;
  reg              dbrk_break;
  reg              dbrk_break_pulse;
  wire    [ 31: 0] dbrk_data;
  reg              dbrk_goto0;
  reg              dbrk_goto1;
  wire             dbrk_hit0;
  wire             dbrk_hit0_match_paired;
  wire             dbrk_hit0_match_single;
  wire             dbrk_hit1;
  wire             dbrk_hit1_match_single;
  reg              dbrk_traceme;
  reg              dbrk_traceoff;
  reg              dbrk_traceon;
  reg              dbrk_trigout;
  assign cpu_d_address = A_mem_baddr;
  assign cpu_d_readdata = A_wr_data_filtered;
  assign cpu_d_read = A_ctrl_ld & A_valid;
  assign cpu_d_writedata = A_st_data;
  assign cpu_d_write = A_ctrl_st & A_valid;
  assign cpu_d_wait = ~A_en;
  assign dbrk_data = cpu_d_write ? cpu_d_writedata : cpu_d_readdata;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbrk_break <= 0;
      else 
        dbrk_break <= dbrk_break   ? ~debugack   
                : dbrk_break_pulse;

    end


  assign dbrk_hit0 = dbrk0[64] ?   dbrk_hit0_match_paired : dbrk_hit0_match_single;
  assign cpu_d_read_valid = cpu_d_read & ~cpu_d_wait;
  //sopc_nios2_0_nios2_oci_dbrk_hit0_match_single, which is an e_instance
  sopc_nios2_0_nios2_oci_match_single sopc_nios2_0_nios2_oci_dbrk_hit0_match_single
    (
      .addr         (cpu_d_address),
      .data         (dbrk_data),
      .dbrk         (dbrk0[70 : 0]),
      .match_single (dbrk_hit0_match_single),
      .read         (cpu_d_read_valid),
      .write        (cpu_d_write)
    );

  assign dbrk0_trigout = dbrk_hit0 & dbrk0_armed & dbrk0[70];
  assign dbrk0_break_pulse = dbrk_hit0 & dbrk0_armed & dbrk0[69];
  assign dbrk0_armed = (dbrk0[74] & trigger_state_0) ||
    (dbrk0[75] & trigger_state_1);

  assign dbrk0_traceoff = 1'b0;
  assign dbrk0_traceon = 1'b0;
  assign dbrk0_traceme = 1'b0;
  assign dbrk0_goto0 = 1'b0;
  assign dbrk0_goto1 = 1'b0;
  //sopc_nios2_0_nios2_oci_dbrk_hit1_match_single, which is an e_instance
  sopc_nios2_0_nios2_oci_match_single sopc_nios2_0_nios2_oci_dbrk_hit1_match_single
    (
      .addr         (cpu_d_address),
      .data         (dbrk_data),
      .dbrk         (dbrk1[70 : 0]),
      .match_single (dbrk_hit1_match_single),
      .read         (cpu_d_read_valid),
      .write        (cpu_d_write)
    );

  assign dbrk1_trigout = dbrk_hit1 & dbrk1_armed & dbrk1[70];
  assign dbrk1_break_pulse = dbrk_hit1 & dbrk1_armed & dbrk1[69];
  assign dbrk1_armed = (dbrk1[74] & trigger_state_0) ||
    (dbrk1[75] & trigger_state_1);

  assign dbrk1_traceoff = 1'b0;
  assign dbrk1_traceon = 1'b0;
  assign dbrk1_traceme = 1'b0;
  assign dbrk1_goto0 = 1'b0;
  assign dbrk1_goto1 = 1'b0;
  //sopc_nios2_0_nios2_oci_dbrk_hit0_match_paired, which is an e_instance
  sopc_nios2_0_nios2_oci_match_paired sopc_nios2_0_nios2_oci_dbrk_hit0_match_paired
    (
      .addr         (cpu_d_address),
      .data         (dbrk_data),
      .dbrka        (dbrk0[70 : 0]),
      .dbrkb        (dbrk1[70 : 0]),
      .match_paired (dbrk_hit0_match_paired),
      .read         (cpu_d_read_valid),
      .write        (cpu_d_write)
    );

  assign dbrk_hit1 = dbrk0[64] ? 0 : dbrk_hit1_match_single;
  assign dbrk2_armed = 1'b0;
  assign dbrk2_trigout = 1'b0;
  assign dbrk2_break_pulse = 1'b0;
  assign dbrk2_traceoff = 1'b0;
  assign dbrk2_traceon = 1'b0;
  assign dbrk2_traceme = 1'b0;
  assign dbrk2_goto0 = 1'b0;
  assign dbrk2_goto1 = 1'b0;
  assign dbrk3_armed = 1'b0;
  assign dbrk3_trigout = 1'b0;
  assign dbrk3_break_pulse = 1'b0;
  assign dbrk3_traceoff = 1'b0;
  assign dbrk3_traceon = 1'b0;
  assign dbrk3_traceme = 1'b0;
  assign dbrk3_goto0 = 1'b0;
  assign dbrk3_goto1 = 1'b0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          dbrk_trigout <= 0;
          dbrk_break_pulse <= 0;
          dbrk_traceoff <= 0;
          dbrk_traceon <= 0;
          dbrk_traceme <= 0;
          dbrk_goto0 <= 0;
          dbrk_goto1 <= 0;
        end
      else 
        begin
          dbrk_trigout <= dbrk0_trigout | dbrk1_trigout | dbrk2_trigout | dbrk3_trigout;
          dbrk_break_pulse <= dbrk0_break_pulse | dbrk1_break_pulse | dbrk2_break_pulse | dbrk3_break_pulse;
          dbrk_traceoff <= dbrk0_traceoff | dbrk1_traceoff | dbrk2_traceoff | dbrk3_traceoff;
          dbrk_traceon <= dbrk0_traceon | dbrk1_traceon | dbrk2_traceon | dbrk3_traceon;
          dbrk_traceme <= dbrk0_traceme | dbrk1_traceme | dbrk2_traceme | dbrk3_traceme;
          dbrk_goto0 <= dbrk0_goto0 | dbrk1_goto0 | dbrk2_goto0 | dbrk3_goto0;
          dbrk_goto1 <= dbrk0_goto1 | dbrk1_goto1 | dbrk2_goto1 | dbrk3_goto1;
        end
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_itrace (
                                       // inputs:
                                        A_cmp_result,
                                        A_ctrl_exception,
                                        A_en,
                                        A_op_beq,
                                        A_op_bge,
                                        A_op_bgeu,
                                        A_op_blt,
                                        A_op_bltu,
                                        A_op_bne,
                                        A_op_br,
                                        A_op_bret,
                                        A_op_call,
                                        A_op_callr,
                                        A_op_eret,
                                        A_op_jmp,
                                        A_op_jmpi,
                                        A_op_ret,
                                        A_pcb,
                                        A_valid,
                                        A_wr_data_filtered,
                                        clk,
                                        dbrk_traceoff,
                                        dbrk_traceon,
                                        debugack,
                                        jdo,
                                        jrst_n,
                                        reset_n,
                                        take_action_tracectrl,
                                        trc_enb,
                                        xbrk_traceoff,
                                        xbrk_traceon,
                                        xbrk_wrap_traceoff,

                                       // outputs:
                                        dct_buffer,
                                        dct_count,
                                        itm,
                                        trc_ctrl,
                                        trc_on
                                     )
;

  output  [ 29: 0] dct_buffer;
  output  [  3: 0] dct_count;
  output  [ 35: 0] itm;
  output  [ 15: 0] trc_ctrl;
  output           trc_on;
  input            A_cmp_result;
  input            A_ctrl_exception;
  input            A_en;
  input            A_op_beq;
  input            A_op_bge;
  input            A_op_bgeu;
  input            A_op_blt;
  input            A_op_bltu;
  input            A_op_bne;
  input            A_op_br;
  input            A_op_bret;
  input            A_op_call;
  input            A_op_callr;
  input            A_op_eret;
  input            A_op_jmp;
  input            A_op_jmpi;
  input            A_op_ret;
  input   [ 26: 0] A_pcb;
  input            A_valid;
  input   [ 31: 0] A_wr_data_filtered;
  input            clk;
  input            dbrk_traceoff;
  input            dbrk_traceon;
  input            debugack;
  input   [ 15: 0] jdo;
  input            jrst_n;
  input            reset_n;
  input            take_action_tracectrl;
  input            trc_enb;
  input            xbrk_traceoff;
  input            xbrk_traceon;
  input            xbrk_wrap_traceoff;

  wire             cond_dct_taken;
  wire             curr_pid;
  reg              d1_debugack /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D103"  */;
  reg     [ 29: 0] dct_buffer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [  1: 0] dct_code;
  reg     [  3: 0] dct_count /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire             dct_is_taken;
  wire    [ 31: 0] excaddr;
  wire             instr_retired;
  wire             is_advanced_exception;
  wire             is_cond_dct;
  wire             is_dct;
  wire             is_exception_no_break;
  wire             is_fast_tlb_miss_exception;
  wire             is_idct;
  wire             is_uncond_dct;
  reg     [ 35: 0] itm /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire             not_in_debug_mode;
  reg              pending_curr_pid /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg     [ 31: 0] pending_excaddr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              pending_exctype /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg     [  3: 0] pending_frametype /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              pending_prev_pid /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              prev_pid /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              prev_pid_valid /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire             record_dct_outcome_in_sync;
  wire             record_itrace;
  wire    [ 31: 0] retired_pcb;
  reg              snapped_curr_pid /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              snapped_pid /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              snapped_prev_pid /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [  1: 0] sync_code;
  wire    [  6: 0] sync_interval;
  wire             sync_pending;
  reg     [  6: 0] sync_timer /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [  6: 0] sync_timer_next;
  reg              trc_clear /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  wire    [ 15: 0] trc_ctrl;
  reg     [ 10: 0] trc_ctrl_reg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire             trc_on;
  assign is_cond_dct = A_op_bge  | A_op_blt | A_op_bne | A_op_bgeu | 
    A_op_bltu | A_op_beq;

  assign is_uncond_dct = A_op_br | A_op_call | A_op_jmpi;
  assign is_dct = is_cond_dct | is_uncond_dct;
  assign cond_dct_taken = A_cmp_result;
  assign dct_is_taken = is_uncond_dct | (is_cond_dct & cond_dct_taken);
  assign is_idct = A_op_jmp | A_op_callr | A_op_ret | A_op_eret | A_op_bret;
  assign retired_pcb = A_pcb;
  assign not_in_debug_mode = ~d1_debugack;
  assign instr_retired = A_valid & A_en;
  assign is_advanced_exception = 1'b0;
  assign is_exception_no_break = A_ctrl_exception;
  assign is_fast_tlb_miss_exception = 1'b0;
  assign curr_pid = 0;
  assign excaddr = A_wr_data_filtered;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_debugack <= 0;
      else if (instr_retired)
          d1_debugack <= debugack;
    end


  assign sync_code = trc_ctrl[3 : 2];
  assign sync_interval = { sync_code[1] & sync_code[0], 1'b0, sync_code[1] & ~sync_code[0], 1'b0, ~sync_code[1] & sync_code[0], 2'b00 };
  assign sync_pending = sync_timer == 0;
  assign record_dct_outcome_in_sync = dct_is_taken & sync_pending;
  assign sync_timer_next = sync_pending ? sync_timer : (sync_timer - 1);
  assign record_itrace = trc_on & trc_ctrl[4];
  assign dct_code = {is_cond_dct, dct_is_taken};
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          trc_clear <= 0;
      else 
        trc_clear <= ~trc_enb & 
                take_action_tracectrl & jdo[4];

    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          itm <= 0;
          dct_buffer <= 0;
          dct_count <= 0;
          sync_timer <= 0;
          pending_frametype <= 4'b0000;
          pending_exctype <= 1'b0;
          pending_excaddr <= 0;
          prev_pid <= 0;
          prev_pid_valid <= 0;
          snapped_pid <= 0;
          snapped_curr_pid <= 0;
          snapped_prev_pid <= 0;
          pending_curr_pid <= 0;
          pending_prev_pid <= 0;
        end
      else if (trc_clear || (!0 && !0))
        begin
          itm <= 0;
          dct_buffer <= 0;
          dct_count <= 0;
          sync_timer <= 0;
          pending_frametype <= 4'b0000;
          pending_exctype <= 1'b0;
          pending_excaddr <= 0;
          prev_pid <= 0;
          prev_pid_valid <= 0;
          snapped_pid <= 0;
          snapped_curr_pid <= 0;
          snapped_prev_pid <= 0;
          pending_curr_pid <= 0;
          pending_prev_pid <= 0;
        end
      else 
        begin
          if (!prev_pid_valid)
            begin
              prev_pid <= curr_pid;
              prev_pid_valid <= 1;
            end
          if ((curr_pid != prev_pid) & prev_pid_valid & !snapped_pid)
            begin
              snapped_pid <= 1;
              snapped_curr_pid <= curr_pid;
              snapped_prev_pid <= prev_pid;
              prev_pid <= curr_pid;
              prev_pid_valid <= 1;
            end
          if (instr_retired | is_advanced_exception)
            begin
              if (~record_itrace)
                  pending_frametype <= 4'b1010;
              else if (is_exception_no_break)
                begin
                  pending_frametype <= 4'b0010;
                  pending_excaddr <= excaddr;
                  if (is_fast_tlb_miss_exception)
                      pending_exctype <= 1'b1;
                  else 
                    pending_exctype <= 1'b0;
                end
              else if (is_idct)
                  pending_frametype <= 4'b1001;
              else if (record_dct_outcome_in_sync)
                  pending_frametype <= 4'b1000;
              else if (!is_dct & snapped_pid)
                begin
                  pending_frametype <= 4'b0011;
                  pending_curr_pid <= snapped_curr_pid;
                  pending_prev_pid <= snapped_prev_pid;
                  snapped_pid <= 0;
                end
              else 
                pending_frametype <= 4'b0000;
              if ((dct_count != 0) & 
           (~record_itrace | 
            is_exception_no_break |
            is_idct |
            record_dct_outcome_in_sync |
            (!is_dct & snapped_pid)))
                begin
                  itm <= {4'b0001, dct_buffer, 2'b00};
                  dct_buffer <= 0;
                  dct_count <= 0;
                  sync_timer <= sync_timer_next;
                end
              else 
                begin
                  if (record_itrace & (is_dct & (dct_count != 4'd15)) & ~record_dct_outcome_in_sync & ~is_advanced_exception)
                    begin
                      dct_buffer <= {dct_code, dct_buffer[29 : 2]};
                      dct_count <= dct_count + 1;
                    end
                  if (record_itrace & (pending_frametype == 4'b0010))
                      itm <= {4'b0010, pending_excaddr[31 : 1], pending_exctype};
                  else if (record_itrace & (
                (pending_frametype == 4'b1000) |
                (pending_frametype == 4'b1010) |
                (pending_frametype == 4'b1001)))
                    begin
                      itm <= {pending_frametype, retired_pcb};
                      sync_timer <= sync_interval;
                      if (0 &
                    ((pending_frametype == 4'b1000) | (pending_frametype == 4'b1010)) &
                    !snapped_pid & prev_pid_valid)
                        begin
                          snapped_pid <= 1;
                          snapped_curr_pid <= curr_pid;
                          snapped_prev_pid <= prev_pid;
                        end
                    end
                  else if (record_itrace & 
                0 & (pending_frametype == 4'b0011))
                      itm <= {4'b0011, 2'b00, pending_prev_pid, 2'b00, pending_curr_pid};
                  else if (record_itrace & is_dct)
                    begin
                      if (dct_count == 4'd15)
                        begin
                          itm <= {4'b0001, dct_code, dct_buffer};
                          dct_buffer <= 0;
                          dct_count <= 0;
                          sync_timer <= sync_timer_next;
                        end
                      else 
                        itm <= 4'b0000;
                    end
                  else 
                    itm <= {4'b0000, 32'b0};
                end
            end
          else 
            itm <= {4'b0000, 32'b0};
        end
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          trc_ctrl_reg[0] <= 1'b0;
          trc_ctrl_reg[1] <= 1'b0;
          trc_ctrl_reg[3 : 2] <= 2'b00;
          trc_ctrl_reg[4] <= 1'b0;
          trc_ctrl_reg[7 : 5] <= 3'b000;
          trc_ctrl_reg[8] <= 0;
          trc_ctrl_reg[9] <= 1'b0;
          trc_ctrl_reg[10] <= 1'b0;
        end
      else if (take_action_tracectrl)
        begin
          trc_ctrl_reg[0] <= jdo[5];
          trc_ctrl_reg[1] <= jdo[6];
          trc_ctrl_reg[3 : 2] <= jdo[8 : 7];
          trc_ctrl_reg[4] <= jdo[9];
          trc_ctrl_reg[9] <= jdo[14];
          trc_ctrl_reg[10] <= jdo[2];
          if (0)
              trc_ctrl_reg[7 : 5] <= jdo[12 : 10];
          if (0 & 0)
              trc_ctrl_reg[8] <= jdo[13];
        end
      else if (xbrk_wrap_traceoff)
        begin
          trc_ctrl_reg[1] <= 0;
          trc_ctrl_reg[0] <= 0;
        end
      else if (dbrk_traceoff | xbrk_traceoff)
          trc_ctrl_reg[1] <= 0;
      else if (trc_ctrl_reg[0] & 
                                  (dbrk_traceon | xbrk_traceon))
          trc_ctrl_reg[1] <= 1;
    end


  assign trc_ctrl = (0 || 0) ? {6'b000000, trc_ctrl_reg} : 0;
  assign trc_on = trc_ctrl[1] & (trc_ctrl[9] | not_in_debug_mode);

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_td_mode (
                                        // inputs:
                                         ctrl,

                                        // outputs:
                                         td_mode
                                      )
;

  output  [  3: 0] td_mode;
  input   [  8: 0] ctrl;

  wire    [  2: 0] ctrl_bits_for_mux;
  reg     [  3: 0] td_mode;
  assign ctrl_bits_for_mux = ctrl[7 : 5];
  always @(ctrl_bits_for_mux)
    begin
      case (ctrl_bits_for_mux)
      
          3'b000: begin
              td_mode = 4'b0000;
          end // 3'b000 
      
          3'b001: begin
              td_mode = 4'b1000;
          end // 3'b001 
      
          3'b010: begin
              td_mode = 4'b0100;
          end // 3'b010 
      
          3'b011: begin
              td_mode = 4'b1100;
          end // 3'b011 
      
          3'b100: begin
              td_mode = 4'b0010;
          end // 3'b100 
      
          3'b101: begin
              td_mode = 4'b1010;
          end // 3'b101 
      
          3'b110: begin
              td_mode = 4'b0101;
          end // 3'b110 
      
          3'b111: begin
              td_mode = 4'b1111;
          end // 3'b111 
      
      endcase // ctrl_bits_for_mux
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_dtrace (
                                       // inputs:
                                        clk,
                                        cpu_d_address,
                                        cpu_d_read,
                                        cpu_d_readdata,
                                        cpu_d_wait,
                                        cpu_d_write,
                                        cpu_d_writedata,
                                        jrst_n,
                                        trc_ctrl,

                                       // outputs:
                                        atm,
                                        dtm
                                     )
;

  output  [ 35: 0] atm;
  output  [ 35: 0] dtm;
  input            clk;
  input   [ 26: 0] cpu_d_address;
  input            cpu_d_read;
  input   [ 31: 0] cpu_d_readdata;
  input            cpu_d_wait;
  input            cpu_d_write;
  input   [ 31: 0] cpu_d_writedata;
  input            jrst_n;
  input   [ 15: 0] trc_ctrl;

  reg     [ 35: 0] atm /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [ 31: 0] cpu_d_address_0_padded;
  wire    [ 31: 0] cpu_d_readdata_0_padded;
  wire    [ 31: 0] cpu_d_writedata_0_padded;
  reg     [ 35: 0] dtm /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire             record_load_addr;
  wire             record_load_data;
  wire             record_store_addr;
  wire             record_store_data;
  wire    [  3: 0] td_mode_trc_ctrl;
  assign cpu_d_writedata_0_padded = cpu_d_writedata | 32'b0;
  assign cpu_d_readdata_0_padded = cpu_d_readdata | 32'b0;
  assign cpu_d_address_0_padded = cpu_d_address | 32'b0;
  //sopc_nios2_0_nios2_oci_trc_ctrl_td_mode, which is an e_instance
  sopc_nios2_0_nios2_oci_td_mode sopc_nios2_0_nios2_oci_trc_ctrl_td_mode
    (
      .ctrl    (trc_ctrl[8 : 0]),
      .td_mode (td_mode_trc_ctrl)
    );

  assign {record_load_addr, record_store_addr,
         record_load_data, record_store_data} = td_mode_trc_ctrl;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          atm <= 0;
          dtm <= 0;
        end
      else if (0)
        begin
          if (cpu_d_write & ~cpu_d_wait & record_store_addr)
              atm <= {4'b0101, cpu_d_address_0_padded};
          else if (cpu_d_read & ~cpu_d_wait & record_load_addr)
              atm <= {4'b0100, cpu_d_address_0_padded};
          else 
            atm <= {4'b0000, cpu_d_address_0_padded};
          if (cpu_d_write & ~cpu_d_wait & record_store_data)
              dtm <= {4'b0111, cpu_d_writedata_0_padded};
          else if (cpu_d_read & ~cpu_d_wait & record_load_data)
              dtm <= {4'b0110, cpu_d_readdata_0_padded};
          else 
            dtm <= {4'b0000, cpu_d_readdata_0_padded};
        end
      else 
        begin
          atm <= 0;
          dtm <= 0;
        end
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_compute_tm_count (
                                                 // inputs:
                                                  atm_valid,
                                                  dtm_valid,
                                                  itm_valid,

                                                 // outputs:
                                                  compute_tm_count
                                               )
;

  output  [  1: 0] compute_tm_count;
  input            atm_valid;
  input            dtm_valid;
  input            itm_valid;

  reg     [  1: 0] compute_tm_count;
  wire    [  2: 0] switch_for_mux;
  assign switch_for_mux = {itm_valid, atm_valid, dtm_valid};
  always @(switch_for_mux)
    begin
      case (switch_for_mux)
      
          3'b000: begin
              compute_tm_count = 0;
          end // 3'b000 
      
          3'b001: begin
              compute_tm_count = 1;
          end // 3'b001 
      
          3'b010: begin
              compute_tm_count = 1;
          end // 3'b010 
      
          3'b011: begin
              compute_tm_count = 2;
          end // 3'b011 
      
          3'b100: begin
              compute_tm_count = 1;
          end // 3'b100 
      
          3'b101: begin
              compute_tm_count = 2;
          end // 3'b101 
      
          3'b110: begin
              compute_tm_count = 2;
          end // 3'b110 
      
          3'b111: begin
              compute_tm_count = 3;
          end // 3'b111 
      
      endcase // switch_for_mux
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_fifowp_inc (
                                           // inputs:
                                            free2,
                                            free3,
                                            tm_count,

                                           // outputs:
                                            fifowp_inc
                                         )
;

  output  [  3: 0] fifowp_inc;
  input            free2;
  input            free3;
  input   [  1: 0] tm_count;

  reg     [  3: 0] fifowp_inc;
  always @(free2 or free3 or tm_count)
    begin
      if (free3 & (tm_count == 3))
          fifowp_inc = 3;
      else if (free2 & (tm_count >= 2))
          fifowp_inc = 2;
      else if (tm_count >= 1)
          fifowp_inc = 1;
      else 
        fifowp_inc = 0;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_fifocount_inc (
                                              // inputs:
                                               empty,
                                               free2,
                                               free3,
                                               tm_count,

                                              // outputs:
                                               fifocount_inc
                                            )
;

  output  [  4: 0] fifocount_inc;
  input            empty;
  input            free2;
  input            free3;
  input   [  1: 0] tm_count;

  reg     [  4: 0] fifocount_inc;
  always @(empty or free2 or free3 or tm_count)
    begin
      if (empty)
          fifocount_inc = tm_count[1 : 0];
      else if (free3 & (tm_count == 3))
          fifocount_inc = 2;
      else if (free2 & (tm_count >= 2))
          fifocount_inc = 1;
      else if (tm_count >= 1)
          fifocount_inc = 0;
      else 
        fifocount_inc = {5{1'b1}};
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_fifo (
                                     // inputs:
                                      atm,
                                      clk,
                                      dbrk_traceme,
                                      dbrk_traceoff,
                                      dbrk_traceon,
                                      dct_buffer,
                                      dct_count,
                                      dtm,
                                      itm,
                                      jrst_n,
                                      reset_n,
                                      test_ending,
                                      test_has_ended,
                                      trc_on,

                                     // outputs:
                                      tw
                                   )
;

  output  [ 35: 0] tw;
  input   [ 35: 0] atm;
  input            clk;
  input            dbrk_traceme;
  input            dbrk_traceoff;
  input            dbrk_traceon;
  input   [ 29: 0] dct_buffer;
  input   [  3: 0] dct_count;
  input   [ 35: 0] dtm;
  input   [ 35: 0] itm;
  input            jrst_n;
  input            reset_n;
  input            test_ending;
  input            test_has_ended;
  input            trc_on;

  wire             atm_valid;
  wire    [  1: 0] compute_tm_count_tm_count;
  wire             dtm_valid;
  wire             empty;
  reg     [ 35: 0] fifo_0;
  wire             fifo_0_enable;
  wire    [ 35: 0] fifo_0_mux;
  reg     [ 35: 0] fifo_1;
  reg     [ 35: 0] fifo_10;
  wire             fifo_10_enable;
  wire    [ 35: 0] fifo_10_mux;
  reg     [ 35: 0] fifo_11;
  wire             fifo_11_enable;
  wire    [ 35: 0] fifo_11_mux;
  reg     [ 35: 0] fifo_12;
  wire             fifo_12_enable;
  wire    [ 35: 0] fifo_12_mux;
  reg     [ 35: 0] fifo_13;
  wire             fifo_13_enable;
  wire    [ 35: 0] fifo_13_mux;
  reg     [ 35: 0] fifo_14;
  wire             fifo_14_enable;
  wire    [ 35: 0] fifo_14_mux;
  reg     [ 35: 0] fifo_15;
  wire             fifo_15_enable;
  wire    [ 35: 0] fifo_15_mux;
  wire             fifo_1_enable;
  wire    [ 35: 0] fifo_1_mux;
  reg     [ 35: 0] fifo_2;
  wire             fifo_2_enable;
  wire    [ 35: 0] fifo_2_mux;
  reg     [ 35: 0] fifo_3;
  wire             fifo_3_enable;
  wire    [ 35: 0] fifo_3_mux;
  reg     [ 35: 0] fifo_4;
  wire             fifo_4_enable;
  wire    [ 35: 0] fifo_4_mux;
  reg     [ 35: 0] fifo_5;
  wire             fifo_5_enable;
  wire    [ 35: 0] fifo_5_mux;
  reg     [ 35: 0] fifo_6;
  wire             fifo_6_enable;
  wire    [ 35: 0] fifo_6_mux;
  reg     [ 35: 0] fifo_7;
  wire             fifo_7_enable;
  wire    [ 35: 0] fifo_7_mux;
  reg     [ 35: 0] fifo_8;
  wire             fifo_8_enable;
  wire    [ 35: 0] fifo_8_mux;
  reg     [ 35: 0] fifo_9;
  wire             fifo_9_enable;
  wire    [ 35: 0] fifo_9_mux;
  wire    [ 35: 0] fifo_read_mux;
  reg     [  4: 0] fifocount /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [  4: 0] fifocount_inc_fifocount;
  wire    [ 35: 0] fifohead;
  reg     [  3: 0] fiforp /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg     [  3: 0] fifowp /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [  3: 0] fifowp1;
  wire    [  3: 0] fifowp2;
  wire    [  3: 0] fifowp_inc_fifowp;
  wire             free2;
  wire             free3;
  wire             itm_valid;
  reg              ovf_pending /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [ 35: 0] ovr_pending_atm;
  wire    [ 35: 0] ovr_pending_dtm;
  wire    [  1: 0] tm_count;
  wire             tm_count_ge1;
  wire             tm_count_ge2;
  wire             tm_count_ge3;
  wire             trc_this;
  wire    [ 35: 0] tw;
  assign trc_this = trc_on | (dbrk_traceon & ~dbrk_traceoff) | dbrk_traceme;
  assign itm_valid = |itm[35 : 32];
  assign atm_valid = |atm[35 : 32] & trc_this;
  assign dtm_valid = |dtm[35 : 32] & trc_this;
  assign free2 = ~fifocount[4];
  assign free3 = ~fifocount[4] & ~&fifocount[3 : 0];
  assign empty = ~|fifocount;
  assign fifowp1 = fifowp + 1;
  assign fifowp2 = fifowp + 2;
  //sopc_nios2_0_nios2_oci_compute_tm_count_tm_count, which is an e_instance
  sopc_nios2_0_nios2_oci_compute_tm_count sopc_nios2_0_nios2_oci_compute_tm_count_tm_count
    (
      .atm_valid        (atm_valid),
      .compute_tm_count (compute_tm_count_tm_count),
      .dtm_valid        (dtm_valid),
      .itm_valid        (itm_valid)
    );

  assign tm_count = compute_tm_count_tm_count;
  //sopc_nios2_0_nios2_oci_fifowp_inc_fifowp, which is an e_instance
  sopc_nios2_0_nios2_oci_fifowp_inc sopc_nios2_0_nios2_oci_fifowp_inc_fifowp
    (
      .fifowp_inc (fifowp_inc_fifowp),
      .free2      (free2),
      .free3      (free3),
      .tm_count   (tm_count)
    );

  //sopc_nios2_0_nios2_oci_fifocount_inc_fifocount, which is an e_instance
  sopc_nios2_0_nios2_oci_fifocount_inc sopc_nios2_0_nios2_oci_fifocount_inc_fifocount
    (
      .empty         (empty),
      .fifocount_inc (fifocount_inc_fifocount),
      .free2         (free2),
      .free3         (free3),
      .tm_count      (tm_count)
    );

  //the_sopc_nios2_0_oci_test_bench, which is an e_instance
  sopc_nios2_0_oci_test_bench the_sopc_nios2_0_oci_test_bench
    (
      .dct_buffer     (dct_buffer),
      .dct_count      (dct_count),
      .test_ending    (test_ending),
      .test_has_ended (test_has_ended)
    );

  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          fiforp <= 0;
          fifowp <= 0;
          fifocount <= 0;
          ovf_pending <= 1;
        end
      else 
        begin
          fifowp <= fifowp + fifowp_inc_fifowp;
          fifocount <= fifocount + fifocount_inc_fifocount;
          if (~empty)
              fiforp <= fiforp + 1;
          if (~trc_this || (~free2 & tm_count[1])   || (~free3 & (&tm_count)))
              ovf_pending <= 1;
          else if (atm_valid | dtm_valid)
              ovf_pending <= 0;
        end
    end


  assign fifohead = fifo_read_mux;
  assign tw = 0 ?  { (empty ?       4'h0       : fifohead[35 : 32]),   fifohead[31 : 0]}  : itm;
  assign fifo_0_enable = ((fifowp == 4'd0) && tm_count_ge1)  || (free2 && (fifowp1== 4'd0) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd0) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_0 <= 0;
      else if (fifo_0_enable)
          fifo_0 <= fifo_0_mux;
    end


  assign fifo_0_mux = (((fifowp == 4'd0) && itm_valid))? itm :
    (((fifowp == 4'd0) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd0) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd0) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd0) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd0) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_1_enable = ((fifowp == 4'd1) && tm_count_ge1)  || (free2 && (fifowp1== 4'd1) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd1) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_1 <= 0;
      else if (fifo_1_enable)
          fifo_1 <= fifo_1_mux;
    end


  assign fifo_1_mux = (((fifowp == 4'd1) && itm_valid))? itm :
    (((fifowp == 4'd1) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd1) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd1) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd1) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd1) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_2_enable = ((fifowp == 4'd2) && tm_count_ge1)  || (free2 && (fifowp1== 4'd2) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd2) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_2 <= 0;
      else if (fifo_2_enable)
          fifo_2 <= fifo_2_mux;
    end


  assign fifo_2_mux = (((fifowp == 4'd2) && itm_valid))? itm :
    (((fifowp == 4'd2) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd2) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd2) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd2) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd2) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_3_enable = ((fifowp == 4'd3) && tm_count_ge1)  || (free2 && (fifowp1== 4'd3) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd3) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_3 <= 0;
      else if (fifo_3_enable)
          fifo_3 <= fifo_3_mux;
    end


  assign fifo_3_mux = (((fifowp == 4'd3) && itm_valid))? itm :
    (((fifowp == 4'd3) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd3) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd3) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd3) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd3) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_4_enable = ((fifowp == 4'd4) && tm_count_ge1)  || (free2 && (fifowp1== 4'd4) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd4) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_4 <= 0;
      else if (fifo_4_enable)
          fifo_4 <= fifo_4_mux;
    end


  assign fifo_4_mux = (((fifowp == 4'd4) && itm_valid))? itm :
    (((fifowp == 4'd4) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd4) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd4) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd4) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd4) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_5_enable = ((fifowp == 4'd5) && tm_count_ge1)  || (free2 && (fifowp1== 4'd5) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd5) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_5 <= 0;
      else if (fifo_5_enable)
          fifo_5 <= fifo_5_mux;
    end


  assign fifo_5_mux = (((fifowp == 4'd5) && itm_valid))? itm :
    (((fifowp == 4'd5) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd5) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd5) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd5) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd5) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_6_enable = ((fifowp == 4'd6) && tm_count_ge1)  || (free2 && (fifowp1== 4'd6) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd6) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_6 <= 0;
      else if (fifo_6_enable)
          fifo_6 <= fifo_6_mux;
    end


  assign fifo_6_mux = (((fifowp == 4'd6) && itm_valid))? itm :
    (((fifowp == 4'd6) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd6) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd6) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd6) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd6) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_7_enable = ((fifowp == 4'd7) && tm_count_ge1)  || (free2 && (fifowp1== 4'd7) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd7) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_7 <= 0;
      else if (fifo_7_enable)
          fifo_7 <= fifo_7_mux;
    end


  assign fifo_7_mux = (((fifowp == 4'd7) && itm_valid))? itm :
    (((fifowp == 4'd7) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd7) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd7) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd7) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd7) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_8_enable = ((fifowp == 4'd8) && tm_count_ge1)  || (free2 && (fifowp1== 4'd8) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd8) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_8 <= 0;
      else if (fifo_8_enable)
          fifo_8 <= fifo_8_mux;
    end


  assign fifo_8_mux = (((fifowp == 4'd8) && itm_valid))? itm :
    (((fifowp == 4'd8) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd8) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd8) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd8) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd8) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_9_enable = ((fifowp == 4'd9) && tm_count_ge1)  || (free2 && (fifowp1== 4'd9) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd9) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_9 <= 0;
      else if (fifo_9_enable)
          fifo_9 <= fifo_9_mux;
    end


  assign fifo_9_mux = (((fifowp == 4'd9) && itm_valid))? itm :
    (((fifowp == 4'd9) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd9) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd9) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd9) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd9) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_10_enable = ((fifowp == 4'd10) && tm_count_ge1)  || (free2 && (fifowp1== 4'd10) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd10) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_10 <= 0;
      else if (fifo_10_enable)
          fifo_10 <= fifo_10_mux;
    end


  assign fifo_10_mux = (((fifowp == 4'd10) && itm_valid))? itm :
    (((fifowp == 4'd10) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd10) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd10) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd10) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd10) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_11_enable = ((fifowp == 4'd11) && tm_count_ge1)  || (free2 && (fifowp1== 4'd11) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd11) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_11 <= 0;
      else if (fifo_11_enable)
          fifo_11 <= fifo_11_mux;
    end


  assign fifo_11_mux = (((fifowp == 4'd11) && itm_valid))? itm :
    (((fifowp == 4'd11) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd11) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd11) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd11) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd11) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_12_enable = ((fifowp == 4'd12) && tm_count_ge1)  || (free2 && (fifowp1== 4'd12) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd12) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_12 <= 0;
      else if (fifo_12_enable)
          fifo_12 <= fifo_12_mux;
    end


  assign fifo_12_mux = (((fifowp == 4'd12) && itm_valid))? itm :
    (((fifowp == 4'd12) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd12) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd12) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd12) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd12) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_13_enable = ((fifowp == 4'd13) && tm_count_ge1)  || (free2 && (fifowp1== 4'd13) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd13) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_13 <= 0;
      else if (fifo_13_enable)
          fifo_13 <= fifo_13_mux;
    end


  assign fifo_13_mux = (((fifowp == 4'd13) && itm_valid))? itm :
    (((fifowp == 4'd13) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd13) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd13) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd13) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd13) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_14_enable = ((fifowp == 4'd14) && tm_count_ge1)  || (free2 && (fifowp1== 4'd14) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd14) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_14 <= 0;
      else if (fifo_14_enable)
          fifo_14 <= fifo_14_mux;
    end


  assign fifo_14_mux = (((fifowp == 4'd14) && itm_valid))? itm :
    (((fifowp == 4'd14) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd14) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd14) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd14) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd14) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign fifo_15_enable = ((fifowp == 4'd15) && tm_count_ge1)  || (free2 && (fifowp1== 4'd15) && tm_count_ge2)  ||(free3 && (fifowp2== 4'd15) && tm_count_ge3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_15 <= 0;
      else if (fifo_15_enable)
          fifo_15 <= fifo_15_mux;
    end


  assign fifo_15_mux = (((fifowp == 4'd15) && itm_valid))? itm :
    (((fifowp == 4'd15) && atm_valid))? ovr_pending_atm :
    (((fifowp == 4'd15) && dtm_valid))? ovr_pending_dtm :
    (((fifowp1 == 4'd15) && (free2 & itm_valid & atm_valid)))? ovr_pending_atm :
    (((fifowp1 == 4'd15) && (free2 & itm_valid & dtm_valid)))? ovr_pending_dtm :
    (((fifowp1 == 4'd15) && (free2 & atm_valid & dtm_valid)))? ovr_pending_dtm :
    ovr_pending_dtm;

  assign tm_count_ge1 = |tm_count;
  assign tm_count_ge2 = tm_count[1];
  assign tm_count_ge3 = &tm_count;
  assign ovr_pending_atm = {ovf_pending, atm[34 : 0]};
  assign ovr_pending_dtm = {ovf_pending, dtm[34 : 0]};
  assign fifo_read_mux = (fiforp == 4'd0)? fifo_0 :
    (fiforp == 4'd1)? fifo_1 :
    (fiforp == 4'd2)? fifo_2 :
    (fiforp == 4'd3)? fifo_3 :
    (fiforp == 4'd4)? fifo_4 :
    (fiforp == 4'd5)? fifo_5 :
    (fiforp == 4'd6)? fifo_6 :
    (fiforp == 4'd7)? fifo_7 :
    (fiforp == 4'd8)? fifo_8 :
    (fiforp == 4'd9)? fifo_9 :
    (fiforp == 4'd10)? fifo_10 :
    (fiforp == 4'd11)? fifo_11 :
    (fiforp == 4'd12)? fifo_12 :
    (fiforp == 4'd13)? fifo_13 :
    (fiforp == 4'd14)? fifo_14 :
    fifo_15;


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_pib (
                                    // inputs:
                                     clk,
                                     clkx2,
                                     jrst_n,
                                     tw,

                                    // outputs:
                                     tr_clk,
                                     tr_data
                                  )
;

  output           tr_clk;
  output  [ 17: 0] tr_data;
  input            clk;
  input            clkx2;
  input            jrst_n;
  input   [ 35: 0] tw;

  wire             phase;
  wire             tr_clk;
  reg              tr_clk_reg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  wire    [ 17: 0] tr_data;
  reg     [ 17: 0] tr_data_reg /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              x1 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              x2 /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  assign phase = x1^x2;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          x1 <= 0;
      else 
        x1 <= ~x1;
    end


  always @(posedge clkx2 or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          x2 <= 0;
          tr_clk_reg <= 0;
          tr_data_reg <= 0;
        end
      else 
        begin
          x2 <= x1;
          tr_clk_reg <= ~phase;
          tr_data_reg <= phase ?   tw[17 : 0] :   tw[35 : 18];
        end
    end


  assign tr_clk = 0 ? tr_clk_reg : 0;
  assign tr_data = 0 ? tr_data_reg : 0;

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci_im (
                                   // inputs:
                                    clk,
                                    jdo,
                                    jrst_n,
                                    reset_n,
                                    take_action_tracectrl,
                                    take_action_tracemem_a,
                                    take_action_tracemem_b,
                                    take_no_action_tracemem_a,
                                    trc_ctrl,
                                    tw,

                                   // outputs:
                                    tracemem_on,
                                    tracemem_trcdata,
                                    tracemem_tw,
                                    trc_enb,
                                    trc_im_addr,
                                    trc_wrap,
                                    xbrk_wrap_traceoff
                                 )
;

  output           tracemem_on;
  output  [ 35: 0] tracemem_trcdata;
  output           tracemem_tw;
  output           trc_enb;
  output  [  6: 0] trc_im_addr;
  output           trc_wrap;
  output           xbrk_wrap_traceoff;
  input            clk;
  input   [ 37: 0] jdo;
  input            jrst_n;
  input            reset_n;
  input            take_action_tracectrl;
  input            take_action_tracemem_a;
  input            take_action_tracemem_b;
  input            take_no_action_tracemem_a;
  input   [ 15: 0] trc_ctrl;
  input   [ 35: 0] tw;

  wire             tracemem_on;
  wire    [ 35: 0] tracemem_trcdata;
  wire             tracemem_tw;
  wire             trc_enb;
  reg     [  6: 0] trc_im_addr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire    [ 35: 0] trc_im_data;
  reg     [ 16: 0] trc_jtag_addr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101"  */;
  wire             trc_on_chip;
  reg              trc_wrap /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=\"D101,D103,R101\""  */;
  wire             tw_valid;
  wire             xbrk_wrap_traceoff;
  assign trc_im_data = tw;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          trc_im_addr <= 0;
          trc_wrap <= 0;
        end
      else if (!0)
        begin
          trc_im_addr <= 0;
          trc_wrap <= 0;
        end
      else if (take_action_tracectrl && 
                      (jdo[4] | jdo[3]))
        begin
          if (jdo[4])
              trc_im_addr <= 0;
          if (jdo[3])
              trc_wrap <= 0;
        end
      else if (trc_enb & trc_on_chip & tw_valid)
        begin
          trc_im_addr <= trc_im_addr+1;
          if (&trc_im_addr)
              trc_wrap <= 1;
        end
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          trc_jtag_addr <= 0;
      else if (take_action_tracemem_a ||
                take_no_action_tracemem_a || 
                take_action_tracemem_b)
          trc_jtag_addr <= take_action_tracemem_a ? 
                    jdo[35 : 19] : 
                    trc_jtag_addr + 1;

    end


  assign trc_enb = trc_ctrl[0];
  assign trc_on_chip = ~trc_ctrl[8];
  assign tw_valid = |trc_im_data[35 : 32];
  assign xbrk_wrap_traceoff = trc_ctrl[10] & trc_wrap;
  assign tracemem_tw = trc_wrap;
  assign tracemem_on = trc_enb;
  assign tracemem_trcdata = 0;

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_performance_monitors 
;



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0_nios2_oci (
                                // inputs:
                                 A_cmp_result,
                                 A_ctrl_exception,
                                 A_ctrl_ld,
                                 A_ctrl_st,
                                 A_en,
                                 A_mem_baddr,
                                 A_op_beq,
                                 A_op_bge,
                                 A_op_bgeu,
                                 A_op_blt,
                                 A_op_bltu,
                                 A_op_bne,
                                 A_op_br,
                                 A_op_bret,
                                 A_op_call,
                                 A_op_callr,
                                 A_op_eret,
                                 A_op_jmp,
                                 A_op_jmpi,
                                 A_op_ret,
                                 A_pcb,
                                 A_st_data,
                                 A_valid,
                                 A_wr_data_filtered,
                                 D_en,
                                 E_en,
                                 E_valid,
                                 F_pc,
                                 M_en,
                                 address_nxt,
                                 byteenable_nxt,
                                 clk,
                                 debugaccess_nxt,
                                 hbreak_enabled,
                                 read_nxt,
                                 reset,
                                 reset_n,
                                 test_ending,
                                 test_has_ended,
                                 write_nxt,
                                 writedata_nxt,

                                // outputs:
                                 jtag_debug_module_debugaccess_to_roms,
                                 oci_hbreak_req,
                                 oci_ienable,
                                 oci_single_step_mode,
                                 readdata,
                                 resetrequest,
                                 waitrequest
                              )
;

  output           jtag_debug_module_debugaccess_to_roms;
  output           oci_hbreak_req;
  output  [ 31: 0] oci_ienable;
  output           oci_single_step_mode;
  output  [ 31: 0] readdata;
  output           resetrequest;
  output           waitrequest;
  input            A_cmp_result;
  input            A_ctrl_exception;
  input            A_ctrl_ld;
  input            A_ctrl_st;
  input            A_en;
  input   [ 26: 0] A_mem_baddr;
  input            A_op_beq;
  input            A_op_bge;
  input            A_op_bgeu;
  input            A_op_blt;
  input            A_op_bltu;
  input            A_op_bne;
  input            A_op_br;
  input            A_op_bret;
  input            A_op_call;
  input            A_op_callr;
  input            A_op_eret;
  input            A_op_jmp;
  input            A_op_jmpi;
  input            A_op_ret;
  input   [ 26: 0] A_pcb;
  input   [ 31: 0] A_st_data;
  input            A_valid;
  input   [ 31: 0] A_wr_data_filtered;
  input            D_en;
  input            E_en;
  input            E_valid;
  input   [ 24: 0] F_pc;
  input            M_en;
  input   [  8: 0] address_nxt;
  input   [  3: 0] byteenable_nxt;
  input            clk;
  input            debugaccess_nxt;
  input            hbreak_enabled;
  input            read_nxt;
  input            reset;
  input            reset_n;
  input            test_ending;
  input            test_has_ended;
  input            write_nxt;
  input   [ 31: 0] writedata_nxt;

  wire    [ 31: 0] MonDReg;
  reg     [  8: 0] address;
  wire    [ 35: 0] atm;
  wire    [ 31: 0] break_readreg;
  reg     [  3: 0] byteenable;
  wire             clkx2;
  wire    [ 26: 0] cpu_d_address;
  wire             cpu_d_read;
  wire    [ 31: 0] cpu_d_readdata;
  wire             cpu_d_wait;
  wire             cpu_d_write;
  wire    [ 31: 0] cpu_d_writedata;
  wire    [ 77: 0] dbrk0;
  wire    [ 77: 0] dbrk1;
  wire             dbrk_break;
  wire             dbrk_goto0;
  wire             dbrk_goto1;
  wire             dbrk_hit0;
  wire             dbrk_hit0_latch;
  wire             dbrk_hit1;
  wire             dbrk_hit1_latch;
  wire             dbrk_hit2_latch;
  wire             dbrk_hit3_latch;
  wire             dbrk_traceme;
  wire             dbrk_traceoff;
  wire             dbrk_traceon;
  wire             dbrk_trigout;
  wire    [ 29: 0] dct_buffer;
  wire    [  3: 0] dct_count;
  reg              debugaccess;
  wire             debugack;
  wire             debugreq;
  wire    [ 35: 0] dtm;
  wire             dummy_sink;
  wire    [ 35: 0] itm;
  wire    [ 37: 0] jdo;
  wire             jrst_n;
  wire             jtag_debug_module_debugaccess_to_roms;
  wire             monitor_error;
  wire             monitor_go;
  wire             monitor_ready;
  wire             oci_hbreak_req;
  wire    [ 31: 0] oci_ienable;
  wire    [ 31: 0] oci_reg_readdata;
  wire             oci_single_step_mode;
  wire    [ 31: 0] ociram_readdata;
  wire             ocireg_ers;
  wire             ocireg_mrs;
  reg              read;
  reg     [ 31: 0] readdata;
  wire             resetlatch;
  wire             resetrequest;
  wire             st_ready_test_idle;
  wire             take_action_break_a;
  wire             take_action_break_b;
  wire             take_action_break_c;
  wire             take_action_ocimem_a;
  wire             take_action_ocimem_b;
  wire             take_action_ocireg;
  wire             take_action_tracectrl;
  wire             take_action_tracemem_a;
  wire             take_action_tracemem_b;
  wire             take_no_action_break_a;
  wire             take_no_action_break_b;
  wire             take_no_action_break_c;
  wire             take_no_action_ocimem_a;
  wire             take_no_action_tracemem_a;
  wire             tr_clk;
  wire    [ 17: 0] tr_data;
  wire             tracemem_on;
  wire    [ 35: 0] tracemem_trcdata;
  wire             tracemem_tw;
  wire    [ 15: 0] trc_ctrl;
  wire             trc_enb;
  wire    [  6: 0] trc_im_addr;
  wire             trc_on;
  wire             trc_wrap;
  wire             trigbrktype;
  wire             trigger_state_0;
  wire             trigger_state_1;
  wire             trigout;
  wire    [ 35: 0] tw;
  wire             waitrequest;
  reg              write;
  reg     [ 31: 0] writedata;
  wire    [ 26: 0] xbrk0;
  wire    [ 26: 0] xbrk1;
  wire             xbrk_break;
  wire    [  7: 0] xbrk_ctrl0;
  wire    [  7: 0] xbrk_ctrl1;
  wire    [  7: 0] xbrk_ctrl2;
  wire    [  7: 0] xbrk_ctrl3;
  wire             xbrk_goto0;
  wire             xbrk_goto1;
  wire             xbrk_traceoff;
  wire             xbrk_traceon;
  wire             xbrk_trigout;
  wire             xbrk_wrap_traceoff;
  sopc_nios2_0_nios2_oci_debug the_sopc_nios2_0_nios2_oci_debug
    (
      .clk                  (clk),
      .dbrk_break           (dbrk_break),
      .debugack             (debugack),
      .debugreq             (debugreq),
      .hbreak_enabled       (hbreak_enabled),
      .jdo                  (jdo),
      .jrst_n               (jrst_n),
      .monitor_error        (monitor_error),
      .monitor_go           (monitor_go),
      .monitor_ready        (monitor_ready),
      .oci_hbreak_req       (oci_hbreak_req),
      .ocireg_ers           (ocireg_ers),
      .ocireg_mrs           (ocireg_mrs),
      .reset                (reset),
      .resetlatch           (resetlatch),
      .resetrequest         (resetrequest),
      .st_ready_test_idle   (st_ready_test_idle),
      .take_action_ocimem_a (take_action_ocimem_a),
      .take_action_ocireg   (take_action_ocireg),
      .xbrk_break           (xbrk_break)
    );

  sopc_nios2_0_nios2_ocimem the_sopc_nios2_0_nios2_ocimem
    (
      .MonDReg                 (MonDReg),
      .address                 (address),
      .byteenable              (byteenable),
      .clk                     (clk),
      .debugaccess             (debugaccess),
      .jdo                     (jdo),
      .jrst_n                  (jrst_n),
      .ociram_readdata         (ociram_readdata),
      .read                    (read),
      .take_action_ocimem_a    (take_action_ocimem_a),
      .take_action_ocimem_b    (take_action_ocimem_b),
      .take_no_action_ocimem_a (take_no_action_ocimem_a),
      .waitrequest             (waitrequest),
      .write                   (write),
      .writedata               (writedata)
    );

  sopc_nios2_0_nios2_avalon_reg the_sopc_nios2_0_nios2_avalon_reg
    (
      .address              (address),
      .clk                  (clk),
      .debugaccess          (debugaccess),
      .monitor_error        (monitor_error),
      .monitor_go           (monitor_go),
      .monitor_ready        (monitor_ready),
      .oci_ienable          (oci_ienable),
      .oci_reg_readdata     (oci_reg_readdata),
      .oci_single_step_mode (oci_single_step_mode),
      .ocireg_ers           (ocireg_ers),
      .ocireg_mrs           (ocireg_mrs),
      .reset_n              (reset_n),
      .take_action_ocireg   (take_action_ocireg),
      .write                (write),
      .writedata            (writedata)
    );

  sopc_nios2_0_nios2_oci_break the_sopc_nios2_0_nios2_oci_break
    (
      .break_readreg          (break_readreg),
      .clk                    (clk),
      .dbrk0                  (dbrk0),
      .dbrk1                  (dbrk1),
      .dbrk_break             (dbrk_break),
      .dbrk_goto0             (dbrk_goto0),
      .dbrk_goto1             (dbrk_goto1),
      .dbrk_hit0              (dbrk_hit0),
      .dbrk_hit0_latch        (dbrk_hit0_latch),
      .dbrk_hit1              (dbrk_hit1),
      .dbrk_hit1_latch        (dbrk_hit1_latch),
      .dbrk_hit2_latch        (dbrk_hit2_latch),
      .dbrk_hit3_latch        (dbrk_hit3_latch),
      .jdo                    (jdo),
      .jrst_n                 (jrst_n),
      .reset_n                (reset_n),
      .take_action_break_a    (take_action_break_a),
      .take_action_break_b    (take_action_break_b),
      .take_action_break_c    (take_action_break_c),
      .take_no_action_break_a (take_no_action_break_a),
      .take_no_action_break_b (take_no_action_break_b),
      .take_no_action_break_c (take_no_action_break_c),
      .trigbrktype            (trigbrktype),
      .trigger_state_0        (trigger_state_0),
      .trigger_state_1        (trigger_state_1),
      .xbrk0                  (xbrk0),
      .xbrk1                  (xbrk1),
      .xbrk_ctrl0             (xbrk_ctrl0),
      .xbrk_ctrl1             (xbrk_ctrl1),
      .xbrk_ctrl2             (xbrk_ctrl2),
      .xbrk_ctrl3             (xbrk_ctrl3),
      .xbrk_goto0             (xbrk_goto0),
      .xbrk_goto1             (xbrk_goto1)
    );

  sopc_nios2_0_nios2_oci_xbrk the_sopc_nios2_0_nios2_oci_xbrk
    (
      .D_en            (D_en),
      .E_en            (E_en),
      .E_valid         (E_valid),
      .F_pc            (F_pc),
      .M_en            (M_en),
      .clk             (clk),
      .reset_n         (reset_n),
      .trigger_state_0 (trigger_state_0),
      .trigger_state_1 (trigger_state_1),
      .xbrk0           (xbrk0),
      .xbrk1           (xbrk1),
      .xbrk_break      (xbrk_break),
      .xbrk_ctrl0      (xbrk_ctrl0),
      .xbrk_ctrl1      (xbrk_ctrl1),
      .xbrk_ctrl2      (xbrk_ctrl2),
      .xbrk_ctrl3      (xbrk_ctrl3),
      .xbrk_goto0      (xbrk_goto0),
      .xbrk_goto1      (xbrk_goto1),
      .xbrk_traceoff   (xbrk_traceoff),
      .xbrk_traceon    (xbrk_traceon),
      .xbrk_trigout    (xbrk_trigout)
    );

  sopc_nios2_0_nios2_oci_dbrk the_sopc_nios2_0_nios2_oci_dbrk
    (
      .A_ctrl_ld          (A_ctrl_ld),
      .A_ctrl_st          (A_ctrl_st),
      .A_en               (A_en),
      .A_mem_baddr        (A_mem_baddr),
      .A_st_data          (A_st_data),
      .A_valid            (A_valid),
      .A_wr_data_filtered (A_wr_data_filtered),
      .clk                (clk),
      .cpu_d_address      (cpu_d_address),
      .cpu_d_read         (cpu_d_read),
      .cpu_d_readdata     (cpu_d_readdata),
      .cpu_d_wait         (cpu_d_wait),
      .cpu_d_write        (cpu_d_write),
      .cpu_d_writedata    (cpu_d_writedata),
      .dbrk0              (dbrk0),
      .dbrk1              (dbrk1),
      .dbrk_break         (dbrk_break),
      .dbrk_goto0         (dbrk_goto0),
      .dbrk_goto1         (dbrk_goto1),
      .dbrk_hit0          (dbrk_hit0),
      .dbrk_hit1          (dbrk_hit1),
      .dbrk_traceme       (dbrk_traceme),
      .dbrk_traceoff      (dbrk_traceoff),
      .dbrk_traceon       (dbrk_traceon),
      .dbrk_trigout       (dbrk_trigout),
      .debugack           (debugack),
      .reset_n            (reset_n),
      .trigger_state_0    (trigger_state_0),
      .trigger_state_1    (trigger_state_1)
    );

  sopc_nios2_0_nios2_oci_itrace the_sopc_nios2_0_nios2_oci_itrace
    (
      .A_cmp_result          (A_cmp_result),
      .A_ctrl_exception      (A_ctrl_exception),
      .A_en                  (A_en),
      .A_op_beq              (A_op_beq),
      .A_op_bge              (A_op_bge),
      .A_op_bgeu             (A_op_bgeu),
      .A_op_blt              (A_op_blt),
      .A_op_bltu             (A_op_bltu),
      .A_op_bne              (A_op_bne),
      .A_op_br               (A_op_br),
      .A_op_bret             (A_op_bret),
      .A_op_call             (A_op_call),
      .A_op_callr            (A_op_callr),
      .A_op_eret             (A_op_eret),
      .A_op_jmp              (A_op_jmp),
      .A_op_jmpi             (A_op_jmpi),
      .A_op_ret              (A_op_ret),
      .A_pcb                 (A_pcb),
      .A_valid               (A_valid),
      .A_wr_data_filtered    (A_wr_data_filtered),
      .clk                   (clk),
      .dbrk_traceoff         (dbrk_traceoff),
      .dbrk_traceon          (dbrk_traceon),
      .dct_buffer            (dct_buffer),
      .dct_count             (dct_count),
      .debugack              (debugack),
      .itm                   (itm),
      .jdo                   (jdo),
      .jrst_n                (jrst_n),
      .reset_n               (reset_n),
      .take_action_tracectrl (take_action_tracectrl),
      .trc_ctrl              (trc_ctrl),
      .trc_enb               (trc_enb),
      .trc_on                (trc_on),
      .xbrk_traceoff         (xbrk_traceoff),
      .xbrk_traceon          (xbrk_traceon),
      .xbrk_wrap_traceoff    (xbrk_wrap_traceoff)
    );

  sopc_nios2_0_nios2_oci_dtrace the_sopc_nios2_0_nios2_oci_dtrace
    (
      .atm             (atm),
      .clk             (clk),
      .cpu_d_address   (cpu_d_address),
      .cpu_d_read      (cpu_d_read),
      .cpu_d_readdata  (cpu_d_readdata),
      .cpu_d_wait      (cpu_d_wait),
      .cpu_d_write     (cpu_d_write),
      .cpu_d_writedata (cpu_d_writedata),
      .dtm             (dtm),
      .jrst_n          (jrst_n),
      .trc_ctrl        (trc_ctrl)
    );

  sopc_nios2_0_nios2_oci_fifo the_sopc_nios2_0_nios2_oci_fifo
    (
      .atm            (atm),
      .clk            (clk),
      .dbrk_traceme   (dbrk_traceme),
      .dbrk_traceoff  (dbrk_traceoff),
      .dbrk_traceon   (dbrk_traceon),
      .dct_buffer     (dct_buffer),
      .dct_count      (dct_count),
      .dtm            (dtm),
      .itm            (itm),
      .jrst_n         (jrst_n),
      .reset_n        (reset_n),
      .test_ending    (test_ending),
      .test_has_ended (test_has_ended),
      .trc_on         (trc_on),
      .tw             (tw)
    );

  sopc_nios2_0_nios2_oci_pib the_sopc_nios2_0_nios2_oci_pib
    (
      .clk     (clk),
      .clkx2   (clkx2),
      .jrst_n  (jrst_n),
      .tr_clk  (tr_clk),
      .tr_data (tr_data),
      .tw      (tw)
    );

  sopc_nios2_0_nios2_oci_im the_sopc_nios2_0_nios2_oci_im
    (
      .clk                       (clk),
      .jdo                       (jdo),
      .jrst_n                    (jrst_n),
      .reset_n                   (reset_n),
      .take_action_tracectrl     (take_action_tracectrl),
      .take_action_tracemem_a    (take_action_tracemem_a),
      .take_action_tracemem_b    (take_action_tracemem_b),
      .take_no_action_tracemem_a (take_no_action_tracemem_a),
      .tracemem_on               (tracemem_on),
      .tracemem_trcdata          (tracemem_trcdata),
      .tracemem_tw               (tracemem_tw),
      .trc_ctrl                  (trc_ctrl),
      .trc_enb                   (trc_enb),
      .trc_im_addr               (trc_im_addr),
      .trc_wrap                  (trc_wrap),
      .tw                        (tw),
      .xbrk_wrap_traceoff        (xbrk_wrap_traceoff)
    );

  assign trigout = dbrk_trigout | xbrk_trigout;
  assign jtag_debug_module_debugaccess_to_roms = debugack;
  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          address <= 0;
      else 
        address <= address_nxt;
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          byteenable <= 0;
      else 
        byteenable <= byteenable_nxt;
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          writedata <= 0;
      else 
        writedata <= writedata_nxt;
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          debugaccess <= 0;
      else 
        debugaccess <= debugaccess_nxt;
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          read <= 0;
      else 
        read <= read ? waitrequest : read_nxt;
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          write <= 0;
      else 
        write <= write ? waitrequest : write_nxt;
    end


  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          readdata <= 0;
      else 
        readdata <= address[8] ? oci_reg_readdata : ociram_readdata;
    end


  sopc_nios2_0_jtag_debug_module_wrapper the_sopc_nios2_0_jtag_debug_module_wrapper
    (
      .MonDReg                   (MonDReg),
      .break_readreg             (break_readreg),
      .clk                       (clk),
      .dbrk_hit0_latch           (dbrk_hit0_latch),
      .dbrk_hit1_latch           (dbrk_hit1_latch),
      .dbrk_hit2_latch           (dbrk_hit2_latch),
      .dbrk_hit3_latch           (dbrk_hit3_latch),
      .debugack                  (debugack),
      .jdo                       (jdo),
      .jrst_n                    (jrst_n),
      .monitor_error             (monitor_error),
      .monitor_ready             (monitor_ready),
      .reset_n                   (reset_n),
      .resetlatch                (resetlatch),
      .st_ready_test_idle        (st_ready_test_idle),
      .take_action_break_a       (take_action_break_a),
      .take_action_break_b       (take_action_break_b),
      .take_action_break_c       (take_action_break_c),
      .take_action_ocimem_a      (take_action_ocimem_a),
      .take_action_ocimem_b      (take_action_ocimem_b),
      .take_action_tracectrl     (take_action_tracectrl),
      .take_action_tracemem_a    (take_action_tracemem_a),
      .take_action_tracemem_b    (take_action_tracemem_b),
      .take_no_action_break_a    (take_no_action_break_a),
      .take_no_action_break_b    (take_no_action_break_b),
      .take_no_action_break_c    (take_no_action_break_c),
      .take_no_action_ocimem_a   (take_no_action_ocimem_a),
      .take_no_action_tracemem_a (take_no_action_tracemem_a),
      .tracemem_on               (tracemem_on),
      .tracemem_trcdata          (tracemem_trcdata),
      .tracemem_tw               (tracemem_tw),
      .trc_im_addr               (trc_im_addr),
      .trc_on                    (trc_on),
      .trc_wrap                  (trc_wrap),
      .trigbrktype               (trigbrktype),
      .trigger_state_1           (trigger_state_1)
    );

  //dummy sink, which is an e_mux
  assign dummy_sink = tr_clk |
    tr_data |
    trigout |
    debugack;

  assign debugreq = 0;
  assign clkx2 = 0;

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sopc_nios2_0 (
                      // inputs:
                       A_ci_multi_done,
                       A_ci_multi_result,
                       clk,
                       d_irq,
                       d_readdata,
                       d_readdatavalid,
                       d_waitrequest,
                       i_readdata,
                       i_readdatavalid,
                       i_waitrequest,
                       jtag_debug_module_address,
                       jtag_debug_module_byteenable,
                       jtag_debug_module_debugaccess,
                       jtag_debug_module_read,
                       jtag_debug_module_write,
                       jtag_debug_module_writedata,
                       reset_n,

                      // outputs:
                       A_ci_multi_a,
                       A_ci_multi_b,
                       A_ci_multi_c,
                       A_ci_multi_clk_en,
                       A_ci_multi_clock,
                       A_ci_multi_dataa,
                       A_ci_multi_datab,
                       A_ci_multi_estatus,
                       A_ci_multi_ipending,
                       A_ci_multi_n,
                       A_ci_multi_readra,
                       A_ci_multi_readrb,
                       A_ci_multi_reset,
                       A_ci_multi_start,
                       A_ci_multi_status,
                       A_ci_multi_writerc,
                       d_address,
                       d_byteenable,
                       d_read,
                       d_write,
                       d_writedata,
                       i_address,
                       i_read,
                       jtag_debug_module_debugaccess_to_roms,
                       jtag_debug_module_readdata,
                       jtag_debug_module_resetrequest,
                       jtag_debug_module_waitrequest
                    )
;

  output  [  4: 0] A_ci_multi_a;
  output  [  4: 0] A_ci_multi_b;
  output  [  4: 0] A_ci_multi_c;
  output           A_ci_multi_clk_en;
  output           A_ci_multi_clock;
  output  [ 31: 0] A_ci_multi_dataa;
  output  [ 31: 0] A_ci_multi_datab;
  output           A_ci_multi_estatus;
  output  [ 31: 0] A_ci_multi_ipending;
  output  [  7: 0] A_ci_multi_n;
  output           A_ci_multi_readra;
  output           A_ci_multi_readrb;
  output           A_ci_multi_reset;
  output           A_ci_multi_start;
  output           A_ci_multi_status;
  output           A_ci_multi_writerc;
  output  [ 26: 0] d_address;
  output  [  3: 0] d_byteenable;
  output           d_read;
  output           d_write;
  output  [ 31: 0] d_writedata;
  output  [ 26: 0] i_address;
  output           i_read;
  output           jtag_debug_module_debugaccess_to_roms;
  output  [ 31: 0] jtag_debug_module_readdata;
  output           jtag_debug_module_resetrequest;
  output           jtag_debug_module_waitrequest;
  input            A_ci_multi_done;
  input   [ 31: 0] A_ci_multi_result;
  input            clk;
  input   [ 31: 0] d_irq;
  input   [ 31: 0] d_readdata;
  input            d_readdatavalid;
  input            d_waitrequest;
  input   [ 31: 0] i_readdata;
  input            i_readdatavalid;
  input            i_waitrequest;
  input   [  8: 0] jtag_debug_module_address;
  input   [  3: 0] jtag_debug_module_byteenable;
  input            jtag_debug_module_debugaccess;
  input            jtag_debug_module_read;
  input            jtag_debug_module_write;
  input   [ 31: 0] jtag_debug_module_writedata;
  input            reset_n;

  reg     [ 26: 0] A_br_taken_baddr;
  wire    [ 31: 0] A_bstatus_reg;
  reg              A_bstatus_reg_pie;
  wire             A_bstatus_reg_pie_inst_nxt;
  wire             A_bstatus_reg_pie_nxt;
  wire             A_bstatus_reg_pie_wr_en;
  wire    [  4: 0] A_ci_multi_a;
  wire    [  4: 0] A_ci_multi_b;
  wire    [  4: 0] A_ci_multi_c;
  wire             A_ci_multi_clk_en;
  wire             A_ci_multi_clock;
  wire    [ 31: 0] A_ci_multi_dataa;
  wire    [ 31: 0] A_ci_multi_datab;
  wire             A_ci_multi_estatus;
  wire    [ 31: 0] A_ci_multi_ipending;
  wire    [  7: 0] A_ci_multi_n;
  wire             A_ci_multi_readra;
  wire             A_ci_multi_readrb;
  wire             A_ci_multi_reset;
  reg     [ 31: 0] A_ci_multi_src1;
  reg     [ 31: 0] A_ci_multi_src2;
  reg              A_ci_multi_stall;
  reg              A_ci_multi_start;
  wire             A_ci_multi_status;
  wire             A_ci_multi_writerc;
  reg              A_cmp_result;
  wire    [ 31: 0] A_cpuid_reg;
  reg              A_ctrl_a_not_src;
  wire             A_ctrl_a_not_src_nxt;
  reg              A_ctrl_alu_force_xor;
  wire             A_ctrl_alu_force_xor_nxt;
  reg              A_ctrl_alu_signed_comparison;
  wire             A_ctrl_alu_signed_comparison_nxt;
  reg              A_ctrl_alu_subtract;
  wire             A_ctrl_alu_subtract_nxt;
  reg              A_ctrl_b_is_dst;
  wire             A_ctrl_b_is_dst_nxt;
  reg              A_ctrl_b_not_src;
  wire             A_ctrl_b_not_src_nxt;
  reg              A_ctrl_br;
  reg              A_ctrl_br_always_pred_taken;
  wire             A_ctrl_br_always_pred_taken_nxt;
  reg              A_ctrl_br_cond;
  wire             A_ctrl_br_cond_nxt;
  wire             A_ctrl_br_nxt;
  reg              A_ctrl_br_uncond;
  wire             A_ctrl_br_uncond_nxt;
  reg              A_ctrl_break;
  wire             A_ctrl_break_nxt;
  reg              A_ctrl_cmp;
  wire             A_ctrl_cmp_nxt;
  reg              A_ctrl_crst;
  wire             A_ctrl_crst_nxt;
  reg              A_ctrl_custom_combo;
  wire             A_ctrl_custom_combo_nxt;
  reg              A_ctrl_custom_multi;
  wire             A_ctrl_custom_multi_nxt;
  reg              A_ctrl_dc_addr_inv;
  wire             A_ctrl_dc_addr_inv_nxt;
  reg              A_ctrl_dc_addr_nowb_inv;
  wire             A_ctrl_dc_addr_nowb_inv_nxt;
  reg              A_ctrl_dc_addr_wb_inv;
  wire             A_ctrl_dc_addr_wb_inv_nxt;
  reg              A_ctrl_dc_index_inv;
  wire             A_ctrl_dc_index_inv_nxt;
  reg              A_ctrl_dc_index_nowb_inv;
  wire             A_ctrl_dc_index_nowb_inv_nxt;
  reg              A_ctrl_dc_index_wb_inv;
  wire             A_ctrl_dc_index_wb_inv_nxt;
  reg              A_ctrl_dc_nowb_inv;
  wire             A_ctrl_dc_nowb_inv_nxt;
  reg              A_ctrl_dcache_management;
  wire             A_ctrl_dcache_management_nxt;
  reg              A_ctrl_exception;
  wire             A_ctrl_exception_nxt;
  reg              A_ctrl_flush_pipe_always;
  wire             A_ctrl_flush_pipe_always_nxt;
  reg              A_ctrl_hi_imm16;
  wire             A_ctrl_hi_imm16_nxt;
  reg              A_ctrl_ignore_dst;
  wire             A_ctrl_ignore_dst_nxt;
  reg              A_ctrl_illegal;
  wire             A_ctrl_illegal_nxt;
  reg              A_ctrl_implicit_dst_eretaddr;
  wire             A_ctrl_implicit_dst_eretaddr_nxt;
  reg              A_ctrl_implicit_dst_retaddr;
  wire             A_ctrl_implicit_dst_retaddr_nxt;
  reg              A_ctrl_invalidate_i;
  wire             A_ctrl_invalidate_i_nxt;
  reg              A_ctrl_jmp_direct;
  wire             A_ctrl_jmp_direct_nxt;
  reg              A_ctrl_jmp_indirect;
  wire             A_ctrl_jmp_indirect_nxt;
  reg              A_ctrl_late_result;
  wire             A_ctrl_late_result_nxt;
  reg              A_ctrl_ld;
  reg              A_ctrl_ld16;
  wire             A_ctrl_ld16_nxt;
  reg              A_ctrl_ld32;
  wire             A_ctrl_ld32_nxt;
  reg              A_ctrl_ld8;
  reg              A_ctrl_ld8_ld16;
  wire             A_ctrl_ld8_ld16_nxt;
  wire             A_ctrl_ld8_nxt;
  reg              A_ctrl_ld_bypass;
  wire             A_ctrl_ld_bypass_nxt;
  reg              A_ctrl_ld_dcache_management;
  wire             A_ctrl_ld_dcache_management_nxt;
  reg              A_ctrl_ld_io;
  wire             A_ctrl_ld_io_nxt;
  reg              A_ctrl_ld_non_bypass;
  wire             A_ctrl_ld_non_bypass_nxt;
  reg              A_ctrl_ld_non_io;
  wire             A_ctrl_ld_non_io_nxt;
  wire             A_ctrl_ld_nxt;
  reg              A_ctrl_ld_signed;
  wire             A_ctrl_ld_signed_nxt;
  reg              A_ctrl_ld_st;
  reg              A_ctrl_ld_st_bypass;
  wire             A_ctrl_ld_st_bypass_nxt;
  reg              A_ctrl_ld_st_bypass_or_dcache_management;
  wire             A_ctrl_ld_st_bypass_or_dcache_management_nxt;
  reg              A_ctrl_ld_st_io;
  wire             A_ctrl_ld_st_io_nxt;
  reg              A_ctrl_ld_st_non_bypass;
  reg              A_ctrl_ld_st_non_bypass_non_st32;
  wire             A_ctrl_ld_st_non_bypass_non_st32_nxt;
  wire             A_ctrl_ld_st_non_bypass_nxt;
  reg              A_ctrl_ld_st_non_io;
  reg              A_ctrl_ld_st_non_io_non_st32;
  wire             A_ctrl_ld_st_non_io_non_st32_nxt;
  wire             A_ctrl_ld_st_non_io_nxt;
  reg              A_ctrl_ld_st_non_st32;
  wire             A_ctrl_ld_st_non_st32_nxt;
  wire             A_ctrl_ld_st_nxt;
  reg              A_ctrl_logic;
  wire             A_ctrl_logic_nxt;
  reg              A_ctrl_mem;
  reg              A_ctrl_mem16;
  wire             A_ctrl_mem16_nxt;
  reg              A_ctrl_mem32;
  wire             A_ctrl_mem32_nxt;
  reg              A_ctrl_mem8;
  wire             A_ctrl_mem8_nxt;
  reg              A_ctrl_mem_data_access;
  wire             A_ctrl_mem_data_access_nxt;
  wire             A_ctrl_mem_nxt;
  reg              A_ctrl_mul_lsw;
  wire             A_ctrl_mul_lsw_nxt;
  reg              A_ctrl_rdctl_inst;
  wire             A_ctrl_rdctl_inst_nxt;
  reg              A_ctrl_retaddr;
  wire             A_ctrl_retaddr_nxt;
  reg              A_ctrl_rot;
  wire             A_ctrl_rot_nxt;
  reg              A_ctrl_shift_right_arith;
  wire             A_ctrl_shift_right_arith_nxt;
  reg              A_ctrl_shift_rot;
  reg              A_ctrl_shift_rot_left;
  wire             A_ctrl_shift_rot_left_nxt;
  wire             A_ctrl_shift_rot_nxt;
  reg              A_ctrl_shift_rot_right;
  wire             A_ctrl_shift_rot_right_nxt;
  reg              A_ctrl_src2_choose_imm;
  wire             A_ctrl_src2_choose_imm_nxt;
  reg              A_ctrl_st;
  reg              A_ctrl_st16;
  wire             A_ctrl_st16_nxt;
  reg              A_ctrl_st8;
  wire             A_ctrl_st8_nxt;
  reg              A_ctrl_st_bypass;
  wire             A_ctrl_st_bypass_nxt;
  reg              A_ctrl_st_io;
  wire             A_ctrl_st_io_nxt;
  reg              A_ctrl_st_non_bypass;
  wire             A_ctrl_st_non_bypass_nxt;
  reg              A_ctrl_st_non_io;
  wire             A_ctrl_st_non_io_nxt;
  wire             A_ctrl_st_nxt;
  reg              A_ctrl_supervisor_only;
  wire             A_ctrl_supervisor_only_nxt;
  reg              A_ctrl_uncond_cti_non_br;
  wire             A_ctrl_uncond_cti_non_br_nxt;
  reg              A_ctrl_unimp_nop;
  wire             A_ctrl_unimp_nop_nxt;
  reg              A_ctrl_unimp_trap;
  wire             A_ctrl_unimp_trap_nxt;
  reg              A_ctrl_unsigned_lo_imm16;
  wire             A_ctrl_unsigned_lo_imm16_nxt;
  reg              A_ctrl_wrctl_inst;
  wire             A_ctrl_wrctl_inst_nxt;
  wire    [ 15: 0] A_data_ram_ld16_data;
  wire             A_data_ram_ld_align_fill_bit;
  reg              A_data_ram_ld_align_sign_bit;
  wire    [  7: 0] A_data_ram_ld_byte0_data;
  wire    [  7: 0] A_data_ram_ld_byte1_data;
  wire    [  7: 0] A_data_ram_ld_byte2_data;
  wire    [  7: 0] A_data_ram_ld_byte3_data;
  reg     [ 15: 0] A_dc_actual_tag;
  wire             A_dc_dc_addr_wb_inv_done_nxt;
  wire             A_dc_dc_addr_wb_inv_want_xfer;
  reg              A_dc_dcache_management_done;
  wire             A_dc_dcache_management_done_nxt;
  wire             A_dc_dcache_management_wr_en;
  wire    [ 15: 0] A_dc_desired_tag;
  reg              A_dc_dirty;
  reg              A_dc_fill_active;
  wire             A_dc_fill_active_nxt;
  wire    [  3: 0] A_dc_fill_byte_en;
  wire             A_dc_fill_done;
  reg     [  2: 0] A_dc_fill_dp_offset;
  wire             A_dc_fill_dp_offset_en;
  wire    [  2: 0] A_dc_fill_dp_offset_nxt;
  reg              A_dc_fill_has_started;
  wire             A_dc_fill_has_started_nxt;
  wire             A_dc_fill_miss_offset_is_next;
  reg              A_dc_fill_need_extra_stall;
  wire             A_dc_fill_need_extra_stall_nxt;
  wire             A_dc_fill_starting;
  reg              A_dc_fill_starting_d1;
  wire             A_dc_fill_want_dmaster;
  wire             A_dc_fill_want_xfer;
  wire    [ 31: 0] A_dc_fill_wr_data;
  reg              A_dc_hit;
  wire             A_dc_index_wb_inv_done_nxt;
  wire             A_dc_index_wb_inv_want_xfer;
  reg              A_dc_potential_hazard_after_st;
  reg     [  3: 0] A_dc_rd_addr_cnt;
  wire    [  3: 0] A_dc_rd_addr_cnt_nxt;
  reg     [ 31: 0] A_dc_rd_data;
  reg     [  3: 0] A_dc_rd_data_cnt;
  wire    [  3: 0] A_dc_rd_data_cnt_nxt;
  wire             A_dc_rd_last_driven;
  wire             A_dc_rd_last_transfer;
  reg              A_dc_rd_last_transfer_d1;
  reg              A_dc_valid_st_bypass_hit;
  wire             A_dc_valid_st_bypass_hit_wr_en;
  reg              A_dc_valid_st_cache_hit;
  reg              A_dc_want_fill;
  wire             A_dc_want_xfer;
  reg              A_dc_wb_active;
  wire             A_dc_wb_active_nxt;
  reg     [  5: 0] A_dc_wb_line;
  reg     [  2: 0] A_dc_wb_rd_addr_offset;
  wire    [  2: 0] A_dc_wb_rd_addr_offset_nxt;
  reg              A_dc_wb_rd_addr_starting;
  wire    [ 31: 0] A_dc_wb_rd_data;
  reg              A_dc_wb_rd_data_first;
  wire             A_dc_wb_rd_data_first_nxt;
  reg              A_dc_wb_rd_data_starting;
  wire             A_dc_wb_rd_en;
  reg     [ 15: 0] A_dc_wb_tag;
  wire             A_dc_wb_update_av_writedata;
  reg              A_dc_wb_wr_active;
  wire             A_dc_wb_wr_active_nxt;
  wire             A_dc_wb_wr_starting;
  wire             A_dc_wb_wr_want_dmaster;
  reg     [  3: 0] A_dc_wr_data_cnt;
  wire    [  3: 0] A_dc_wr_data_cnt_nxt;
  wire             A_dc_wr_last_driven;
  wire             A_dc_wr_last_transfer;
  reg              A_dc_xfer_rd_addr_active;
  wire             A_dc_xfer_rd_addr_active_nxt;
  reg              A_dc_xfer_rd_addr_done;
  wire             A_dc_xfer_rd_addr_done_nxt;
  reg              A_dc_xfer_rd_addr_has_started;
  wire             A_dc_xfer_rd_addr_has_started_nxt;
  reg     [  2: 0] A_dc_xfer_rd_addr_offset;
  wire             A_dc_xfer_rd_addr_offset_match;
  wire    [  2: 0] A_dc_xfer_rd_addr_offset_nxt;
  wire             A_dc_xfer_rd_addr_starting;
  reg              A_dc_xfer_rd_data_active;
  reg              A_dc_xfer_rd_data_offset_match;
  reg              A_dc_xfer_rd_data_starting;
  reg              A_dc_xfer_wr_active;
  reg     [ 31: 0] A_dc_xfer_wr_data;
  wire    [ 31: 0] A_dc_xfer_wr_data_nxt;
  reg     [  2: 0] A_dc_xfer_wr_offset;
  wire    [  2: 0] A_dc_xfer_wr_offset_nxt;
  wire             A_dc_xfer_wr_offset_starting;
  reg              A_dc_xfer_wr_starting;
  wire    [  4: 0] A_dst_regnum;
  reg     [  4: 0] A_dst_regnum_from_M;
  wire             A_en;
  reg              A_en_d1;
  wire    [ 31: 0] A_estatus_reg;
  reg              A_estatus_reg_pie;
  wire             A_estatus_reg_pie_inst_nxt;
  wire             A_estatus_reg_pie_nxt;
  wire             A_estatus_reg_pie_wr_en;
  wire    [ 31: 0] A_fwd_reg_data;
  wire    [ 31: 0] A_ienable_reg;
  reg              A_ienable_reg_irq0;
  wire             A_ienable_reg_irq0_nxt;
  wire             A_ienable_reg_irq0_wr_en;
  reg              A_ienable_reg_irq1;
  wire             A_ienable_reg_irq1_nxt;
  wire             A_ienable_reg_irq1_wr_en;
  reg              A_ienable_reg_irq2;
  wire             A_ienable_reg_irq2_nxt;
  wire             A_ienable_reg_irq2_wr_en;
  reg              A_ienable_reg_irq3;
  wire             A_ienable_reg_irq3_nxt;
  wire             A_ienable_reg_irq3_wr_en;
  reg              A_ienable_reg_irq4;
  wire             A_ienable_reg_irq4_nxt;
  wire             A_ienable_reg_irq4_wr_en;
  wire    [ 55: 0] A_inst;
  reg     [ 31: 0] A_inst_result;
  wire    [ 31: 0] A_inst_result_aligned;
  wire    [ 31: 0] A_ipending_reg;
  reg              A_ipending_reg_irq0;
  wire             A_ipending_reg_irq0_nxt;
  wire             A_ipending_reg_irq0_wr_en;
  reg              A_ipending_reg_irq1;
  wire             A_ipending_reg_irq1_nxt;
  wire             A_ipending_reg_irq1_wr_en;
  reg              A_ipending_reg_irq2;
  wire             A_ipending_reg_irq2_nxt;
  wire             A_ipending_reg_irq2_wr_en;
  reg              A_ipending_reg_irq3;
  wire             A_ipending_reg_irq3_nxt;
  wire             A_ipending_reg_irq3_wr_en;
  reg              A_ipending_reg_irq4;
  wire             A_ipending_reg_irq4_nxt;
  wire             A_ipending_reg_irq4_wr_en;
  reg     [ 31: 0] A_iw /* synthesis ALTERA_IP_DEBUG_VISIBLE = 1 */;
  wire    [  4: 0] A_iw_a;
  wire    [  4: 0] A_iw_b;
  wire    [  4: 0] A_iw_c;
  wire    [  2: 0] A_iw_control_regnum;
  wire    [  7: 0] A_iw_custom_n;
  wire             A_iw_custom_readra;
  wire             A_iw_custom_readrb;
  wire             A_iw_custom_writerc;
  wire    [ 15: 0] A_iw_imm16;
  wire    [ 25: 0] A_iw_imm26;
  wire    [  4: 0] A_iw_imm5;
  wire    [  1: 0] A_iw_memsz;
  wire    [  5: 0] A_iw_op;
  wire    [  5: 0] A_iw_opx;
  wire    [  4: 0] A_iw_shift_imm5;
  wire    [  4: 0] A_iw_trap_break_imm5;
  reg              A_ld_align_byte1_fill;
  reg              A_ld_align_byte2_byte3_fill;
  reg              A_ld_align_sh16;
  reg              A_ld_align_sh8;
  reg              A_ld_bypass_delayed;
  reg              A_ld_bypass_delayed_started;
  wire             A_ld_bypass_done;
  wire             A_mem16;
  wire             A_mem32;
  wire             A_mem8;
  reg     [ 26: 0] A_mem_baddr;
  wire    [  1: 0] A_mem_baddr_byte_field;
  wire    [  5: 0] A_mem_baddr_line_field;
  wire    [  8: 0] A_mem_baddr_line_offset_field;
  wire    [  2: 0] A_mem_baddr_offset_field;
  wire             A_mem_bypass_pending;
  reg     [  3: 0] A_mem_byte_en;
  reg              A_mem_stall;
  wire             A_mem_stall_nxt;
  wire             A_mem_stall_start_nxt;
  wire             A_mem_stall_stop_nxt;
  wire    [ 31: 0] A_mul_cell_result;
  reg     [  2: 0] A_mul_cnt;
  wire    [  2: 0] A_mul_cnt_nxt;
  wire             A_mul_done_nxt;
  reg     [ 31: 0] A_mul_partial_prod;
  wire    [ 31: 0] A_mul_partial_prod_nxt;
  reg     [ 31: 0] A_mul_result;
  wire    [ 31: 0] A_mul_result_nxt;
  reg     [ 31: 0] A_mul_src1;
  wire    [ 31: 0] A_mul_src1_nxt;
  reg     [ 31: 0] A_mul_src2;
  wire    [ 31: 0] A_mul_src2_nxt;
  reg              A_mul_stall;
  reg              A_mul_stall_d1;
  reg              A_mul_stall_d2;
  reg              A_mul_stall_d3;
  wire             A_mul_stall_nxt;
  wire             A_op_add;
  wire             A_op_addi;
  wire             A_op_and;
  wire             A_op_andhi;
  wire             A_op_andi;
  wire             A_op_beq;
  wire             A_op_bge;
  wire             A_op_bgeu;
  wire             A_op_blt;
  wire             A_op_bltu;
  wire             A_op_bne;
  wire             A_op_br;
  wire             A_op_break;
  wire             A_op_bret;
  wire             A_op_call;
  wire             A_op_callr;
  wire             A_op_cmpeq;
  wire             A_op_cmpeqi;
  wire             A_op_cmpge;
  wire             A_op_cmpgei;
  wire             A_op_cmpgeu;
  wire             A_op_cmpgeui;
  wire             A_op_cmplt;
  wire             A_op_cmplti;
  wire             A_op_cmpltu;
  wire             A_op_cmpltui;
  wire             A_op_cmpne;
  wire             A_op_cmpnei;
  wire             A_op_crst;
  wire             A_op_custom;
  wire             A_op_div;
  wire             A_op_divu;
  wire             A_op_eret;
  wire             A_op_flushd;
  wire             A_op_flushda;
  wire             A_op_flushi;
  wire             A_op_flushp;
  wire             A_op_fpu;
  wire             A_op_hbreak;
  wire             A_op_initd;
  wire             A_op_initda;
  wire             A_op_initi;
  wire             A_op_intr;
  wire             A_op_jmp;
  wire             A_op_jmpi;
  wire             A_op_ldb;
  wire             A_op_ldbio;
  wire             A_op_ldbu;
  wire             A_op_ldbuio;
  wire             A_op_ldh;
  wire             A_op_ldhio;
  wire             A_op_ldhu;
  wire             A_op_ldhuio;
  wire             A_op_ldl;
  wire             A_op_ldw;
  wire             A_op_ldwio;
  wire             A_op_mul;
  wire             A_op_muli;
  wire             A_op_mulxss;
  wire             A_op_mulxsu;
  wire             A_op_mulxuu;
  wire             A_op_nextpc;
  wire             A_op_nor;
  wire             A_op_opx;
  wire             A_op_or;
  wire             A_op_orhi;
  wire             A_op_ori;
  wire             A_op_rdctl;
  wire             A_op_rdprs;
  wire             A_op_ret;
  wire             A_op_rol;
  wire             A_op_roli;
  wire             A_op_ror;
  wire             A_op_rsv02;
  wire             A_op_rsv09;
  wire             A_op_rsv10;
  wire             A_op_rsv17;
  wire             A_op_rsv18;
  wire             A_op_rsv25;
  wire             A_op_rsv26;
  wire             A_op_rsv33;
  wire             A_op_rsv34;
  wire             A_op_rsv41;
  wire             A_op_rsv42;
  wire             A_op_rsv49;
  wire             A_op_rsv57;
  wire             A_op_rsv61;
  wire             A_op_rsv62;
  wire             A_op_rsv63;
  wire             A_op_rsvx00;
  wire             A_op_rsvx10;
  wire             A_op_rsvx15;
  wire             A_op_rsvx17;
  wire             A_op_rsvx21;
  wire             A_op_rsvx25;
  wire             A_op_rsvx33;
  wire             A_op_rsvx34;
  wire             A_op_rsvx35;
  wire             A_op_rsvx42;
  wire             A_op_rsvx43;
  wire             A_op_rsvx44;
  wire             A_op_rsvx47;
  wire             A_op_rsvx50;
  wire             A_op_rsvx51;
  wire             A_op_rsvx55;
  wire             A_op_rsvx56;
  wire             A_op_rsvx60;
  wire             A_op_rsvx63;
  wire             A_op_sll;
  wire             A_op_slli;
  wire             A_op_sra;
  wire             A_op_srai;
  wire             A_op_srl;
  wire             A_op_srli;
  wire             A_op_stb;
  wire             A_op_stbio;
  wire             A_op_stc;
  wire             A_op_sth;
  wire             A_op_sthio;
  wire             A_op_stw;
  wire             A_op_stwio;
  wire             A_op_sub;
  wire             A_op_sync;
  wire             A_op_trap;
  wire             A_op_wrctl;
  wire             A_op_wrprs;
  wire             A_op_xor;
  wire             A_op_xorhi;
  wire             A_op_xori;
  reg     [ 26: 0] A_pcb /* synthesis ALTERA_IP_DEBUG_VISIBLE = 1 */;
  wire             A_pipe_flush;
  wire    [ 24: 0] A_pipe_flush_waddr;
  reg              A_regnum_a_cmp_D;
  wire             A_regnum_a_cmp_F;
  reg              A_regnum_b_cmp_D;
  wire             A_regnum_b_cmp_F;
  reg     [ 31: 0] A_rot;
  reg              A_rot_fill_bit;
  wire    [  7: 0] A_rot_lut0;
  wire    [  7: 0] A_rot_lut1;
  wire    [  7: 0] A_rot_lut2;
  wire    [  7: 0] A_rot_lut3;
  reg     [  7: 0] A_rot_mask;
  reg              A_rot_pass0;
  reg              A_rot_pass1;
  reg              A_rot_pass2;
  reg              A_rot_pass3;
  reg              A_rot_sel_fill0;
  reg              A_rot_sel_fill1;
  reg              A_rot_sel_fill2;
  reg              A_rot_sel_fill3;
  reg              A_shift_rot_cnt;
  wire             A_shift_rot_cnt_nxt;
  wire             A_shift_rot_done_nxt;
  reg     [ 31: 0] A_shift_rot_result;
  reg              A_shift_rot_stall;
  wire             A_shift_rot_stall_nxt;
  reg     [ 31: 0] A_slow_inst_result;
  wire             A_slow_inst_result_en;
  wire    [ 31: 0] A_slow_inst_result_nxt;
  reg              A_slow_inst_sel;
  wire             A_slow_inst_sel_nxt;
  wire    [ 15: 0] A_slow_ld16_data;
  wire    [  7: 0] A_slow_ld_byte0_data_aligned_nxt;
  wire    [  7: 0] A_slow_ld_byte1_data_aligned_nxt;
  wire    [  7: 0] A_slow_ld_byte2_data_aligned_nxt;
  wire    [  7: 0] A_slow_ld_byte3_data_aligned_nxt;
  wire    [ 31: 0] A_slow_ld_data_aligned_nxt;
  wire             A_slow_ld_data_fill_bit;
  wire             A_slow_ld_data_sign_bit;
  wire    [  1: 0] A_slow_ld_data_sign_bit_16;
  wire    [ 31: 0] A_slow_ld_data_unaligned;
  reg     [ 31: 0] A_src2;
  reg              A_st_bypass_delayed;
  reg              A_st_bypass_delayed_started;
  wire             A_st_bypass_done;
  wire             A_st_bypass_transfer_done;
  reg              A_st_bypass_transfer_done_d1;
  reg     [ 31: 0] A_st_data;
  wire             A_stall;
  wire    [ 31: 0] A_status_reg;
  reg              A_status_reg_pie;
  wire             A_status_reg_pie_inst_nxt;
  wire             A_status_reg_pie_nxt;
  wire             A_status_reg_pie_wr_en;
  reg              A_valid /* synthesis ALTERA_IP_DEBUG_VISIBLE = 1 */;
  wire             A_valid_crst;
  reg              A_valid_wrctl_ienable;
  wire    [ 55: 0] A_vinst;
  wire    [ 31: 0] A_wr_data_filtered;
  wire    [ 31: 0] A_wr_data_unfiltered;
  wire             A_wr_dst_reg;
  reg              A_wr_dst_reg_from_M;
  reg     [  1: 0] D_bht_data;
  reg     [  7: 0] D_bht_ptr;
  wire             D_br_cond_pred_taken;
  wire    [ 14: 0] D_br_offset_remaining;
  wire    [ 19: 0] D_br_offset_sex;
  wire             D_br_pred_not_taken;
  wire             D_br_pred_taken;
  wire    [ 26: 0] D_br_taken_baddr;
  wire    [ 24: 0] D_br_taken_waddr;
  reg     [ 10: 0] D_br_taken_waddr_partial;
  wire    [  1: 0] D_compare_op;
  wire    [ 31: 0] D_control_reg_rddata_muxed;
  wire             D_ctrl_a_is_src;
  reg              D_ctrl_a_not_src;
  wire             D_ctrl_a_not_src_nxt;
  wire             D_ctrl_alu_force_xor;
  wire             D_ctrl_alu_signed_comparison;
  wire             D_ctrl_alu_subtract;
  reg              D_ctrl_b_is_dst;
  wire             D_ctrl_b_is_dst_nxt;
  wire             D_ctrl_b_is_src;
  reg              D_ctrl_b_not_src;
  wire             D_ctrl_b_not_src_nxt;
  reg              D_ctrl_br;
  wire             D_ctrl_br_always_pred_taken;
  wire             D_ctrl_br_cond;
  wire             D_ctrl_br_nxt;
  reg              D_ctrl_br_uncond;
  wire             D_ctrl_br_uncond_nxt;
  wire             D_ctrl_break;
  wire             D_ctrl_cmp;
  wire             D_ctrl_crst;
  wire             D_ctrl_custom_combo;
  wire             D_ctrl_custom_multi;
  wire             D_ctrl_exception;
  wire             D_ctrl_flush_pipe_always;
  reg              D_ctrl_hi_imm16;
  wire             D_ctrl_hi_imm16_nxt;
  reg              D_ctrl_ignore_dst;
  wire             D_ctrl_ignore_dst_nxt;
  wire             D_ctrl_illegal;
  reg              D_ctrl_implicit_dst_eretaddr;
  wire             D_ctrl_implicit_dst_eretaddr_nxt;
  reg              D_ctrl_implicit_dst_retaddr;
  wire             D_ctrl_implicit_dst_retaddr_nxt;
  reg              D_ctrl_jmp_direct;
  wire             D_ctrl_jmp_direct_nxt;
  wire             D_ctrl_jmp_indirect;
  wire             D_ctrl_late_result;
  wire             D_ctrl_ld;
  wire             D_ctrl_logic;
  wire             D_ctrl_mul_lsw;
  wire             D_ctrl_retaddr;
  wire             D_ctrl_rot;
  wire             D_ctrl_shift_right_arith;
  wire             D_ctrl_shift_rot;
  wire             D_ctrl_shift_rot_left;
  wire             D_ctrl_shift_rot_right;
  reg              D_ctrl_src2_choose_imm;
  wire             D_ctrl_src2_choose_imm_nxt;
  wire             D_ctrl_supervisor_only;
  wire             D_ctrl_uncond_cti_non_br;
  wire             D_ctrl_unimp_nop;
  wire             D_ctrl_unimp_trap;
  reg              D_ctrl_unsigned_lo_imm16;
  wire             D_ctrl_unsigned_lo_imm16_nxt;
  wire             D_data_depend;
  wire             D_dep_stall;
  wire    [  4: 0] D_dst_regnum;
  wire    [  4: 0] D_dstfield_regnum;
  wire             D_en;
  wire    [ 24: 0] D_extra_pc;
  wire    [ 26: 0] D_extra_pcb;
  wire             D_ic_bypass_start_avalon_read;
  wire             D_ic_fill_ignore;
  reg              D_ic_fill_same_tag_line;
  wire             D_ic_fill_starting;
  reg              D_ic_fill_starting_d1;
  wire             D_ic_want_fill;
  wire             D_ic_want_fill_unfiltered;
  wire             D_ic_want_fill_unfiltered_is_x;
  wire    [ 55: 0] D_inst;
  reg              D_issue;
  wire             D_issue_rdprs;
  reg     [ 31: 0] D_iw;
  wire    [  4: 0] D_iw_a;
  wire    [  4: 0] D_iw_b;
  wire    [  4: 0] D_iw_c;
  wire    [  2: 0] D_iw_control_regnum;
  wire    [  7: 0] D_iw_custom_n;
  wire             D_iw_custom_readra;
  wire             D_iw_custom_readrb;
  wire             D_iw_custom_writerc;
  wire    [ 15: 0] D_iw_imm16;
  wire    [ 25: 0] D_iw_imm26;
  wire    [  4: 0] D_iw_imm5;
  wire    [  1: 0] D_iw_memsz;
  wire    [  5: 0] D_iw_op;
  wire    [  5: 0] D_iw_opx;
  wire    [  4: 0] D_iw_shift_imm5;
  wire    [  4: 0] D_iw_trap_break_imm5;
  reg              D_iw_valid;
  wire    [ 26: 0] D_jmp_direct_target_baddr;
  wire    [ 24: 0] D_jmp_direct_target_waddr;
  reg              D_kill;
  wire    [  1: 0] D_logic_op;
  wire    [  1: 0] D_logic_op_raw;
  wire             D_mem16;
  wire             D_mem32;
  wire             D_mem8;
  wire             D_op_add;
  wire             D_op_addi;
  wire             D_op_and;
  wire             D_op_andhi;
  wire             D_op_andi;
  wire             D_op_beq;
  wire             D_op_bge;
  wire             D_op_bgeu;
  wire             D_op_blt;
  wire             D_op_bltu;
  wire             D_op_bne;
  wire             D_op_br;
  wire             D_op_break;
  wire             D_op_bret;
  wire             D_op_call;
  wire             D_op_callr;
  wire             D_op_cmpeq;
  wire             D_op_cmpeqi;
  wire             D_op_cmpge;
  wire             D_op_cmpgei;
  wire             D_op_cmpgeu;
  wire             D_op_cmpgeui;
  wire             D_op_cmplt;
  wire             D_op_cmplti;
  wire             D_op_cmpltu;
  wire             D_op_cmpltui;
  wire             D_op_cmpne;
  wire             D_op_cmpnei;
  wire             D_op_crst;
  wire             D_op_custom;
  wire             D_op_div;
  wire             D_op_divu;
  wire             D_op_eret;
  wire             D_op_flushd;
  wire             D_op_flushda;
  wire             D_op_flushi;
  wire             D_op_flushp;
  wire             D_op_fpu;
  wire             D_op_hbreak;
  wire             D_op_initd;
  wire             D_op_initda;
  wire             D_op_initi;
  wire             D_op_intr;
  wire             D_op_jmp;
  wire             D_op_jmpi;
  wire             D_op_ldb;
  wire             D_op_ldbio;
  wire             D_op_ldbu;
  wire             D_op_ldbuio;
  wire             D_op_ldh;
  wire             D_op_ldhio;
  wire             D_op_ldhu;
  wire             D_op_ldhuio;
  wire             D_op_ldl;
  wire             D_op_ldw;
  wire             D_op_ldwio;
  wire             D_op_mul;
  wire             D_op_muli;
  wire             D_op_mulxss;
  wire             D_op_mulxsu;
  wire             D_op_mulxuu;
  wire             D_op_nextpc;
  wire             D_op_nor;
  wire             D_op_opx;
  wire             D_op_or;
  wire             D_op_orhi;
  wire             D_op_ori;
  wire             D_op_rdctl;
  wire             D_op_rdprs;
  wire             D_op_ret;
  wire             D_op_rol;
  wire             D_op_roli;
  wire             D_op_ror;
  wire             D_op_rsv02;
  wire             D_op_rsv09;
  wire             D_op_rsv10;
  wire             D_op_rsv17;
  wire             D_op_rsv18;
  wire             D_op_rsv25;
  wire             D_op_rsv26;
  wire             D_op_rsv33;
  wire             D_op_rsv34;
  wire             D_op_rsv41;
  wire             D_op_rsv42;
  wire             D_op_rsv49;
  wire             D_op_rsv57;
  wire             D_op_rsv61;
  wire             D_op_rsv62;
  wire             D_op_rsv63;
  wire             D_op_rsvx00;
  wire             D_op_rsvx10;
  wire             D_op_rsvx15;
  wire             D_op_rsvx17;
  wire             D_op_rsvx21;
  wire             D_op_rsvx25;
  wire             D_op_rsvx33;
  wire             D_op_rsvx34;
  wire             D_op_rsvx35;
  wire             D_op_rsvx42;
  wire             D_op_rsvx43;
  wire             D_op_rsvx44;
  wire             D_op_rsvx47;
  wire             D_op_rsvx50;
  wire             D_op_rsvx51;
  wire             D_op_rsvx55;
  wire             D_op_rsvx56;
  wire             D_op_rsvx60;
  wire             D_op_rsvx63;
  wire             D_op_sll;
  wire             D_op_slli;
  wire             D_op_sra;
  wire             D_op_srai;
  wire             D_op_srl;
  wire             D_op_srli;
  wire             D_op_stb;
  wire             D_op_stbio;
  wire             D_op_stc;
  wire             D_op_sth;
  wire             D_op_sthio;
  wire             D_op_stw;
  wire             D_op_stwio;
  wire             D_op_sub;
  wire             D_op_sync;
  wire             D_op_trap;
  wire             D_op_wrctl;
  wire             D_op_wrprs;
  wire             D_op_xor;
  wire             D_op_xorhi;
  wire             D_op_xori;
  reg     [ 24: 0] D_pc;
  wire    [  6: 0] D_pc_line_field;
  wire    [  2: 0] D_pc_offset_field;
  reg     [ 24: 0] D_pc_plus_one;
  wire    [ 14: 0] D_pc_tag_field;
  wire    [ 26: 0] D_pcb;
  wire             D_rdprs_stall;
  reg              D_rdprs_stall_done;
  wire             D_rdprs_stall_done_nxt;
  wire             D_rdprs_stall_unfiltered;
  wire             D_refetch;
  wire             D_regnum_a_cmp_F;
  wire             D_regnum_b_cmp_F;
  wire    [ 31: 0] D_rf_a;
  wire    [ 31: 0] D_rf_b;
  wire    [ 31: 0] D_src1;
  wire             D_src1_choose_A;
  wire             D_src1_choose_E;
  wire             D_src1_choose_M;
  wire             D_src1_choose_W;
  wire             D_src1_hazard_A;
  wire             D_src1_hazard_E;
  wire             D_src1_hazard_M;
  wire             D_src1_hazard_W;
  wire             D_src1_other_rs;
  wire    [ 31: 0] D_src1_reg;
  wire    [ 31: 0] D_src2;
  wire             D_src2_choose_A;
  wire             D_src2_choose_E;
  wire             D_src2_choose_M;
  wire             D_src2_choose_W;
  wire             D_src2_hazard_A;
  wire             D_src2_hazard_E;
  wire             D_src2_hazard_M;
  wire             D_src2_hazard_W;
  wire    [ 31: 0] D_src2_imm;
  wire    [  1: 0] D_src2_imm_sel;
  wire    [ 31: 0] D_src2_reg;
  wire             D_stall;
  wire             D_valid;
  wire    [ 55: 0] D_vinst;
  wire             D_wr_dst_reg;
  wire             E_M_dc_line_offset_match;
  wire             E_add_br_to_taken_history_filtered;
  wire             E_add_br_to_taken_history_unfiltered;
  wire    [ 31: 0] E_alu_result;
  wire    [ 32: 0] E_arith_result;
  wire    [ 31: 0] E_arith_src1;
  wire    [ 31: 0] E_arith_src2;
  reg     [  1: 0] E_bht_data;
  reg     [  7: 0] E_bht_ptr;
  wire             E_br_actually_taken;
  wire             E_br_cond_pred_taken;
  wire    [  7: 0] E_br_cond_taken_history;
  wire             E_br_mispredict;
  wire             E_br_result;
  reg     [ 26: 0] E_br_taken_baddr;
  wire             E_cancel;
  wire             E_cmp_result;
  reg     [  1: 0] E_compare_op;
  reg     [ 31: 0] E_control_reg_rddata;
  reg              E_ctrl_a_not_src;
  wire             E_ctrl_a_not_src_nxt;
  reg              E_ctrl_alu_force_xor;
  wire             E_ctrl_alu_force_xor_nxt;
  reg              E_ctrl_alu_signed_comparison;
  wire             E_ctrl_alu_signed_comparison_nxt;
  reg              E_ctrl_alu_subtract;
  wire             E_ctrl_alu_subtract_nxt;
  reg              E_ctrl_b_is_dst;
  wire             E_ctrl_b_is_dst_nxt;
  reg              E_ctrl_b_not_src;
  wire             E_ctrl_b_not_src_nxt;
  reg              E_ctrl_br;
  reg              E_ctrl_br_always_pred_taken;
  wire             E_ctrl_br_always_pred_taken_nxt;
  reg              E_ctrl_br_cond;
  wire             E_ctrl_br_cond_nxt;
  wire             E_ctrl_br_nxt;
  reg              E_ctrl_br_uncond;
  wire             E_ctrl_br_uncond_nxt;
  reg              E_ctrl_break;
  wire             E_ctrl_break_nxt;
  reg              E_ctrl_cmp;
  wire             E_ctrl_cmp_nxt;
  reg              E_ctrl_crst;
  wire             E_ctrl_crst_nxt;
  reg              E_ctrl_custom_combo;
  wire             E_ctrl_custom_combo_nxt;
  reg              E_ctrl_custom_multi;
  wire             E_ctrl_custom_multi_nxt;
  wire             E_ctrl_dc_addr_inv;
  wire             E_ctrl_dc_addr_nowb_inv;
  wire             E_ctrl_dc_addr_wb_inv;
  wire             E_ctrl_dc_index_inv;
  wire             E_ctrl_dc_index_nowb_inv;
  wire             E_ctrl_dc_index_wb_inv;
  wire             E_ctrl_dc_nowb_inv;
  wire             E_ctrl_dcache_management;
  reg              E_ctrl_exception;
  wire             E_ctrl_exception_nxt;
  reg              E_ctrl_flush_pipe_always;
  wire             E_ctrl_flush_pipe_always_nxt;
  reg              E_ctrl_hi_imm16;
  wire             E_ctrl_hi_imm16_nxt;
  reg              E_ctrl_ignore_dst;
  wire             E_ctrl_ignore_dst_nxt;
  reg              E_ctrl_illegal;
  wire             E_ctrl_illegal_nxt;
  reg              E_ctrl_implicit_dst_eretaddr;
  wire             E_ctrl_implicit_dst_eretaddr_nxt;
  reg              E_ctrl_implicit_dst_retaddr;
  wire             E_ctrl_implicit_dst_retaddr_nxt;
  wire             E_ctrl_invalidate_i;
  reg              E_ctrl_jmp_direct;
  wire             E_ctrl_jmp_direct_nxt;
  reg              E_ctrl_jmp_indirect;
  wire             E_ctrl_jmp_indirect_nxt;
  reg              E_ctrl_late_result;
  wire             E_ctrl_late_result_nxt;
  reg              E_ctrl_ld;
  wire             E_ctrl_ld16;
  wire             E_ctrl_ld32;
  wire             E_ctrl_ld8;
  wire             E_ctrl_ld8_ld16;
  wire             E_ctrl_ld_bypass;
  wire             E_ctrl_ld_dcache_management;
  wire             E_ctrl_ld_io;
  wire             E_ctrl_ld_non_bypass;
  wire             E_ctrl_ld_non_io;
  wire             E_ctrl_ld_nxt;
  wire             E_ctrl_ld_signed;
  wire             E_ctrl_ld_st;
  wire             E_ctrl_ld_st_bypass;
  wire             E_ctrl_ld_st_bypass_or_dcache_management;
  wire             E_ctrl_ld_st_io;
  wire             E_ctrl_ld_st_non_bypass;
  wire             E_ctrl_ld_st_non_bypass_non_st32;
  wire             E_ctrl_ld_st_non_io;
  wire             E_ctrl_ld_st_non_io_non_st32;
  wire             E_ctrl_ld_st_non_st32;
  reg              E_ctrl_logic;
  wire             E_ctrl_logic_nxt;
  wire             E_ctrl_mem;
  wire             E_ctrl_mem16;
  wire             E_ctrl_mem32;
  wire             E_ctrl_mem8;
  wire             E_ctrl_mem_data_access;
  reg              E_ctrl_mul_lsw;
  wire             E_ctrl_mul_lsw_nxt;
  wire             E_ctrl_rdctl_inst;
  reg              E_ctrl_retaddr;
  wire             E_ctrl_retaddr_nxt;
  reg              E_ctrl_rot;
  wire             E_ctrl_rot_nxt;
  reg              E_ctrl_shift_right_arith;
  wire             E_ctrl_shift_right_arith_nxt;
  reg              E_ctrl_shift_rot;
  reg              E_ctrl_shift_rot_left;
  wire             E_ctrl_shift_rot_left_nxt;
  wire             E_ctrl_shift_rot_nxt;
  reg              E_ctrl_shift_rot_right;
  wire             E_ctrl_shift_rot_right_nxt;
  reg              E_ctrl_src2_choose_imm;
  wire             E_ctrl_src2_choose_imm_nxt;
  wire             E_ctrl_st;
  wire             E_ctrl_st16;
  wire             E_ctrl_st8;
  wire             E_ctrl_st_bypass;
  wire             E_ctrl_st_io;
  wire             E_ctrl_st_non_bypass;
  wire             E_ctrl_st_non_io;
  reg              E_ctrl_supervisor_only;
  wire             E_ctrl_supervisor_only_nxt;
  reg              E_ctrl_uncond_cti_non_br;
  wire             E_ctrl_uncond_cti_non_br_nxt;
  reg              E_ctrl_unimp_nop;
  wire             E_ctrl_unimp_nop_nxt;
  reg              E_ctrl_unimp_trap;
  wire             E_ctrl_unimp_trap_nxt;
  reg              E_ctrl_unsigned_lo_imm16;
  wire             E_ctrl_unsigned_lo_imm16_nxt;
  wire             E_ctrl_wrctl_inst;
  reg     [  4: 0] E_dst_regnum;
  wire             E_en;
  wire             E_eq;
  reg     [ 24: 0] E_extra_pc;
  wire    [ 26: 0] E_extra_pcb;
  wire    [ 31: 0] E_fwd_reg_data;
  wire             E_hbreak_req;
  wire    [ 55: 0] E_inst;
  reg     [ 31: 0] E_iw;
  wire    [  4: 0] E_iw_a;
  wire    [  4: 0] E_iw_b;
  wire    [  4: 0] E_iw_c;
  wire    [  2: 0] E_iw_control_regnum;
  wire    [  7: 0] E_iw_custom_n;
  wire             E_iw_custom_readra;
  wire             E_iw_custom_readrb;
  wire             E_iw_custom_writerc;
  wire    [ 15: 0] E_iw_imm16;
  wire    [ 25: 0] E_iw_imm26;
  wire    [  4: 0] E_iw_imm5;
  wire    [  1: 0] E_iw_memsz;
  wire    [  5: 0] E_iw_op;
  wire    [  5: 0] E_iw_opx;
  wire    [  4: 0] E_iw_shift_imm5;
  wire    [  4: 0] E_iw_trap_break_imm5;
  reg     [  1: 0] E_logic_op;
  wire    [ 31: 0] E_logic_result;
  wire             E_lt;
  wire             E_mem16;
  wire             E_mem32;
  wire             E_mem8;
  wire    [ 26: 0] E_mem_baddr;
  wire    [  1: 0] E_mem_baddr_byte_field;
  wire    [  5: 0] E_mem_baddr_line_field;
  wire    [  8: 0] E_mem_baddr_line_offset_field;
  wire    [  2: 0] E_mem_baddr_offset_field;
  wire             E_mem_bypass_non_io;
  wire    [  3: 0] E_mem_byte_en;
  wire             E_op_add;
  wire             E_op_addi;
  wire             E_op_and;
  wire             E_op_andhi;
  wire             E_op_andi;
  wire             E_op_beq;
  wire             E_op_bge;
  wire             E_op_bgeu;
  wire             E_op_blt;
  wire             E_op_bltu;
  wire             E_op_bne;
  wire             E_op_br;
  wire             E_op_break;
  wire             E_op_bret;
  wire             E_op_call;
  wire             E_op_callr;
  wire             E_op_cmpeq;
  wire             E_op_cmpeqi;
  wire             E_op_cmpge;
  wire             E_op_cmpgei;
  wire             E_op_cmpgeu;
  wire             E_op_cmpgeui;
  wire             E_op_cmplt;
  wire             E_op_cmplti;
  wire             E_op_cmpltu;
  wire             E_op_cmpltui;
  wire             E_op_cmpne;
  wire             E_op_cmpnei;
  wire             E_op_crst;
  wire             E_op_custom;
  wire             E_op_div;
  wire             E_op_divu;
  wire             E_op_eret;
  wire             E_op_flushd;
  wire             E_op_flushda;
  wire             E_op_flushi;
  wire             E_op_flushp;
  wire             E_op_fpu;
  wire             E_op_hbreak;
  wire             E_op_initd;
  wire             E_op_initda;
  wire             E_op_initi;
  wire             E_op_intr;
  wire             E_op_jmp;
  wire             E_op_jmpi;
  wire             E_op_ldb;
  wire             E_op_ldbio;
  wire             E_op_ldbu;
  wire             E_op_ldbuio;
  wire             E_op_ldh;
  wire             E_op_ldhio;
  wire             E_op_ldhu;
  wire             E_op_ldhuio;
  wire             E_op_ldl;
  wire             E_op_ldw;
  wire             E_op_ldwio;
  wire             E_op_mul;
  wire             E_op_muli;
  wire             E_op_mulxss;
  wire             E_op_mulxsu;
  wire             E_op_mulxuu;
  wire             E_op_nextpc;
  wire             E_op_nor;
  wire             E_op_opx;
  wire             E_op_or;
  wire             E_op_orhi;
  wire             E_op_ori;
  wire             E_op_rdctl;
  wire             E_op_rdprs;
  wire             E_op_ret;
  wire             E_op_rol;
  wire             E_op_roli;
  wire             E_op_ror;
  wire             E_op_rsv02;
  wire             E_op_rsv09;
  wire             E_op_rsv10;
  wire             E_op_rsv17;
  wire             E_op_rsv18;
  wire             E_op_rsv25;
  wire             E_op_rsv26;
  wire             E_op_rsv33;
  wire             E_op_rsv34;
  wire             E_op_rsv41;
  wire             E_op_rsv42;
  wire             E_op_rsv49;
  wire             E_op_rsv57;
  wire             E_op_rsv61;
  wire             E_op_rsv62;
  wire             E_op_rsv63;
  wire             E_op_rsvx00;
  wire             E_op_rsvx10;
  wire             E_op_rsvx15;
  wire             E_op_rsvx17;
  wire             E_op_rsvx21;
  wire             E_op_rsvx25;
  wire             E_op_rsvx33;
  wire             E_op_rsvx34;
  wire             E_op_rsvx35;
  wire             E_op_rsvx42;
  wire             E_op_rsvx43;
  wire             E_op_rsvx44;
  wire             E_op_rsvx47;
  wire             E_op_rsvx50;
  wire             E_op_rsvx51;
  wire             E_op_rsvx55;
  wire             E_op_rsvx56;
  wire             E_op_rsvx60;
  wire             E_op_rsvx63;
  wire             E_op_sll;
  wire             E_op_slli;
  wire             E_op_sra;
  wire             E_op_srai;
  wire             E_op_srl;
  wire             E_op_srli;
  wire             E_op_stb;
  wire             E_op_stbio;
  wire             E_op_stc;
  wire             E_op_sth;
  wire             E_op_sthio;
  wire             E_op_stw;
  wire             E_op_stwio;
  wire             E_op_sub;
  wire             E_op_sync;
  wire             E_op_trap;
  wire             E_op_wrctl;
  wire             E_op_wrprs;
  wire             E_op_xor;
  wire             E_op_xorhi;
  wire             E_op_xori;
  reg     [ 24: 0] E_pc;
  reg     [ 26: 0] E_pcb;
  reg              E_regnum_a_cmp_D;
  wire             E_regnum_a_cmp_F;
  reg              E_regnum_b_cmp_D;
  wire             E_regnum_b_cmp_F;
  wire             E_rot_fill_bit;
  wire    [  7: 0] E_rot_left_mask;
  wire    [  7: 0] E_rot_mask;
  wire    [  4: 0] E_rot_n;
  wire             E_rot_pass0;
  wire             E_rot_pass1;
  wire             E_rot_pass2;
  wire             E_rot_pass3;
  wire    [ 31: 0] E_rot_prestep1;
  wire    [  7: 0] E_rot_right_mask;
  wire    [  4: 0] E_rot_rn;
  wire             E_rot_sel_fill0;
  wire             E_rot_sel_fill1;
  wire             E_rot_sel_fill2;
  wire             E_rot_sel_fill3;
  wire             E_sel_data_master;
  reg     [ 31: 0] E_src1;
  wire             E_src1_eq_src2;
  reg     [ 31: 0] E_src2;
  reg     [ 31: 0] E_src2_reg;
  wire    [ 31: 0] E_st_data;
  wire             E_stall;
  wire    [  7: 0] E_stb_data;
  wire    [ 15: 0] E_sth_data;
  wire    [ 31: 0] E_stw_data;
  wire             E_valid;
  reg              E_valid_from_D;
  reg              E_valid_jmp_indirect;
  wire             E_valid_prior_to_hbreak;
  wire    [ 55: 0] E_vinst;
  wire             E_wr_dst_reg;
  reg              E_wr_dst_reg_from_D;
  wire    [  1: 0] F_bht_data;
  reg     [  7: 0] F_bht_ptr;
  wire    [  7: 0] F_bht_ptr_nxt;
  wire    [ 10: 0] F_br_taken_waddr_partial;
  wire             F_ctrl_a_not_src;
  wire             F_ctrl_b_is_dst;
  wire             F_ctrl_b_not_src;
  wire             F_ctrl_br;
  wire             F_ctrl_br_uncond;
  wire             F_ctrl_hi_imm16;
  wire             F_ctrl_ignore_dst;
  wire             F_ctrl_implicit_dst_eretaddr;
  wire             F_ctrl_implicit_dst_retaddr;
  wire             F_ctrl_jmp_direct;
  wire             F_ctrl_src2_choose_imm;
  wire             F_ctrl_unsigned_lo_imm16;
  wire             F_en;
  wire             F_ic_bypass_req;
  wire    [  9: 0] F_ic_data_rd_addr_nxt;
  wire    [ 14: 0] F_ic_desired_tag;
  wire             F_ic_fill_same_tag_line;
  wire             F_ic_hit;
  wire    [ 31: 0] F_ic_iw;
  wire    [ 14: 0] F_ic_tag_field;
  wire    [ 22: 0] F_ic_tag_rd;
  wire    [  6: 0] F_ic_tag_rd_addr_nxt;
  wire             F_ic_valid;
  wire    [  7: 0] F_ic_valid_bits;
  wire    [ 55: 0] F_inst;
  wire             F_inst_ram_hit;
  wire             F_issue;
  wire    [ 31: 0] F_iw;
  wire    [  4: 0] F_iw_a;
  wire    [  4: 0] F_iw_a_rf;
  wire    [  4: 0] F_iw_b;
  wire    [  4: 0] F_iw_b_rf;
  wire    [  4: 0] F_iw_c;
  wire    [  2: 0] F_iw_control_regnum;
  wire    [  7: 0] F_iw_custom_n;
  wire             F_iw_custom_readra;
  wire             F_iw_custom_readrb;
  wire             F_iw_custom_writerc;
  wire    [ 15: 0] F_iw_imm16;
  wire    [ 25: 0] F_iw_imm26;
  wire    [  4: 0] F_iw_imm5;
  wire    [  1: 0] F_iw_memsz;
  wire    [  5: 0] F_iw_op;
  wire    [  5: 0] F_iw_opx;
  wire    [  4: 0] F_iw_shift_imm5;
  wire    [  4: 0] F_iw_trap_break_imm5;
  wire             F_iw_valid;
  wire             F_kill;
  wire             F_mem16;
  wire             F_mem32;
  wire             F_mem8;
  wire             F_op_add;
  wire             F_op_addi;
  wire             F_op_and;
  wire             F_op_andhi;
  wire             F_op_andi;
  wire             F_op_beq;
  wire             F_op_bge;
  wire             F_op_bgeu;
  wire             F_op_blt;
  wire             F_op_bltu;
  wire             F_op_bne;
  wire             F_op_br;
  wire             F_op_break;
  wire             F_op_bret;
  wire             F_op_call;
  wire             F_op_callr;
  wire             F_op_cmpeq;
  wire             F_op_cmpeqi;
  wire             F_op_cmpge;
  wire             F_op_cmpgei;
  wire             F_op_cmpgeu;
  wire             F_op_cmpgeui;
  wire             F_op_cmplt;
  wire             F_op_cmplti;
  wire             F_op_cmpltu;
  wire             F_op_cmpltui;
  wire             F_op_cmpne;
  wire             F_op_cmpnei;
  wire             F_op_crst;
  wire             F_op_custom;
  wire             F_op_div;
  wire             F_op_divu;
  wire             F_op_eret;
  wire             F_op_flushd;
  wire             F_op_flushda;
  wire             F_op_flushi;
  wire             F_op_flushp;
  wire             F_op_fpu;
  wire             F_op_hbreak;
  wire             F_op_initd;
  wire             F_op_initda;
  wire             F_op_initi;
  wire             F_op_intr;
  wire             F_op_jmp;
  wire             F_op_jmpi;
  wire             F_op_ldb;
  wire             F_op_ldbio;
  wire             F_op_ldbu;
  wire             F_op_ldbuio;
  wire             F_op_ldh;
  wire             F_op_ldhio;
  wire             F_op_ldhu;
  wire             F_op_ldhuio;
  wire             F_op_ldl;
  wire             F_op_ldw;
  wire             F_op_ldwio;
  wire             F_op_mul;
  wire             F_op_muli;
  wire             F_op_mulxss;
  wire             F_op_mulxsu;
  wire             F_op_mulxuu;
  wire             F_op_nextpc;
  wire             F_op_nor;
  wire             F_op_opx;
  wire             F_op_or;
  wire             F_op_orhi;
  wire             F_op_ori;
  wire             F_op_rdctl;
  wire             F_op_rdprs;
  wire             F_op_ret;
  wire             F_op_rol;
  wire             F_op_roli;
  wire             F_op_ror;
  wire             F_op_rsv02;
  wire             F_op_rsv09;
  wire             F_op_rsv10;
  wire             F_op_rsv17;
  wire             F_op_rsv18;
  wire             F_op_rsv25;
  wire             F_op_rsv26;
  wire             F_op_rsv33;
  wire             F_op_rsv34;
  wire             F_op_rsv41;
  wire             F_op_rsv42;
  wire             F_op_rsv49;
  wire             F_op_rsv57;
  wire             F_op_rsv61;
  wire             F_op_rsv62;
  wire             F_op_rsv63;
  wire             F_op_rsvx00;
  wire             F_op_rsvx10;
  wire             F_op_rsvx15;
  wire             F_op_rsvx17;
  wire             F_op_rsvx21;
  wire             F_op_rsvx25;
  wire             F_op_rsvx33;
  wire             F_op_rsvx34;
  wire             F_op_rsvx35;
  wire             F_op_rsvx42;
  wire             F_op_rsvx43;
  wire             F_op_rsvx44;
  wire             F_op_rsvx47;
  wire             F_op_rsvx50;
  wire             F_op_rsvx51;
  wire             F_op_rsvx55;
  wire             F_op_rsvx56;
  wire             F_op_rsvx60;
  wire             F_op_rsvx63;
  wire             F_op_sll;
  wire             F_op_slli;
  wire             F_op_sra;
  wire             F_op_srai;
  wire             F_op_srl;
  wire             F_op_srli;
  wire             F_op_stb;
  wire             F_op_stbio;
  wire             F_op_stc;
  wire             F_op_sth;
  wire             F_op_sthio;
  wire             F_op_stw;
  wire             F_op_stwio;
  wire             F_op_sub;
  wire             F_op_sync;
  wire             F_op_trap;
  wire             F_op_wrctl;
  wire             F_op_wrprs;
  wire             F_op_xor;
  wire             F_op_xorhi;
  wire             F_op_xori;
  reg     [ 24: 0] F_pc;
  wire    [  6: 0] F_pc_line_field;
  wire    [ 24: 0] F_pc_nxt;
  wire    [ 24: 0] F_pc_plus_one;
  wire    [ 14: 0] F_pc_tag_field;
  wire    [ 26: 0] F_pcb;
  wire    [ 26: 0] F_pcb_nxt;
  wire    [ 31: 0] F_ram_iw;
  wire    [  4: 0] F_ram_iw_a;
  wire    [  4: 0] F_ram_iw_b;
  wire    [  4: 0] F_ram_iw_c;
  wire    [  2: 0] F_ram_iw_control_regnum;
  wire    [  7: 0] F_ram_iw_custom_n;
  wire             F_ram_iw_custom_readra;
  wire             F_ram_iw_custom_readrb;
  wire             F_ram_iw_custom_writerc;
  wire    [ 15: 0] F_ram_iw_imm16;
  wire    [ 25: 0] F_ram_iw_imm26;
  wire    [  4: 0] F_ram_iw_imm5;
  wire    [  1: 0] F_ram_iw_memsz;
  wire    [  5: 0] F_ram_iw_op;
  wire    [  5: 0] F_ram_iw_opx;
  wire    [  4: 0] F_ram_iw_shift_imm5;
  wire    [  4: 0] F_ram_iw_trap_break_imm5;
  wire             F_ram_mem16;
  wire             F_ram_mem32;
  wire             F_ram_mem8;
  wire             F_sel_instruction_master;
  wire             F_stall;
  wire    [ 55: 0] F_vinst;
  wire             M_A_dc_line_match;
  reg              M_A_dc_line_match_d1;
  reg     [ 31: 0] M_alu_result;
  reg     [  1: 0] M_bht_data;
  wire    [  7: 0] M_bht_ptr_filtered;
  reg     [  7: 0] M_bht_ptr_unfiltered;
  wire    [  1: 0] M_bht_wr_data_filtered;
  wire    [  1: 0] M_bht_wr_data_unfiltered;
  wire             M_bht_wr_en_filtered;
  wire             M_bht_wr_en_unfiltered;
  reg              M_br_actually_taken;
  reg     [  7: 0] M_br_cond_taken_history;
  reg              M_br_mispredict;
  reg     [ 26: 0] M_br_taken_baddr;
  wire             M_cancel;
  reg              M_cmp_result;
  reg     [ 31: 0] M_control_reg_rddata;
  reg              M_ctrl_a_not_src;
  wire             M_ctrl_a_not_src_nxt;
  reg              M_ctrl_alu_force_xor;
  wire             M_ctrl_alu_force_xor_nxt;
  reg              M_ctrl_alu_signed_comparison;
  wire             M_ctrl_alu_signed_comparison_nxt;
  reg              M_ctrl_alu_subtract;
  wire             M_ctrl_alu_subtract_nxt;
  reg              M_ctrl_b_is_dst;
  wire             M_ctrl_b_is_dst_nxt;
  reg              M_ctrl_b_not_src;
  wire             M_ctrl_b_not_src_nxt;
  reg              M_ctrl_br;
  reg              M_ctrl_br_always_pred_taken;
  wire             M_ctrl_br_always_pred_taken_nxt;
  reg              M_ctrl_br_cond;
  wire             M_ctrl_br_cond_nxt;
  wire             M_ctrl_br_nxt;
  reg              M_ctrl_br_uncond;
  wire             M_ctrl_br_uncond_nxt;
  reg              M_ctrl_break;
  wire             M_ctrl_break_nxt;
  reg              M_ctrl_cmp;
  wire             M_ctrl_cmp_nxt;
  reg              M_ctrl_crst;
  wire             M_ctrl_crst_nxt;
  reg              M_ctrl_custom_combo;
  wire             M_ctrl_custom_combo_nxt;
  reg              M_ctrl_custom_multi;
  wire             M_ctrl_custom_multi_nxt;
  reg              M_ctrl_dc_addr_inv;
  wire             M_ctrl_dc_addr_inv_nxt;
  reg              M_ctrl_dc_addr_nowb_inv;
  wire             M_ctrl_dc_addr_nowb_inv_nxt;
  reg              M_ctrl_dc_addr_wb_inv;
  wire             M_ctrl_dc_addr_wb_inv_nxt;
  reg              M_ctrl_dc_index_inv;
  wire             M_ctrl_dc_index_inv_nxt;
  reg              M_ctrl_dc_index_nowb_inv;
  wire             M_ctrl_dc_index_nowb_inv_nxt;
  reg              M_ctrl_dc_index_wb_inv;
  wire             M_ctrl_dc_index_wb_inv_nxt;
  reg              M_ctrl_dc_nowb_inv;
  wire             M_ctrl_dc_nowb_inv_nxt;
  reg              M_ctrl_dcache_management;
  wire             M_ctrl_dcache_management_nxt;
  reg              M_ctrl_exception;
  wire             M_ctrl_exception_nxt;
  reg              M_ctrl_flush_pipe_always;
  wire             M_ctrl_flush_pipe_always_nxt;
  reg              M_ctrl_hi_imm16;
  wire             M_ctrl_hi_imm16_nxt;
  reg              M_ctrl_ignore_dst;
  wire             M_ctrl_ignore_dst_nxt;
  reg              M_ctrl_illegal;
  wire             M_ctrl_illegal_nxt;
  reg              M_ctrl_implicit_dst_eretaddr;
  wire             M_ctrl_implicit_dst_eretaddr_nxt;
  reg              M_ctrl_implicit_dst_retaddr;
  wire             M_ctrl_implicit_dst_retaddr_nxt;
  reg              M_ctrl_invalidate_i;
  wire             M_ctrl_invalidate_i_nxt;
  reg              M_ctrl_jmp_direct;
  wire             M_ctrl_jmp_direct_nxt;
  reg              M_ctrl_jmp_indirect;
  wire             M_ctrl_jmp_indirect_nxt;
  reg              M_ctrl_late_result;
  wire             M_ctrl_late_result_nxt;
  reg              M_ctrl_ld;
  reg              M_ctrl_ld16;
  wire             M_ctrl_ld16_nxt;
  reg              M_ctrl_ld32;
  wire             M_ctrl_ld32_nxt;
  reg              M_ctrl_ld8;
  reg              M_ctrl_ld8_ld16;
  wire             M_ctrl_ld8_ld16_nxt;
  wire             M_ctrl_ld8_nxt;
  reg              M_ctrl_ld_bypass;
  wire             M_ctrl_ld_bypass_nxt;
  reg              M_ctrl_ld_dcache_management;
  wire             M_ctrl_ld_dcache_management_nxt;
  reg              M_ctrl_ld_io;
  wire             M_ctrl_ld_io_nxt;
  reg              M_ctrl_ld_non_bypass;
  wire             M_ctrl_ld_non_bypass_nxt;
  reg              M_ctrl_ld_non_io;
  wire             M_ctrl_ld_non_io_nxt;
  wire             M_ctrl_ld_nxt;
  reg              M_ctrl_ld_signed;
  wire             M_ctrl_ld_signed_nxt;
  reg              M_ctrl_ld_st;
  reg              M_ctrl_ld_st_bypass;
  wire             M_ctrl_ld_st_bypass_nxt;
  reg              M_ctrl_ld_st_bypass_or_dcache_management;
  wire             M_ctrl_ld_st_bypass_or_dcache_management_nxt;
  wire             M_ctrl_ld_st_cache;
  reg              M_ctrl_ld_st_io;
  wire             M_ctrl_ld_st_io_nxt;
  reg              M_ctrl_ld_st_non_bypass;
  reg              M_ctrl_ld_st_non_bypass_non_st32;
  wire             M_ctrl_ld_st_non_bypass_non_st32_nxt;
  wire             M_ctrl_ld_st_non_bypass_nxt;
  reg              M_ctrl_ld_st_non_io;
  reg              M_ctrl_ld_st_non_io_non_st32;
  wire             M_ctrl_ld_st_non_io_non_st32_nxt;
  wire             M_ctrl_ld_st_non_io_nxt;
  reg              M_ctrl_ld_st_non_st32;
  wire             M_ctrl_ld_st_non_st32_nxt;
  wire             M_ctrl_ld_st_nxt;
  reg              M_ctrl_logic;
  wire             M_ctrl_logic_nxt;
  reg              M_ctrl_mem;
  reg              M_ctrl_mem16;
  wire             M_ctrl_mem16_nxt;
  reg              M_ctrl_mem32;
  wire             M_ctrl_mem32_nxt;
  reg              M_ctrl_mem8;
  wire             M_ctrl_mem8_nxt;
  reg              M_ctrl_mem_data_access;
  wire             M_ctrl_mem_data_access_nxt;
  wire             M_ctrl_mem_nxt;
  reg              M_ctrl_mul_lsw;
  wire             M_ctrl_mul_lsw_nxt;
  reg              M_ctrl_rdctl_inst;
  wire             M_ctrl_rdctl_inst_nxt;
  reg              M_ctrl_retaddr;
  wire             M_ctrl_retaddr_nxt;
  reg              M_ctrl_rot;
  wire             M_ctrl_rot_nxt;
  reg              M_ctrl_shift_right_arith;
  wire             M_ctrl_shift_right_arith_nxt;
  reg              M_ctrl_shift_rot;
  reg              M_ctrl_shift_rot_left;
  wire             M_ctrl_shift_rot_left_nxt;
  wire             M_ctrl_shift_rot_nxt;
  reg              M_ctrl_shift_rot_right;
  wire             M_ctrl_shift_rot_right_nxt;
  reg              M_ctrl_src2_choose_imm;
  wire             M_ctrl_src2_choose_imm_nxt;
  reg              M_ctrl_st;
  reg              M_ctrl_st16;
  wire             M_ctrl_st16_nxt;
  reg              M_ctrl_st8;
  wire             M_ctrl_st8_nxt;
  reg              M_ctrl_st_bypass;
  wire             M_ctrl_st_bypass_nxt;
  wire             M_ctrl_st_cache;
  reg              M_ctrl_st_io;
  wire             M_ctrl_st_io_nxt;
  reg              M_ctrl_st_non_bypass;
  wire             M_ctrl_st_non_bypass_nxt;
  reg              M_ctrl_st_non_io;
  wire             M_ctrl_st_non_io_nxt;
  wire             M_ctrl_st_nxt;
  reg              M_ctrl_supervisor_only;
  wire             M_ctrl_supervisor_only_nxt;
  reg              M_ctrl_uncond_cti_non_br;
  wire             M_ctrl_uncond_cti_non_br_nxt;
  reg              M_ctrl_unimp_nop;
  wire             M_ctrl_unimp_nop_nxt;
  reg              M_ctrl_unimp_trap;
  wire             M_ctrl_unimp_trap_nxt;
  reg              M_ctrl_unsigned_lo_imm16;
  wire             M_ctrl_unsigned_lo_imm16_nxt;
  reg              M_ctrl_wrctl_inst;
  wire             M_ctrl_wrctl_inst_nxt;
  wire             M_data_ram_ld_align_sign_bit;
  wire    [  1: 0] M_data_ram_ld_align_sign_bit_16;
  reg              M_data_ram_ld_align_sign_bit_16_hi;
  wire    [ 15: 0] M_dc_actual_tag;
  wire    [ 15: 0] M_dc_desired_tag;
  wire             M_dc_dirty;
  wire             M_dc_dirty_raw;
  wire             M_dc_hit;
  wire             M_dc_potential_hazard_after_st;
  wire             M_dc_potential_hazard_after_st_unfiltered;
  wire             M_dc_potential_hazard_after_st_unfiltered_is_x;
  wire    [ 31: 0] M_dc_rd_data;
  wire             M_dc_st_wr_en;
  wire    [ 17: 0] M_dc_tag_entry;
  wire             M_dc_tag_match;
  wire             M_dc_valid;
  wire             M_dc_valid_st_bypass_hit;
  wire             M_dc_valid_st_cache_hit;
  wire             M_dc_want_fill;
  wire             M_dc_want_mem_bypass_or_dcache_management;
  reg     [  4: 0] M_dst_regnum;
  wire             M_en;
  wire             M_exc_any;
  wire    [ 31: 0] M_fwd_reg_data;
  wire    [ 55: 0] M_inst;
  wire    [ 31: 0] M_inst_result;
  reg     [ 31: 0] M_iw;
  wire    [  4: 0] M_iw_a;
  wire    [  4: 0] M_iw_b;
  wire    [  4: 0] M_iw_c;
  wire    [  2: 0] M_iw_control_regnum;
  wire    [  7: 0] M_iw_custom_n;
  wire             M_iw_custom_readra;
  wire             M_iw_custom_readrb;
  wire             M_iw_custom_writerc;
  wire    [ 15: 0] M_iw_imm16;
  wire    [ 25: 0] M_iw_imm26;
  wire    [  4: 0] M_iw_imm5;
  wire    [  1: 0] M_iw_memsz;
  wire    [  5: 0] M_iw_op;
  wire    [  5: 0] M_iw_opx;
  wire    [  4: 0] M_iw_shift_imm5;
  wire    [  4: 0] M_iw_trap_break_imm5;
  wire             M_ld_align_byte1_fill;
  wire             M_ld_align_byte2_byte3_fill;
  wire             M_ld_align_sh16;
  wire             M_ld_align_sh8;
  wire             M_mem16;
  wire             M_mem32;
  wire             M_mem8;
  wire    [ 26: 0] M_mem_baddr;
  wire    [  1: 0] M_mem_baddr_byte_field;
  wire    [  5: 0] M_mem_baddr_line_field;
  wire    [  8: 0] M_mem_baddr_line_offset_field;
  wire    [  2: 0] M_mem_baddr_offset_field;
  reg     [  3: 0] M_mem_byte_en;
  wire             M_op_add;
  wire             M_op_addi;
  wire             M_op_and;
  wire             M_op_andhi;
  wire             M_op_andi;
  wire             M_op_beq;
  wire             M_op_bge;
  wire             M_op_bgeu;
  wire             M_op_blt;
  wire             M_op_bltu;
  wire             M_op_bne;
  wire             M_op_br;
  wire             M_op_break;
  wire             M_op_bret;
  wire             M_op_call;
  wire             M_op_callr;
  wire             M_op_cmpeq;
  wire             M_op_cmpeqi;
  wire             M_op_cmpge;
  wire             M_op_cmpgei;
  wire             M_op_cmpgeu;
  wire             M_op_cmpgeui;
  wire             M_op_cmplt;
  wire             M_op_cmplti;
  wire             M_op_cmpltu;
  wire             M_op_cmpltui;
  wire             M_op_cmpne;
  wire             M_op_cmpnei;
  wire             M_op_crst;
  wire             M_op_custom;
  wire             M_op_div;
  wire             M_op_divu;
  wire             M_op_eret;
  wire             M_op_flushd;
  wire             M_op_flushda;
  wire             M_op_flushi;
  wire             M_op_flushp;
  wire             M_op_fpu;
  wire             M_op_hbreak;
  wire             M_op_initd;
  wire             M_op_initda;
  wire             M_op_initi;
  wire             M_op_intr;
  wire             M_op_jmp;
  wire             M_op_jmpi;
  wire             M_op_ldb;
  wire             M_op_ldbio;
  wire             M_op_ldbu;
  wire             M_op_ldbuio;
  wire             M_op_ldh;
  wire             M_op_ldhio;
  wire             M_op_ldhu;
  wire             M_op_ldhuio;
  wire             M_op_ldl;
  wire             M_op_ldw;
  wire             M_op_ldwio;
  wire             M_op_mul;
  wire             M_op_muli;
  wire             M_op_mulxss;
  wire             M_op_mulxsu;
  wire             M_op_mulxuu;
  wire             M_op_nextpc;
  wire             M_op_nor;
  wire             M_op_opx;
  wire             M_op_or;
  wire             M_op_orhi;
  wire             M_op_ori;
  wire             M_op_rdctl;
  wire             M_op_rdprs;
  wire             M_op_ret;
  wire             M_op_rol;
  wire             M_op_roli;
  wire             M_op_ror;
  wire             M_op_rsv02;
  wire             M_op_rsv09;
  wire             M_op_rsv10;
  wire             M_op_rsv17;
  wire             M_op_rsv18;
  wire             M_op_rsv25;
  wire             M_op_rsv26;
  wire             M_op_rsv33;
  wire             M_op_rsv34;
  wire             M_op_rsv41;
  wire             M_op_rsv42;
  wire             M_op_rsv49;
  wire             M_op_rsv57;
  wire             M_op_rsv61;
  wire             M_op_rsv62;
  wire             M_op_rsv63;
  wire             M_op_rsvx00;
  wire             M_op_rsvx10;
  wire             M_op_rsvx15;
  wire             M_op_rsvx17;
  wire             M_op_rsvx21;
  wire             M_op_rsvx25;
  wire             M_op_rsvx33;
  wire             M_op_rsvx34;
  wire             M_op_rsvx35;
  wire             M_op_rsvx42;
  wire             M_op_rsvx43;
  wire             M_op_rsvx44;
  wire             M_op_rsvx47;
  wire             M_op_rsvx50;
  wire             M_op_rsvx51;
  wire             M_op_rsvx55;
  wire             M_op_rsvx56;
  wire             M_op_rsvx60;
  wire             M_op_rsvx63;
  wire             M_op_sll;
  wire             M_op_slli;
  wire             M_op_sra;
  wire             M_op_srai;
  wire             M_op_srl;
  wire             M_op_srli;
  wire             M_op_stb;
  wire             M_op_stbio;
  wire             M_op_stc;
  wire             M_op_sth;
  wire             M_op_sthio;
  wire             M_op_stw;
  wire             M_op_stwio;
  wire             M_op_sub;
  wire             M_op_sync;
  wire             M_op_trap;
  wire             M_op_wrctl;
  wire             M_op_wrprs;
  wire             M_op_xor;
  wire             M_op_xorhi;
  wire             M_op_xori;
  reg     [ 26: 0] M_pcb;
  reg              M_pipe_flush;
  wire    [ 26: 0] M_pipe_flush_baddr;
  wire    [ 26: 0] M_pipe_flush_baddr_nxt;
  wire             M_pipe_flush_nxt;
  reg     [ 24: 0] M_pipe_flush_waddr;
  wire    [ 24: 0] M_pipe_flush_waddr_nxt;
  wire    [ 31: 0] M_ram_rd_data;
  wire    [ 31: 0] M_rdctl_data;
  reg              M_regnum_a_cmp_D;
  wire             M_regnum_a_cmp_F;
  reg              M_regnum_b_cmp_D;
  wire             M_regnum_b_cmp_F;
  reg              M_rot_fill_bit;
  reg     [  7: 0] M_rot_mask;
  reg              M_rot_pass0;
  reg              M_rot_pass1;
  reg              M_rot_pass2;
  reg              M_rot_pass3;
  wire    [ 31: 0] M_rot_prestep2;
  reg     [  4: 0] M_rot_rn;
  reg              M_rot_sel_fill0;
  reg              M_rot_sel_fill1;
  reg              M_rot_sel_fill2;
  reg              M_rot_sel_fill3;
  reg     [ 31: 0] M_rot_step1;
  reg              M_sel_data_master;
  reg     [ 31: 0] M_src1;
  reg     [ 31: 0] M_src2;
  reg     [ 31: 0] M_st_data;
  wire             M_st_dc_wr_en;
  wire             M_stall;
  reg     [ 26: 0] M_target_pcb;
  wire             M_valid;
  reg              M_valid_from_E;
  reg              M_valid_mem_d1;
  wire    [ 55: 0] M_vinst;
  wire             M_wr_dst_reg;
  reg              M_wr_dst_reg_from_E;
  wire             M_wr_dst_reg_with_wrprs;
  wire             M_wrctl_bstatus;
  wire             M_wrctl_data_bstatus_reg_pie;
  wire             M_wrctl_data_estatus_reg_pie;
  wire             M_wrctl_data_ienable_reg_irq0;
  wire             M_wrctl_data_ienable_reg_irq1;
  wire             M_wrctl_data_ienable_reg_irq2;
  wire             M_wrctl_data_ienable_reg_irq3;
  wire             M_wrctl_data_ienable_reg_irq4;
  wire             M_wrctl_data_status_reg_pie;
  wire             M_wrctl_estatus;
  wire             M_wrctl_ienable;
  wire             M_wrctl_status;
  reg     [ 31: 0] Mn_rot_step2;
  reg     [ 26: 0] W_br_taken_baddr;
  reg              W_ctrl_a_not_src;
  wire             W_ctrl_a_not_src_nxt;
  reg              W_ctrl_alu_force_xor;
  wire             W_ctrl_alu_force_xor_nxt;
  reg              W_ctrl_alu_signed_comparison;
  wire             W_ctrl_alu_signed_comparison_nxt;
  reg              W_ctrl_alu_subtract;
  wire             W_ctrl_alu_subtract_nxt;
  reg              W_ctrl_b_is_dst;
  wire             W_ctrl_b_is_dst_nxt;
  reg              W_ctrl_b_not_src;
  wire             W_ctrl_b_not_src_nxt;
  reg              W_ctrl_br;
  reg              W_ctrl_br_always_pred_taken;
  wire             W_ctrl_br_always_pred_taken_nxt;
  reg              W_ctrl_br_cond;
  wire             W_ctrl_br_cond_nxt;
  wire             W_ctrl_br_nxt;
  reg              W_ctrl_br_uncond;
  wire             W_ctrl_br_uncond_nxt;
  reg              W_ctrl_break;
  wire             W_ctrl_break_nxt;
  reg              W_ctrl_cmp;
  wire             W_ctrl_cmp_nxt;
  reg              W_ctrl_crst;
  wire             W_ctrl_crst_nxt;
  reg              W_ctrl_custom_combo;
  wire             W_ctrl_custom_combo_nxt;
  reg              W_ctrl_custom_multi;
  wire             W_ctrl_custom_multi_nxt;
  reg              W_ctrl_dc_addr_inv;
  wire             W_ctrl_dc_addr_inv_nxt;
  reg              W_ctrl_dc_addr_nowb_inv;
  wire             W_ctrl_dc_addr_nowb_inv_nxt;
  reg              W_ctrl_dc_addr_wb_inv;
  wire             W_ctrl_dc_addr_wb_inv_nxt;
  reg              W_ctrl_dc_index_inv;
  wire             W_ctrl_dc_index_inv_nxt;
  reg              W_ctrl_dc_index_nowb_inv;
  wire             W_ctrl_dc_index_nowb_inv_nxt;
  reg              W_ctrl_dc_index_wb_inv;
  wire             W_ctrl_dc_index_wb_inv_nxt;
  reg              W_ctrl_dc_nowb_inv;
  wire             W_ctrl_dc_nowb_inv_nxt;
  reg              W_ctrl_dcache_management;
  wire             W_ctrl_dcache_management_nxt;
  reg              W_ctrl_exception;
  wire             W_ctrl_exception_nxt;
  reg              W_ctrl_flush_pipe_always;
  wire             W_ctrl_flush_pipe_always_nxt;
  reg              W_ctrl_hi_imm16;
  wire             W_ctrl_hi_imm16_nxt;
  reg              W_ctrl_ignore_dst;
  wire             W_ctrl_ignore_dst_nxt;
  reg              W_ctrl_illegal;
  wire             W_ctrl_illegal_nxt;
  reg              W_ctrl_implicit_dst_eretaddr;
  wire             W_ctrl_implicit_dst_eretaddr_nxt;
  reg              W_ctrl_implicit_dst_retaddr;
  wire             W_ctrl_implicit_dst_retaddr_nxt;
  reg              W_ctrl_invalidate_i;
  wire             W_ctrl_invalidate_i_nxt;
  reg              W_ctrl_jmp_direct;
  wire             W_ctrl_jmp_direct_nxt;
  reg              W_ctrl_jmp_indirect;
  wire             W_ctrl_jmp_indirect_nxt;
  reg              W_ctrl_late_result;
  wire             W_ctrl_late_result_nxt;
  reg              W_ctrl_ld;
  reg              W_ctrl_ld16;
  wire             W_ctrl_ld16_nxt;
  reg              W_ctrl_ld32;
  wire             W_ctrl_ld32_nxt;
  reg              W_ctrl_ld8;
  reg              W_ctrl_ld8_ld16;
  wire             W_ctrl_ld8_ld16_nxt;
  wire             W_ctrl_ld8_nxt;
  reg              W_ctrl_ld_dcache_management;
  wire             W_ctrl_ld_dcache_management_nxt;
  reg              W_ctrl_ld_io;
  wire             W_ctrl_ld_io_nxt;
  reg              W_ctrl_ld_non_io;
  wire             W_ctrl_ld_non_io_nxt;
  wire             W_ctrl_ld_nxt;
  reg              W_ctrl_ld_signed;
  wire             W_ctrl_ld_signed_nxt;
  reg              W_ctrl_ld_st;
  reg              W_ctrl_ld_st_io;
  wire             W_ctrl_ld_st_io_nxt;
  reg              W_ctrl_ld_st_non_io;
  reg              W_ctrl_ld_st_non_io_non_st32;
  wire             W_ctrl_ld_st_non_io_non_st32_nxt;
  wire             W_ctrl_ld_st_non_io_nxt;
  reg              W_ctrl_ld_st_non_st32;
  wire             W_ctrl_ld_st_non_st32_nxt;
  wire             W_ctrl_ld_st_nxt;
  reg              W_ctrl_logic;
  wire             W_ctrl_logic_nxt;
  reg              W_ctrl_mem;
  reg              W_ctrl_mem16;
  wire             W_ctrl_mem16_nxt;
  reg              W_ctrl_mem32;
  wire             W_ctrl_mem32_nxt;
  reg              W_ctrl_mem8;
  wire             W_ctrl_mem8_nxt;
  reg              W_ctrl_mem_data_access;
  wire             W_ctrl_mem_data_access_nxt;
  wire             W_ctrl_mem_nxt;
  reg              W_ctrl_mul_lsw;
  wire             W_ctrl_mul_lsw_nxt;
  reg              W_ctrl_rdctl_inst;
  wire             W_ctrl_rdctl_inst_nxt;
  reg              W_ctrl_retaddr;
  wire             W_ctrl_retaddr_nxt;
  reg              W_ctrl_rot;
  wire             W_ctrl_rot_nxt;
  reg              W_ctrl_shift_right_arith;
  wire             W_ctrl_shift_right_arith_nxt;
  reg              W_ctrl_shift_rot;
  reg              W_ctrl_shift_rot_left;
  wire             W_ctrl_shift_rot_left_nxt;
  wire             W_ctrl_shift_rot_nxt;
  reg              W_ctrl_shift_rot_right;
  wire             W_ctrl_shift_rot_right_nxt;
  reg              W_ctrl_src2_choose_imm;
  wire             W_ctrl_src2_choose_imm_nxt;
  reg              W_ctrl_st;
  reg              W_ctrl_st16;
  wire             W_ctrl_st16_nxt;
  reg              W_ctrl_st8;
  wire             W_ctrl_st8_nxt;
  reg              W_ctrl_st_io;
  wire             W_ctrl_st_io_nxt;
  reg              W_ctrl_st_non_io;
  wire             W_ctrl_st_non_io_nxt;
  wire             W_ctrl_st_nxt;
  reg              W_ctrl_supervisor_only;
  wire             W_ctrl_supervisor_only_nxt;
  reg              W_ctrl_uncond_cti_non_br;
  wire             W_ctrl_uncond_cti_non_br_nxt;
  reg              W_ctrl_unimp_nop;
  wire             W_ctrl_unimp_nop_nxt;
  reg              W_ctrl_unimp_trap;
  wire             W_ctrl_unimp_trap_nxt;
  reg              W_ctrl_unsigned_lo_imm16;
  wire             W_ctrl_unsigned_lo_imm16_nxt;
  reg              W_ctrl_wrctl_inst;
  wire             W_ctrl_wrctl_inst_nxt;
  reg     [  4: 0] W_dst_regnum;
  wire             W_en;
  wire    [ 55: 0] W_inst;
  reg     [ 31: 0] W_iw;
  wire    [  4: 0] W_iw_a;
  wire    [  4: 0] W_iw_b;
  wire    [  4: 0] W_iw_c;
  wire    [  2: 0] W_iw_control_regnum;
  wire    [  7: 0] W_iw_custom_n;
  wire             W_iw_custom_readra;
  wire             W_iw_custom_readrb;
  wire             W_iw_custom_writerc;
  wire    [ 15: 0] W_iw_imm16;
  wire    [ 25: 0] W_iw_imm26;
  wire    [  4: 0] W_iw_imm5;
  wire    [  1: 0] W_iw_memsz;
  wire    [  5: 0] W_iw_op;
  wire    [  5: 0] W_iw_opx;
  wire    [  4: 0] W_iw_shift_imm5;
  wire    [  4: 0] W_iw_trap_break_imm5;
  wire             W_mem16;
  wire             W_mem32;
  wire             W_mem8;
  wire             W_op_add;
  wire             W_op_addi;
  wire             W_op_and;
  wire             W_op_andhi;
  wire             W_op_andi;
  wire             W_op_beq;
  wire             W_op_bge;
  wire             W_op_bgeu;
  wire             W_op_blt;
  wire             W_op_bltu;
  wire             W_op_bne;
  wire             W_op_br;
  wire             W_op_break;
  wire             W_op_bret;
  wire             W_op_call;
  wire             W_op_callr;
  wire             W_op_cmpeq;
  wire             W_op_cmpeqi;
  wire             W_op_cmpge;
  wire             W_op_cmpgei;
  wire             W_op_cmpgeu;
  wire             W_op_cmpgeui;
  wire             W_op_cmplt;
  wire             W_op_cmplti;
  wire             W_op_cmpltu;
  wire             W_op_cmpltui;
  wire             W_op_cmpne;
  wire             W_op_cmpnei;
  wire             W_op_crst;
  wire             W_op_custom;
  wire             W_op_div;
  wire             W_op_divu;
  wire             W_op_eret;
  wire             W_op_flushd;
  wire             W_op_flushda;
  wire             W_op_flushi;
  wire             W_op_flushp;
  wire             W_op_fpu;
  wire             W_op_hbreak;
  wire             W_op_initd;
  wire             W_op_initda;
  wire             W_op_initi;
  wire             W_op_intr;
  wire             W_op_jmp;
  wire             W_op_jmpi;
  wire             W_op_ldb;
  wire             W_op_ldbio;
  wire             W_op_ldbu;
  wire             W_op_ldbuio;
  wire             W_op_ldh;
  wire             W_op_ldhio;
  wire             W_op_ldhu;
  wire             W_op_ldhuio;
  wire             W_op_ldl;
  wire             W_op_ldw;
  wire             W_op_ldwio;
  wire             W_op_mul;
  wire             W_op_muli;
  wire             W_op_mulxss;
  wire             W_op_mulxsu;
  wire             W_op_mulxuu;
  wire             W_op_nextpc;
  wire             W_op_nor;
  wire             W_op_opx;
  wire             W_op_or;
  wire             W_op_orhi;
  wire             W_op_ori;
  wire             W_op_rdctl;
  wire             W_op_rdprs;
  wire             W_op_ret;
  wire             W_op_rol;
  wire             W_op_roli;
  wire             W_op_ror;
  wire             W_op_rsv02;
  wire             W_op_rsv09;
  wire             W_op_rsv10;
  wire             W_op_rsv17;
  wire             W_op_rsv18;
  wire             W_op_rsv25;
  wire             W_op_rsv26;
  wire             W_op_rsv33;
  wire             W_op_rsv34;
  wire             W_op_rsv41;
  wire             W_op_rsv42;
  wire             W_op_rsv49;
  wire             W_op_rsv57;
  wire             W_op_rsv61;
  wire             W_op_rsv62;
  wire             W_op_rsv63;
  wire             W_op_rsvx00;
  wire             W_op_rsvx10;
  wire             W_op_rsvx15;
  wire             W_op_rsvx17;
  wire             W_op_rsvx21;
  wire             W_op_rsvx25;
  wire             W_op_rsvx33;
  wire             W_op_rsvx34;
  wire             W_op_rsvx35;
  wire             W_op_rsvx42;
  wire             W_op_rsvx43;
  wire             W_op_rsvx44;
  wire             W_op_rsvx47;
  wire             W_op_rsvx50;
  wire             W_op_rsvx51;
  wire             W_op_rsvx55;
  wire             W_op_rsvx56;
  wire             W_op_rsvx60;
  wire             W_op_rsvx63;
  wire             W_op_sll;
  wire             W_op_slli;
  wire             W_op_sra;
  wire             W_op_srai;
  wire             W_op_srl;
  wire             W_op_srli;
  wire             W_op_stb;
  wire             W_op_stbio;
  wire             W_op_stc;
  wire             W_op_sth;
  wire             W_op_sthio;
  wire             W_op_stw;
  wire             W_op_stwio;
  wire             W_op_sub;
  wire             W_op_sync;
  wire             W_op_trap;
  wire             W_op_wrctl;
  wire             W_op_wrprs;
  wire             W_op_xor;
  wire             W_op_xorhi;
  wire             W_op_xori;
  reg     [ 26: 0] W_pcb;
  reg              W_regnum_a_cmp_D;
  reg              W_regnum_b_cmp_D;
  reg              W_valid;
  wire    [ 55: 0] W_vinst;
  reg     [ 31: 0] W_wr_data;
  reg              W_wr_dst_reg;
  wire             av_addr_accepted;
  wire             av_rd_addr_accepted;
  wire             av_wr_data_transfer;
  reg              clr_break_line;
  wire    [ 26: 0] d_address;
  reg     [  1: 0] d_address_byte_field;
  wire    [  1: 0] d_address_byte_field_nxt;
  reg     [  5: 0] d_address_line_field;
  wire    [  5: 0] d_address_line_field_nxt;
  reg     [  2: 0] d_address_offset_field;
  wire    [  2: 0] d_address_offset_field_nxt;
  reg     [ 15: 0] d_address_tag_field;
  wire    [ 15: 0] d_address_tag_field_nxt;
  reg     [  3: 0] d_byteenable;
  wire    [  3: 0] d_byteenable_nxt;
  reg              d_read;
  wire             d_read_nxt;
  reg     [ 31: 0] d_readdata_d1;
  reg              d_readdatavalid_d1;
  reg              d_write;
  wire             d_write_nxt;
  reg     [ 31: 0] d_writedata;
  wire    [ 31: 0] d_writedata_nxt;
  wire    [  8: 0] dc_data_rd_port_addr;
  wire    [ 31: 0] dc_data_rd_port_data;
  wire    [  5: 0] dc_data_rd_port_line_field;
  wire    [  2: 0] dc_data_rd_port_offset_field;
  wire    [  8: 0] dc_data_wr_port_addr;
  wire    [  3: 0] dc_data_wr_port_byte_en;
  wire    [ 31: 0] dc_data_wr_port_data;
  wire             dc_data_wr_port_en;
  wire             dc_line_dirty_off;
  wire             dc_line_dirty_on;
  wire             dc_line_valid_off;
  wire             dc_line_valid_on;
  wire    [  5: 0] dc_tag_rd_port_addr;
  wire    [ 17: 0] dc_tag_rd_port_data;
  wire    [  5: 0] dc_tag_wr_port_addr;
  wire    [ 17: 0] dc_tag_wr_port_data;
  wire             dc_tag_wr_port_en;
  reg              hbreak_enabled;
  wire             hbreak_req;
  wire    [ 26: 0] i_address;
  reg              i_read;
  wire             i_read_nxt;
  reg     [ 31: 0] i_readdata_d1;
  reg              i_readdatavalid_d1;
  wire             ic_bypass_active;
  wire             ic_data_rden;
  wire             ic_data_wren;
  reg              ic_fill_active;
  wire             ic_fill_active_nxt;
  reg     [  3: 0] ic_fill_ap_cnt;
  wire    [  3: 0] ic_fill_ap_cnt_nxt;
  wire             ic_fill_ap_last_word;
  reg     [  2: 0] ic_fill_ap_offset;
  wire    [  2: 0] ic_fill_ap_offset_nxt;
  wire             ic_fill_done;
  wire             ic_fill_dp_last_word;
  reg     [  2: 0] ic_fill_dp_offset;
  wire             ic_fill_dp_offset_en;
  wire    [  2: 0] ic_fill_dp_offset_nxt;
  reg     [  2: 0] ic_fill_initial_offset;
  reg     [  6: 0] ic_fill_line;
  reg              ic_fill_prevent_refill;
  wire             ic_fill_prevent_refill_nxt;
  wire             ic_fill_req_accepted;
  reg     [ 14: 0] ic_fill_tag;
  wire    [  7: 0] ic_fill_valid_bit_new;
  reg     [  7: 0] ic_fill_valid_bits;
  wire             ic_fill_valid_bits_en;
  wire    [  7: 0] ic_fill_valid_bits_nxt;
  reg              ic_tag_clr_valid_bits;
  wire             ic_tag_clr_valid_bits_nxt;
  wire             ic_tag_rden;
  reg     [  6: 0] ic_tag_wraddress;
  wire    [  6: 0] ic_tag_wraddress_nxt;
  wire    [ 22: 0] ic_tag_wrdata;
  wire             ic_tag_wren;
  wire             jtag_debug_module_clk;
  wire             jtag_debug_module_debugaccess_to_roms;
  wire    [ 31: 0] jtag_debug_module_readdata;
  wire             jtag_debug_module_reset;
  wire             jtag_debug_module_resetrequest;
  wire             jtag_debug_module_waitrequest;
  reg              latched_oci_tb_hbreak_req;
  wire             latched_oci_tb_hbreak_req_next;
  wire             norm_intr_req;
  wire             oci_hbreak_req;
  wire    [ 31: 0] oci_ienable;
  wire             oci_single_step_mode;
  wire             oci_tb_hbreak_req;
  wire             test_ending;
  wire             test_has_ended;
  reg              wait_for_one_post_bret_inst;
  //the_sopc_nios2_0_test_bench, which is an e_instance
  sopc_nios2_0_test_bench the_sopc_nios2_0_test_bench
    (
      .A_bstatus_reg                        (A_bstatus_reg),
      .A_ctrl_ld_non_bypass                 (A_ctrl_ld_non_bypass),
      .A_en                                 (A_en),
      .A_estatus_reg                        (A_estatus_reg),
      .A_status_reg                         (A_status_reg),
      .A_valid                              (A_valid),
      .A_wr_data_filtered                   (A_wr_data_filtered),
      .A_wr_data_unfiltered                 (A_wr_data_unfiltered),
      .A_wr_dst_reg                         (A_wr_dst_reg),
      .E_add_br_to_taken_history_filtered   (E_add_br_to_taken_history_filtered),
      .E_add_br_to_taken_history_unfiltered (E_add_br_to_taken_history_unfiltered),
      .E_logic_result                       (E_logic_result),
      .E_src1_eq_src2                       (E_src1_eq_src2),
      .E_valid                              (E_valid),
      .M_bht_ptr_filtered                   (M_bht_ptr_filtered),
      .M_bht_ptr_unfiltered                 (M_bht_ptr_unfiltered),
      .M_bht_wr_data_filtered               (M_bht_wr_data_filtered),
      .M_bht_wr_data_unfiltered             (M_bht_wr_data_unfiltered),
      .M_bht_wr_en_filtered                 (M_bht_wr_en_filtered),
      .M_bht_wr_en_unfiltered               (M_bht_wr_en_unfiltered),
      .M_mem_baddr                          (M_mem_baddr),
      .M_target_pcb                         (M_target_pcb),
      .M_valid                              (M_valid),
      .W_dst_regnum                         (W_dst_regnum),
      .W_iw                                 (W_iw),
      .W_iw_op                              (W_iw_op),
      .W_iw_opx                             (W_iw_opx),
      .W_pcb                                (W_pcb),
      .W_valid                              (W_valid),
      .W_vinst                              (W_vinst),
      .W_wr_dst_reg                         (W_wr_dst_reg),
      .clk                                  (clk),
      .d_address                            (d_address),
      .d_byteenable                         (d_byteenable),
      .d_read                               (d_read),
      .d_write                              (d_write),
      .i_address                            (i_address),
      .i_read                               (i_read),
      .i_readdatavalid                      (i_readdatavalid),
      .reset_n                              (reset_n),
      .test_has_ended                       (test_has_ended)
    );

  assign F_iw_a = F_iw[31 : 27];
  assign F_iw_b = F_iw[26 : 22];
  assign F_iw_c = F_iw[21 : 17];
  assign F_iw_custom_n = F_iw[13 : 6];
  assign F_iw_custom_readra = F_iw[16];
  assign F_iw_custom_readrb = F_iw[15];
  assign F_iw_custom_writerc = F_iw[14];
  assign F_iw_opx = F_iw[16 : 11];
  assign F_iw_op = F_iw[5 : 0];
  assign F_iw_shift_imm5 = F_iw[10 : 6];
  assign F_iw_trap_break_imm5 = F_iw[10 : 6];
  assign F_iw_imm5 = F_iw[10 : 6];
  assign F_iw_imm16 = F_iw[21 : 6];
  assign F_iw_imm26 = F_iw[31 : 6];
  assign F_iw_memsz = F_iw[4 : 3];
  assign F_iw_control_regnum = F_iw[8 : 6];
  assign F_mem8 = F_iw_memsz == 2'b00;
  assign F_mem16 = F_iw_memsz == 2'b01;
  assign F_mem32 = F_iw_memsz[1] == 1'b1;
  assign F_ram_iw_a = F_ram_iw[31 : 27];
  assign F_ram_iw_b = F_ram_iw[26 : 22];
  assign F_ram_iw_c = F_ram_iw[21 : 17];
  assign F_ram_iw_custom_n = F_ram_iw[13 : 6];
  assign F_ram_iw_custom_readra = F_ram_iw[16];
  assign F_ram_iw_custom_readrb = F_ram_iw[15];
  assign F_ram_iw_custom_writerc = F_ram_iw[14];
  assign F_ram_iw_opx = F_ram_iw[16 : 11];
  assign F_ram_iw_op = F_ram_iw[5 : 0];
  assign F_ram_iw_shift_imm5 = F_ram_iw[10 : 6];
  assign F_ram_iw_trap_break_imm5 = F_ram_iw[10 : 6];
  assign F_ram_iw_imm5 = F_ram_iw[10 : 6];
  assign F_ram_iw_imm16 = F_ram_iw[21 : 6];
  assign F_ram_iw_imm26 = F_ram_iw[31 : 6];
  assign F_ram_iw_memsz = F_ram_iw[4 : 3];
  assign F_ram_iw_control_regnum = F_ram_iw[8 : 6];
  assign F_ram_mem8 = F_ram_iw_memsz == 2'b00;
  assign F_ram_mem16 = F_ram_iw_memsz == 2'b01;
  assign F_ram_mem32 = F_ram_iw_memsz[1] == 1'b1;
  assign D_iw_a = D_iw[31 : 27];
  assign D_iw_b = D_iw[26 : 22];
  assign D_iw_c = D_iw[21 : 17];
  assign D_iw_custom_n = D_iw[13 : 6];
  assign D_iw_custom_readra = D_iw[16];
  assign D_iw_custom_readrb = D_iw[15];
  assign D_iw_custom_writerc = D_iw[14];
  assign D_iw_opx = D_iw[16 : 11];
  assign D_iw_op = D_iw[5 : 0];
  assign D_iw_shift_imm5 = D_iw[10 : 6];
  assign D_iw_trap_break_imm5 = D_iw[10 : 6];
  assign D_iw_imm5 = D_iw[10 : 6];
  assign D_iw_imm16 = D_iw[21 : 6];
  assign D_iw_imm26 = D_iw[31 : 6];
  assign D_iw_memsz = D_iw[4 : 3];
  assign D_iw_control_regnum = D_iw[8 : 6];
  assign D_mem8 = D_iw_memsz == 2'b00;
  assign D_mem16 = D_iw_memsz == 2'b01;
  assign D_mem32 = D_iw_memsz[1] == 1'b1;
  assign E_iw_a = E_iw[31 : 27];
  assign E_iw_b = E_iw[26 : 22];
  assign E_iw_c = E_iw[21 : 17];
  assign E_iw_custom_n = E_iw[13 : 6];
  assign E_iw_custom_readra = E_iw[16];
  assign E_iw_custom_readrb = E_iw[15];
  assign E_iw_custom_writerc = E_iw[14];
  assign E_iw_opx = E_iw[16 : 11];
  assign E_iw_op = E_iw[5 : 0];
  assign E_iw_shift_imm5 = E_iw[10 : 6];
  assign E_iw_trap_break_imm5 = E_iw[10 : 6];
  assign E_iw_imm5 = E_iw[10 : 6];
  assign E_iw_imm16 = E_iw[21 : 6];
  assign E_iw_imm26 = E_iw[31 : 6];
  assign E_iw_memsz = E_iw[4 : 3];
  assign E_iw_control_regnum = E_iw[8 : 6];
  assign E_mem8 = E_iw_memsz == 2'b00;
  assign E_mem16 = E_iw_memsz == 2'b01;
  assign E_mem32 = E_iw_memsz[1] == 1'b1;
  assign M_iw_a = M_iw[31 : 27];
  assign M_iw_b = M_iw[26 : 22];
  assign M_iw_c = M_iw[21 : 17];
  assign M_iw_custom_n = M_iw[13 : 6];
  assign M_iw_custom_readra = M_iw[16];
  assign M_iw_custom_readrb = M_iw[15];
  assign M_iw_custom_writerc = M_iw[14];
  assign M_iw_opx = M_iw[16 : 11];
  assign M_iw_op = M_iw[5 : 0];
  assign M_iw_shift_imm5 = M_iw[10 : 6];
  assign M_iw_trap_break_imm5 = M_iw[10 : 6];
  assign M_iw_imm5 = M_iw[10 : 6];
  assign M_iw_imm16 = M_iw[21 : 6];
  assign M_iw_imm26 = M_iw[31 : 6];
  assign M_iw_memsz = M_iw[4 : 3];
  assign M_iw_control_regnum = M_iw[8 : 6];
  assign M_mem8 = M_iw_memsz == 2'b00;
  assign M_mem16 = M_iw_memsz == 2'b01;
  assign M_mem32 = M_iw_memsz[1] == 1'b1;
  assign A_iw_a = A_iw[31 : 27];
  assign A_iw_b = A_iw[26 : 22];
  assign A_iw_c = A_iw[21 : 17];
  assign A_iw_custom_n = A_iw[13 : 6];
  assign A_iw_custom_readra = A_iw[16];
  assign A_iw_custom_readrb = A_iw[15];
  assign A_iw_custom_writerc = A_iw[14];
  assign A_iw_opx = A_iw[16 : 11];
  assign A_iw_op = A_iw[5 : 0];
  assign A_iw_shift_imm5 = A_iw[10 : 6];
  assign A_iw_trap_break_imm5 = A_iw[10 : 6];
  assign A_iw_imm5 = A_iw[10 : 6];
  assign A_iw_imm16 = A_iw[21 : 6];
  assign A_iw_imm26 = A_iw[31 : 6];
  assign A_iw_memsz = A_iw[4 : 3];
  assign A_iw_control_regnum = A_iw[8 : 6];
  assign A_mem8 = A_iw_memsz == 2'b00;
  assign A_mem16 = A_iw_memsz == 2'b01;
  assign A_mem32 = A_iw_memsz[1] == 1'b1;
  assign W_iw_a = W_iw[31 : 27];
  assign W_iw_b = W_iw[26 : 22];
  assign W_iw_c = W_iw[21 : 17];
  assign W_iw_custom_n = W_iw[13 : 6];
  assign W_iw_custom_readra = W_iw[16];
  assign W_iw_custom_readrb = W_iw[15];
  assign W_iw_custom_writerc = W_iw[14];
  assign W_iw_opx = W_iw[16 : 11];
  assign W_iw_op = W_iw[5 : 0];
  assign W_iw_shift_imm5 = W_iw[10 : 6];
  assign W_iw_trap_break_imm5 = W_iw[10 : 6];
  assign W_iw_imm5 = W_iw[10 : 6];
  assign W_iw_imm16 = W_iw[21 : 6];
  assign W_iw_imm26 = W_iw[31 : 6];
  assign W_iw_memsz = W_iw[4 : 3];
  assign W_iw_control_regnum = W_iw[8 : 6];
  assign W_mem8 = W_iw_memsz == 2'b00;
  assign W_mem16 = W_iw_memsz == 2'b01;
  assign W_mem32 = W_iw_memsz[1] == 1'b1;
  assign F_op_call = F_iw_op == 0;
  assign F_op_jmpi = F_iw_op == 1;
  assign F_op_ldbu = F_iw_op == 3;
  assign F_op_addi = F_iw_op == 4;
  assign F_op_stb = F_iw_op == 5;
  assign F_op_br = F_iw_op == 6;
  assign F_op_ldb = F_iw_op == 7;
  assign F_op_cmpgei = F_iw_op == 8;
  assign F_op_ldhu = F_iw_op == 11;
  assign F_op_andi = F_iw_op == 12;
  assign F_op_sth = F_iw_op == 13;
  assign F_op_bge = F_iw_op == 14;
  assign F_op_ldh = F_iw_op == 15;
  assign F_op_cmplti = F_iw_op == 16;
  assign F_op_initda = F_iw_op == 19;
  assign F_op_ori = F_iw_op == 20;
  assign F_op_stw = F_iw_op == 21;
  assign F_op_blt = F_iw_op == 22;
  assign F_op_ldw = F_iw_op == 23;
  assign F_op_cmpnei = F_iw_op == 24;
  assign F_op_flushda = F_iw_op == 27;
  assign F_op_xori = F_iw_op == 28;
  assign F_op_stc = F_iw_op == 29;
  assign F_op_bne = F_iw_op == 30;
  assign F_op_ldl = F_iw_op == 31;
  assign F_op_cmpeqi = F_iw_op == 32;
  assign F_op_ldbuio = F_iw_op == 35;
  assign F_op_muli = F_iw_op == 36;
  assign F_op_stbio = F_iw_op == 37;
  assign F_op_beq = F_iw_op == 38;
  assign F_op_ldbio = F_iw_op == 39;
  assign F_op_cmpgeui = F_iw_op == 40;
  assign F_op_ldhuio = F_iw_op == 43;
  assign F_op_andhi = F_iw_op == 44;
  assign F_op_sthio = F_iw_op == 45;
  assign F_op_bgeu = F_iw_op == 46;
  assign F_op_ldhio = F_iw_op == 47;
  assign F_op_cmpltui = F_iw_op == 48;
  assign F_op_initd = F_iw_op == 51;
  assign F_op_orhi = F_iw_op == 52;
  assign F_op_stwio = F_iw_op == 53;
  assign F_op_bltu = F_iw_op == 54;
  assign F_op_ldwio = F_iw_op == 55;
  assign F_op_rdprs = F_iw_op == 56;
  assign F_op_flushd = F_iw_op == 59;
  assign F_op_xorhi = F_iw_op == 60;
  assign F_op_rsv02 = F_iw_op == 2;
  assign F_op_rsv09 = F_iw_op == 9;
  assign F_op_rsv10 = F_iw_op == 10;
  assign F_op_rsv17 = F_iw_op == 17;
  assign F_op_rsv18 = F_iw_op == 18;
  assign F_op_rsv25 = F_iw_op == 25;
  assign F_op_rsv26 = F_iw_op == 26;
  assign F_op_rsv33 = F_iw_op == 33;
  assign F_op_rsv34 = F_iw_op == 34;
  assign F_op_rsv41 = F_iw_op == 41;
  assign F_op_rsv42 = F_iw_op == 42;
  assign F_op_rsv49 = F_iw_op == 49;
  assign F_op_rsv57 = F_iw_op == 57;
  assign F_op_rsv61 = F_iw_op == 61;
  assign F_op_rsv62 = F_iw_op == 62;
  assign F_op_rsv63 = F_iw_op == 63;
  assign F_op_eret = F_op_opx & (F_iw_opx == 1);
  assign F_op_roli = F_op_opx & (F_iw_opx == 2);
  assign F_op_rol = F_op_opx & (F_iw_opx == 3);
  assign F_op_flushp = F_op_opx & (F_iw_opx == 4);
  assign F_op_ret = F_op_opx & (F_iw_opx == 5);
  assign F_op_nor = F_op_opx & (F_iw_opx == 6);
  assign F_op_mulxuu = F_op_opx & (F_iw_opx == 7);
  assign F_op_cmpge = F_op_opx & (F_iw_opx == 8);
  assign F_op_bret = F_op_opx & (F_iw_opx == 9);
  assign F_op_ror = F_op_opx & (F_iw_opx == 11);
  assign F_op_flushi = F_op_opx & (F_iw_opx == 12);
  assign F_op_jmp = F_op_opx & (F_iw_opx == 13);
  assign F_op_and = F_op_opx & (F_iw_opx == 14);
  assign F_op_cmplt = F_op_opx & (F_iw_opx == 16);
  assign F_op_slli = F_op_opx & (F_iw_opx == 18);
  assign F_op_sll = F_op_opx & (F_iw_opx == 19);
  assign F_op_wrprs = F_op_opx & (F_iw_opx == 20);
  assign F_op_or = F_op_opx & (F_iw_opx == 22);
  assign F_op_mulxsu = F_op_opx & (F_iw_opx == 23);
  assign F_op_cmpne = F_op_opx & (F_iw_opx == 24);
  assign F_op_srli = F_op_opx & (F_iw_opx == 26);
  assign F_op_srl = F_op_opx & (F_iw_opx == 27);
  assign F_op_nextpc = F_op_opx & (F_iw_opx == 28);
  assign F_op_callr = F_op_opx & (F_iw_opx == 29);
  assign F_op_xor = F_op_opx & (F_iw_opx == 30);
  assign F_op_mulxss = F_op_opx & (F_iw_opx == 31);
  assign F_op_cmpeq = F_op_opx & (F_iw_opx == 32);
  assign F_op_divu = F_op_opx & (F_iw_opx == 36);
  assign F_op_div = F_op_opx & (F_iw_opx == 37);
  assign F_op_rdctl = F_op_opx & (F_iw_opx == 38);
  assign F_op_mul = F_op_opx & (F_iw_opx == 39);
  assign F_op_cmpgeu = F_op_opx & (F_iw_opx == 40);
  assign F_op_initi = F_op_opx & (F_iw_opx == 41);
  assign F_op_trap = F_op_opx & (F_iw_opx == 45);
  assign F_op_wrctl = F_op_opx & (F_iw_opx == 46);
  assign F_op_cmpltu = F_op_opx & (F_iw_opx == 48);
  assign F_op_add = F_op_opx & (F_iw_opx == 49);
  assign F_op_break = F_op_opx & (F_iw_opx == 52);
  assign F_op_hbreak = F_op_opx & (F_iw_opx == 53);
  assign F_op_sync = F_op_opx & (F_iw_opx == 54);
  assign F_op_sub = F_op_opx & (F_iw_opx == 57);
  assign F_op_srai = F_op_opx & (F_iw_opx == 58);
  assign F_op_sra = F_op_opx & (F_iw_opx == 59);
  assign F_op_intr = F_op_opx & (F_iw_opx == 61);
  assign F_op_crst = F_op_opx & (F_iw_opx == 62);
  assign F_op_rsvx00 = F_op_opx & (F_iw_opx == 0);
  assign F_op_rsvx10 = F_op_opx & (F_iw_opx == 10);
  assign F_op_rsvx15 = F_op_opx & (F_iw_opx == 15);
  assign F_op_rsvx17 = F_op_opx & (F_iw_opx == 17);
  assign F_op_rsvx21 = F_op_opx & (F_iw_opx == 21);
  assign F_op_rsvx25 = F_op_opx & (F_iw_opx == 25);
  assign F_op_rsvx33 = F_op_opx & (F_iw_opx == 33);
  assign F_op_rsvx34 = F_op_opx & (F_iw_opx == 34);
  assign F_op_rsvx35 = F_op_opx & (F_iw_opx == 35);
  assign F_op_rsvx42 = F_op_opx & (F_iw_opx == 42);
  assign F_op_rsvx43 = F_op_opx & (F_iw_opx == 43);
  assign F_op_rsvx44 = F_op_opx & (F_iw_opx == 44);
  assign F_op_rsvx47 = F_op_opx & (F_iw_opx == 47);
  assign F_op_rsvx50 = F_op_opx & (F_iw_opx == 50);
  assign F_op_rsvx51 = F_op_opx & (F_iw_opx == 51);
  assign F_op_rsvx55 = F_op_opx & (F_iw_opx == 55);
  assign F_op_rsvx56 = F_op_opx & (F_iw_opx == 56);
  assign F_op_rsvx60 = F_op_opx & (F_iw_opx == 60);
  assign F_op_rsvx63 = F_op_opx & (F_iw_opx == 63);
  assign F_op_fpu = F_op_custom & 1'b1;
  assign F_op_opx = F_iw_op == 58;
  assign F_op_custom = F_iw_op == 50;
  assign D_op_call = D_iw_op == 0;
  assign D_op_jmpi = D_iw_op == 1;
  assign D_op_ldbu = D_iw_op == 3;
  assign D_op_addi = D_iw_op == 4;
  assign D_op_stb = D_iw_op == 5;
  assign D_op_br = D_iw_op == 6;
  assign D_op_ldb = D_iw_op == 7;
  assign D_op_cmpgei = D_iw_op == 8;
  assign D_op_ldhu = D_iw_op == 11;
  assign D_op_andi = D_iw_op == 12;
  assign D_op_sth = D_iw_op == 13;
  assign D_op_bge = D_iw_op == 14;
  assign D_op_ldh = D_iw_op == 15;
  assign D_op_cmplti = D_iw_op == 16;
  assign D_op_initda = D_iw_op == 19;
  assign D_op_ori = D_iw_op == 20;
  assign D_op_stw = D_iw_op == 21;
  assign D_op_blt = D_iw_op == 22;
  assign D_op_ldw = D_iw_op == 23;
  assign D_op_cmpnei = D_iw_op == 24;
  assign D_op_flushda = D_iw_op == 27;
  assign D_op_xori = D_iw_op == 28;
  assign D_op_stc = D_iw_op == 29;
  assign D_op_bne = D_iw_op == 30;
  assign D_op_ldl = D_iw_op == 31;
  assign D_op_cmpeqi = D_iw_op == 32;
  assign D_op_ldbuio = D_iw_op == 35;
  assign D_op_muli = D_iw_op == 36;
  assign D_op_stbio = D_iw_op == 37;
  assign D_op_beq = D_iw_op == 38;
  assign D_op_ldbio = D_iw_op == 39;
  assign D_op_cmpgeui = D_iw_op == 40;
  assign D_op_ldhuio = D_iw_op == 43;
  assign D_op_andhi = D_iw_op == 44;
  assign D_op_sthio = D_iw_op == 45;
  assign D_op_bgeu = D_iw_op == 46;
  assign D_op_ldhio = D_iw_op == 47;
  assign D_op_cmpltui = D_iw_op == 48;
  assign D_op_initd = D_iw_op == 51;
  assign D_op_orhi = D_iw_op == 52;
  assign D_op_stwio = D_iw_op == 53;
  assign D_op_bltu = D_iw_op == 54;
  assign D_op_ldwio = D_iw_op == 55;
  assign D_op_rdprs = D_iw_op == 56;
  assign D_op_flushd = D_iw_op == 59;
  assign D_op_xorhi = D_iw_op == 60;
  assign D_op_rsv02 = D_iw_op == 2;
  assign D_op_rsv09 = D_iw_op == 9;
  assign D_op_rsv10 = D_iw_op == 10;
  assign D_op_rsv17 = D_iw_op == 17;
  assign D_op_rsv18 = D_iw_op == 18;
  assign D_op_rsv25 = D_iw_op == 25;
  assign D_op_rsv26 = D_iw_op == 26;
  assign D_op_rsv33 = D_iw_op == 33;
  assign D_op_rsv34 = D_iw_op == 34;
  assign D_op_rsv41 = D_iw_op == 41;
  assign D_op_rsv42 = D_iw_op == 42;
  assign D_op_rsv49 = D_iw_op == 49;
  assign D_op_rsv57 = D_iw_op == 57;
  assign D_op_rsv61 = D_iw_op == 61;
  assign D_op_rsv62 = D_iw_op == 62;
  assign D_op_rsv63 = D_iw_op == 63;
  assign D_op_eret = D_op_opx & (D_iw_opx == 1);
  assign D_op_roli = D_op_opx & (D_iw_opx == 2);
  assign D_op_rol = D_op_opx & (D_iw_opx == 3);
  assign D_op_flushp = D_op_opx & (D_iw_opx == 4);
  assign D_op_ret = D_op_opx & (D_iw_opx == 5);
  assign D_op_nor = D_op_opx & (D_iw_opx == 6);
  assign D_op_mulxuu = D_op_opx & (D_iw_opx == 7);
  assign D_op_cmpge = D_op_opx & (D_iw_opx == 8);
  assign D_op_bret = D_op_opx & (D_iw_opx == 9);
  assign D_op_ror = D_op_opx & (D_iw_opx == 11);
  assign D_op_flushi = D_op_opx & (D_iw_opx == 12);
  assign D_op_jmp = D_op_opx & (D_iw_opx == 13);
  assign D_op_and = D_op_opx & (D_iw_opx == 14);
  assign D_op_cmplt = D_op_opx & (D_iw_opx == 16);
  assign D_op_slli = D_op_opx & (D_iw_opx == 18);
  assign D_op_sll = D_op_opx & (D_iw_opx == 19);
  assign D_op_wrprs = D_op_opx & (D_iw_opx == 20);
  assign D_op_or = D_op_opx & (D_iw_opx == 22);
  assign D_op_mulxsu = D_op_opx & (D_iw_opx == 23);
  assign D_op_cmpne = D_op_opx & (D_iw_opx == 24);
  assign D_op_srli = D_op_opx & (D_iw_opx == 26);
  assign D_op_srl = D_op_opx & (D_iw_opx == 27);
  assign D_op_nextpc = D_op_opx & (D_iw_opx == 28);
  assign D_op_callr = D_op_opx & (D_iw_opx == 29);
  assign D_op_xor = D_op_opx & (D_iw_opx == 30);
  assign D_op_mulxss = D_op_opx & (D_iw_opx == 31);
  assign D_op_cmpeq = D_op_opx & (D_iw_opx == 32);
  assign D_op_divu = D_op_opx & (D_iw_opx == 36);
  assign D_op_div = D_op_opx & (D_iw_opx == 37);
  assign D_op_rdctl = D_op_opx & (D_iw_opx == 38);
  assign D_op_mul = D_op_opx & (D_iw_opx == 39);
  assign D_op_cmpgeu = D_op_opx & (D_iw_opx == 40);
  assign D_op_initi = D_op_opx & (D_iw_opx == 41);
  assign D_op_trap = D_op_opx & (D_iw_opx == 45);
  assign D_op_wrctl = D_op_opx & (D_iw_opx == 46);
  assign D_op_cmpltu = D_op_opx & (D_iw_opx == 48);
  assign D_op_add = D_op_opx & (D_iw_opx == 49);
  assign D_op_break = D_op_opx & (D_iw_opx == 52);
  assign D_op_hbreak = D_op_opx & (D_iw_opx == 53);
  assign D_op_sync = D_op_opx & (D_iw_opx == 54);
  assign D_op_sub = D_op_opx & (D_iw_opx == 57);
  assign D_op_srai = D_op_opx & (D_iw_opx == 58);
  assign D_op_sra = D_op_opx & (D_iw_opx == 59);
  assign D_op_intr = D_op_opx & (D_iw_opx == 61);
  assign D_op_crst = D_op_opx & (D_iw_opx == 62);
  assign D_op_rsvx00 = D_op_opx & (D_iw_opx == 0);
  assign D_op_rsvx10 = D_op_opx & (D_iw_opx == 10);
  assign D_op_rsvx15 = D_op_opx & (D_iw_opx == 15);
  assign D_op_rsvx17 = D_op_opx & (D_iw_opx == 17);
  assign D_op_rsvx21 = D_op_opx & (D_iw_opx == 21);
  assign D_op_rsvx25 = D_op_opx & (D_iw_opx == 25);
  assign D_op_rsvx33 = D_op_opx & (D_iw_opx == 33);
  assign D_op_rsvx34 = D_op_opx & (D_iw_opx == 34);
  assign D_op_rsvx35 = D_op_opx & (D_iw_opx == 35);
  assign D_op_rsvx42 = D_op_opx & (D_iw_opx == 42);
  assign D_op_rsvx43 = D_op_opx & (D_iw_opx == 43);
  assign D_op_rsvx44 = D_op_opx & (D_iw_opx == 44);
  assign D_op_rsvx47 = D_op_opx & (D_iw_opx == 47);
  assign D_op_rsvx50 = D_op_opx & (D_iw_opx == 50);
  assign D_op_rsvx51 = D_op_opx & (D_iw_opx == 51);
  assign D_op_rsvx55 = D_op_opx & (D_iw_opx == 55);
  assign D_op_rsvx56 = D_op_opx & (D_iw_opx == 56);
  assign D_op_rsvx60 = D_op_opx & (D_iw_opx == 60);
  assign D_op_rsvx63 = D_op_opx & (D_iw_opx == 63);
  assign D_op_fpu = D_op_custom & 1'b1;
  assign D_op_opx = D_iw_op == 58;
  assign D_op_custom = D_iw_op == 50;
  assign E_op_call = E_iw_op == 0;
  assign E_op_jmpi = E_iw_op == 1;
  assign E_op_ldbu = E_iw_op == 3;
  assign E_op_addi = E_iw_op == 4;
  assign E_op_stb = E_iw_op == 5;
  assign E_op_br = E_iw_op == 6;
  assign E_op_ldb = E_iw_op == 7;
  assign E_op_cmpgei = E_iw_op == 8;
  assign E_op_ldhu = E_iw_op == 11;
  assign E_op_andi = E_iw_op == 12;
  assign E_op_sth = E_iw_op == 13;
  assign E_op_bge = E_iw_op == 14;
  assign E_op_ldh = E_iw_op == 15;
  assign E_op_cmplti = E_iw_op == 16;
  assign E_op_initda = E_iw_op == 19;
  assign E_op_ori = E_iw_op == 20;
  assign E_op_stw = E_iw_op == 21;
  assign E_op_blt = E_iw_op == 22;
  assign E_op_ldw = E_iw_op == 23;
  assign E_op_cmpnei = E_iw_op == 24;
  assign E_op_flushda = E_iw_op == 27;
  assign E_op_xori = E_iw_op == 28;
  assign E_op_stc = E_iw_op == 29;
  assign E_op_bne = E_iw_op == 30;
  assign E_op_ldl = E_iw_op == 31;
  assign E_op_cmpeqi = E_iw_op == 32;
  assign E_op_ldbuio = E_iw_op == 35;
  assign E_op_muli = E_iw_op == 36;
  assign E_op_stbio = E_iw_op == 37;
  assign E_op_beq = E_iw_op == 38;
  assign E_op_ldbio = E_iw_op == 39;
  assign E_op_cmpgeui = E_iw_op == 40;
  assign E_op_ldhuio = E_iw_op == 43;
  assign E_op_andhi = E_iw_op == 44;
  assign E_op_sthio = E_iw_op == 45;
  assign E_op_bgeu = E_iw_op == 46;
  assign E_op_ldhio = E_iw_op == 47;
  assign E_op_cmpltui = E_iw_op == 48;
  assign E_op_initd = E_iw_op == 51;
  assign E_op_orhi = E_iw_op == 52;
  assign E_op_stwio = E_iw_op == 53;
  assign E_op_bltu = E_iw_op == 54;
  assign E_op_ldwio = E_iw_op == 55;
  assign E_op_rdprs = E_iw_op == 56;
  assign E_op_flushd = E_iw_op == 59;
  assign E_op_xorhi = E_iw_op == 60;
  assign E_op_rsv02 = E_iw_op == 2;
  assign E_op_rsv09 = E_iw_op == 9;
  assign E_op_rsv10 = E_iw_op == 10;
  assign E_op_rsv17 = E_iw_op == 17;
  assign E_op_rsv18 = E_iw_op == 18;
  assign E_op_rsv25 = E_iw_op == 25;
  assign E_op_rsv26 = E_iw_op == 26;
  assign E_op_rsv33 = E_iw_op == 33;
  assign E_op_rsv34 = E_iw_op == 34;
  assign E_op_rsv41 = E_iw_op == 41;
  assign E_op_rsv42 = E_iw_op == 42;
  assign E_op_rsv49 = E_iw_op == 49;
  assign E_op_rsv57 = E_iw_op == 57;
  assign E_op_rsv61 = E_iw_op == 61;
  assign E_op_rsv62 = E_iw_op == 62;
  assign E_op_rsv63 = E_iw_op == 63;
  assign E_op_eret = E_op_opx & (E_iw_opx == 1);
  assign E_op_roli = E_op_opx & (E_iw_opx == 2);
  assign E_op_rol = E_op_opx & (E_iw_opx == 3);
  assign E_op_flushp = E_op_opx & (E_iw_opx == 4);
  assign E_op_ret = E_op_opx & (E_iw_opx == 5);
  assign E_op_nor = E_op_opx & (E_iw_opx == 6);
  assign E_op_mulxuu = E_op_opx & (E_iw_opx == 7);
  assign E_op_cmpge = E_op_opx & (E_iw_opx == 8);
  assign E_op_bret = E_op_opx & (E_iw_opx == 9);
  assign E_op_ror = E_op_opx & (E_iw_opx == 11);
  assign E_op_flushi = E_op_opx & (E_iw_opx == 12);
  assign E_op_jmp = E_op_opx & (E_iw_opx == 13);
  assign E_op_and = E_op_opx & (E_iw_opx == 14);
  assign E_op_cmplt = E_op_opx & (E_iw_opx == 16);
  assign E_op_slli = E_op_opx & (E_iw_opx == 18);
  assign E_op_sll = E_op_opx & (E_iw_opx == 19);
  assign E_op_wrprs = E_op_opx & (E_iw_opx == 20);
  assign E_op_or = E_op_opx & (E_iw_opx == 22);
  assign E_op_mulxsu = E_op_opx & (E_iw_opx == 23);
  assign E_op_cmpne = E_op_opx & (E_iw_opx == 24);
  assign E_op_srli = E_op_opx & (E_iw_opx == 26);
  assign E_op_srl = E_op_opx & (E_iw_opx == 27);
  assign E_op_nextpc = E_op_opx & (E_iw_opx == 28);
  assign E_op_callr = E_op_opx & (E_iw_opx == 29);
  assign E_op_xor = E_op_opx & (E_iw_opx == 30);
  assign E_op_mulxss = E_op_opx & (E_iw_opx == 31);
  assign E_op_cmpeq = E_op_opx & (E_iw_opx == 32);
  assign E_op_divu = E_op_opx & (E_iw_opx == 36);
  assign E_op_div = E_op_opx & (E_iw_opx == 37);
  assign E_op_rdctl = E_op_opx & (E_iw_opx == 38);
  assign E_op_mul = E_op_opx & (E_iw_opx == 39);
  assign E_op_cmpgeu = E_op_opx & (E_iw_opx == 40);
  assign E_op_initi = E_op_opx & (E_iw_opx == 41);
  assign E_op_trap = E_op_opx & (E_iw_opx == 45);
  assign E_op_wrctl = E_op_opx & (E_iw_opx == 46);
  assign E_op_cmpltu = E_op_opx & (E_iw_opx == 48);
  assign E_op_add = E_op_opx & (E_iw_opx == 49);
  assign E_op_break = E_op_opx & (E_iw_opx == 52);
  assign E_op_hbreak = E_op_opx & (E_iw_opx == 53);
  assign E_op_sync = E_op_opx & (E_iw_opx == 54);
  assign E_op_sub = E_op_opx & (E_iw_opx == 57);
  assign E_op_srai = E_op_opx & (E_iw_opx == 58);
  assign E_op_sra = E_op_opx & (E_iw_opx == 59);
  assign E_op_intr = E_op_opx & (E_iw_opx == 61);
  assign E_op_crst = E_op_opx & (E_iw_opx == 62);
  assign E_op_rsvx00 = E_op_opx & (E_iw_opx == 0);
  assign E_op_rsvx10 = E_op_opx & (E_iw_opx == 10);
  assign E_op_rsvx15 = E_op_opx & (E_iw_opx == 15);
  assign E_op_rsvx17 = E_op_opx & (E_iw_opx == 17);
  assign E_op_rsvx21 = E_op_opx & (E_iw_opx == 21);
  assign E_op_rsvx25 = E_op_opx & (E_iw_opx == 25);
  assign E_op_rsvx33 = E_op_opx & (E_iw_opx == 33);
  assign E_op_rsvx34 = E_op_opx & (E_iw_opx == 34);
  assign E_op_rsvx35 = E_op_opx & (E_iw_opx == 35);
  assign E_op_rsvx42 = E_op_opx & (E_iw_opx == 42);
  assign E_op_rsvx43 = E_op_opx & (E_iw_opx == 43);
  assign E_op_rsvx44 = E_op_opx & (E_iw_opx == 44);
  assign E_op_rsvx47 = E_op_opx & (E_iw_opx == 47);
  assign E_op_rsvx50 = E_op_opx & (E_iw_opx == 50);
  assign E_op_rsvx51 = E_op_opx & (E_iw_opx == 51);
  assign E_op_rsvx55 = E_op_opx & (E_iw_opx == 55);
  assign E_op_rsvx56 = E_op_opx & (E_iw_opx == 56);
  assign E_op_rsvx60 = E_op_opx & (E_iw_opx == 60);
  assign E_op_rsvx63 = E_op_opx & (E_iw_opx == 63);
  assign E_op_fpu = E_op_custom & 1'b1;
  assign E_op_opx = E_iw_op == 58;
  assign E_op_custom = E_iw_op == 50;
  assign M_op_call = M_iw_op == 0;
  assign M_op_jmpi = M_iw_op == 1;
  assign M_op_ldbu = M_iw_op == 3;
  assign M_op_addi = M_iw_op == 4;
  assign M_op_stb = M_iw_op == 5;
  assign M_op_br = M_iw_op == 6;
  assign M_op_ldb = M_iw_op == 7;
  assign M_op_cmpgei = M_iw_op == 8;
  assign M_op_ldhu = M_iw_op == 11;
  assign M_op_andi = M_iw_op == 12;
  assign M_op_sth = M_iw_op == 13;
  assign M_op_bge = M_iw_op == 14;
  assign M_op_ldh = M_iw_op == 15;
  assign M_op_cmplti = M_iw_op == 16;
  assign M_op_initda = M_iw_op == 19;
  assign M_op_ori = M_iw_op == 20;
  assign M_op_stw = M_iw_op == 21;
  assign M_op_blt = M_iw_op == 22;
  assign M_op_ldw = M_iw_op == 23;
  assign M_op_cmpnei = M_iw_op == 24;
  assign M_op_flushda = M_iw_op == 27;
  assign M_op_xori = M_iw_op == 28;
  assign M_op_stc = M_iw_op == 29;
  assign M_op_bne = M_iw_op == 30;
  assign M_op_ldl = M_iw_op == 31;
  assign M_op_cmpeqi = M_iw_op == 32;
  assign M_op_ldbuio = M_iw_op == 35;
  assign M_op_muli = M_iw_op == 36;
  assign M_op_stbio = M_iw_op == 37;
  assign M_op_beq = M_iw_op == 38;
  assign M_op_ldbio = M_iw_op == 39;
  assign M_op_cmpgeui = M_iw_op == 40;
  assign M_op_ldhuio = M_iw_op == 43;
  assign M_op_andhi = M_iw_op == 44;
  assign M_op_sthio = M_iw_op == 45;
  assign M_op_bgeu = M_iw_op == 46;
  assign M_op_ldhio = M_iw_op == 47;
  assign M_op_cmpltui = M_iw_op == 48;
  assign M_op_initd = M_iw_op == 51;
  assign M_op_orhi = M_iw_op == 52;
  assign M_op_stwio = M_iw_op == 53;
  assign M_op_bltu = M_iw_op == 54;
  assign M_op_ldwio = M_iw_op == 55;
  assign M_op_rdprs = M_iw_op == 56;
  assign M_op_flushd = M_iw_op == 59;
  assign M_op_xorhi = M_iw_op == 60;
  assign M_op_rsv02 = M_iw_op == 2;
  assign M_op_rsv09 = M_iw_op == 9;
  assign M_op_rsv10 = M_iw_op == 10;
  assign M_op_rsv17 = M_iw_op == 17;
  assign M_op_rsv18 = M_iw_op == 18;
  assign M_op_rsv25 = M_iw_op == 25;
  assign M_op_rsv26 = M_iw_op == 26;
  assign M_op_rsv33 = M_iw_op == 33;
  assign M_op_rsv34 = M_iw_op == 34;
  assign M_op_rsv41 = M_iw_op == 41;
  assign M_op_rsv42 = M_iw_op == 42;
  assign M_op_rsv49 = M_iw_op == 49;
  assign M_op_rsv57 = M_iw_op == 57;
  assign M_op_rsv61 = M_iw_op == 61;
  assign M_op_rsv62 = M_iw_op == 62;
  assign M_op_rsv63 = M_iw_op == 63;
  assign M_op_eret = M_op_opx & (M_iw_opx == 1);
  assign M_op_roli = M_op_opx & (M_iw_opx == 2);
  assign M_op_rol = M_op_opx & (M_iw_opx == 3);
  assign M_op_flushp = M_op_opx & (M_iw_opx == 4);
  assign M_op_ret = M_op_opx & (M_iw_opx == 5);
  assign M_op_nor = M_op_opx & (M_iw_opx == 6);
  assign M_op_mulxuu = M_op_opx & (M_iw_opx == 7);
  assign M_op_cmpge = M_op_opx & (M_iw_opx == 8);
  assign M_op_bret = M_op_opx & (M_iw_opx == 9);
  assign M_op_ror = M_op_opx & (M_iw_opx == 11);
  assign M_op_flushi = M_op_opx & (M_iw_opx == 12);
  assign M_op_jmp = M_op_opx & (M_iw_opx == 13);
  assign M_op_and = M_op_opx & (M_iw_opx == 14);
  assign M_op_cmplt = M_op_opx & (M_iw_opx == 16);
  assign M_op_slli = M_op_opx & (M_iw_opx == 18);
  assign M_op_sll = M_op_opx & (M_iw_opx == 19);
  assign M_op_wrprs = M_op_opx & (M_iw_opx == 20);
  assign M_op_or = M_op_opx & (M_iw_opx == 22);
  assign M_op_mulxsu = M_op_opx & (M_iw_opx == 23);
  assign M_op_cmpne = M_op_opx & (M_iw_opx == 24);
  assign M_op_srli = M_op_opx & (M_iw_opx == 26);
  assign M_op_srl = M_op_opx & (M_iw_opx == 27);
  assign M_op_nextpc = M_op_opx & (M_iw_opx == 28);
  assign M_op_callr = M_op_opx & (M_iw_opx == 29);
  assign M_op_xor = M_op_opx & (M_iw_opx == 30);
  assign M_op_mulxss = M_op_opx & (M_iw_opx == 31);
  assign M_op_cmpeq = M_op_opx & (M_iw_opx == 32);
  assign M_op_divu = M_op_opx & (M_iw_opx == 36);
  assign M_op_div = M_op_opx & (M_iw_opx == 37);
  assign M_op_rdctl = M_op_opx & (M_iw_opx == 38);
  assign M_op_mul = M_op_opx & (M_iw_opx == 39);
  assign M_op_cmpgeu = M_op_opx & (M_iw_opx == 40);
  assign M_op_initi = M_op_opx & (M_iw_opx == 41);
  assign M_op_trap = M_op_opx & (M_iw_opx == 45);
  assign M_op_wrctl = M_op_opx & (M_iw_opx == 46);
  assign M_op_cmpltu = M_op_opx & (M_iw_opx == 48);
  assign M_op_add = M_op_opx & (M_iw_opx == 49);
  assign M_op_break = M_op_opx & (M_iw_opx == 52);
  assign M_op_hbreak = M_op_opx & (M_iw_opx == 53);
  assign M_op_sync = M_op_opx & (M_iw_opx == 54);
  assign M_op_sub = M_op_opx & (M_iw_opx == 57);
  assign M_op_srai = M_op_opx & (M_iw_opx == 58);
  assign M_op_sra = M_op_opx & (M_iw_opx == 59);
  assign M_op_intr = M_op_opx & (M_iw_opx == 61);
  assign M_op_crst = M_op_opx & (M_iw_opx == 62);
  assign M_op_rsvx00 = M_op_opx & (M_iw_opx == 0);
  assign M_op_rsvx10 = M_op_opx & (M_iw_opx == 10);
  assign M_op_rsvx15 = M_op_opx & (M_iw_opx == 15);
  assign M_op_rsvx17 = M_op_opx & (M_iw_opx == 17);
  assign M_op_rsvx21 = M_op_opx & (M_iw_opx == 21);
  assign M_op_rsvx25 = M_op_opx & (M_iw_opx == 25);
  assign M_op_rsvx33 = M_op_opx & (M_iw_opx == 33);
  assign M_op_rsvx34 = M_op_opx & (M_iw_opx == 34);
  assign M_op_rsvx35 = M_op_opx & (M_iw_opx == 35);
  assign M_op_rsvx42 = M_op_opx & (M_iw_opx == 42);
  assign M_op_rsvx43 = M_op_opx & (M_iw_opx == 43);
  assign M_op_rsvx44 = M_op_opx & (M_iw_opx == 44);
  assign M_op_rsvx47 = M_op_opx & (M_iw_opx == 47);
  assign M_op_rsvx50 = M_op_opx & (M_iw_opx == 50);
  assign M_op_rsvx51 = M_op_opx & (M_iw_opx == 51);
  assign M_op_rsvx55 = M_op_opx & (M_iw_opx == 55);
  assign M_op_rsvx56 = M_op_opx & (M_iw_opx == 56);
  assign M_op_rsvx60 = M_op_opx & (M_iw_opx == 60);
  assign M_op_rsvx63 = M_op_opx & (M_iw_opx == 63);
  assign M_op_fpu = M_op_custom & 1'b1;
  assign M_op_opx = M_iw_op == 58;
  assign M_op_custom = M_iw_op == 50;
  assign A_op_call = A_iw_op == 0;
  assign A_op_jmpi = A_iw_op == 1;
  assign A_op_ldbu = A_iw_op == 3;
  assign A_op_addi = A_iw_op == 4;
  assign A_op_stb = A_iw_op == 5;
  assign A_op_br = A_iw_op == 6;
  assign A_op_ldb = A_iw_op == 7;
  assign A_op_cmpgei = A_iw_op == 8;
  assign A_op_ldhu = A_iw_op == 11;
  assign A_op_andi = A_iw_op == 12;
  assign A_op_sth = A_iw_op == 13;
  assign A_op_bge = A_iw_op == 14;
  assign A_op_ldh = A_iw_op == 15;
  assign A_op_cmplti = A_iw_op == 16;
  assign A_op_initda = A_iw_op == 19;
  assign A_op_ori = A_iw_op == 20;
  assign A_op_stw = A_iw_op == 21;
  assign A_op_blt = A_iw_op == 22;
  assign A_op_ldw = A_iw_op == 23;
  assign A_op_cmpnei = A_iw_op == 24;
  assign A_op_flushda = A_iw_op == 27;
  assign A_op_xori = A_iw_op == 28;
  assign A_op_stc = A_iw_op == 29;
  assign A_op_bne = A_iw_op == 30;
  assign A_op_ldl = A_iw_op == 31;
  assign A_op_cmpeqi = A_iw_op == 32;
  assign A_op_ldbuio = A_iw_op == 35;
  assign A_op_muli = A_iw_op == 36;
  assign A_op_stbio = A_iw_op == 37;
  assign A_op_beq = A_iw_op == 38;
  assign A_op_ldbio = A_iw_op == 39;
  assign A_op_cmpgeui = A_iw_op == 40;
  assign A_op_ldhuio = A_iw_op == 43;
  assign A_op_andhi = A_iw_op == 44;
  assign A_op_sthio = A_iw_op == 45;
  assign A_op_bgeu = A_iw_op == 46;
  assign A_op_ldhio = A_iw_op == 47;
  assign A_op_cmpltui = A_iw_op == 48;
  assign A_op_initd = A_iw_op == 51;
  assign A_op_orhi = A_iw_op == 52;
  assign A_op_stwio = A_iw_op == 53;
  assign A_op_bltu = A_iw_op == 54;
  assign A_op_ldwio = A_iw_op == 55;
  assign A_op_rdprs = A_iw_op == 56;
  assign A_op_flushd = A_iw_op == 59;
  assign A_op_xorhi = A_iw_op == 60;
  assign A_op_rsv02 = A_iw_op == 2;
  assign A_op_rsv09 = A_iw_op == 9;
  assign A_op_rsv10 = A_iw_op == 10;
  assign A_op_rsv17 = A_iw_op == 17;
  assign A_op_rsv18 = A_iw_op == 18;
  assign A_op_rsv25 = A_iw_op == 25;
  assign A_op_rsv26 = A_iw_op == 26;
  assign A_op_rsv33 = A_iw_op == 33;
  assign A_op_rsv34 = A_iw_op == 34;
  assign A_op_rsv41 = A_iw_op == 41;
  assign A_op_rsv42 = A_iw_op == 42;
  assign A_op_rsv49 = A_iw_op == 49;
  assign A_op_rsv57 = A_iw_op == 57;
  assign A_op_rsv61 = A_iw_op == 61;
  assign A_op_rsv62 = A_iw_op == 62;
  assign A_op_rsv63 = A_iw_op == 63;
  assign A_op_eret = A_op_opx & (A_iw_opx == 1);
  assign A_op_roli = A_op_opx & (A_iw_opx == 2);
  assign A_op_rol = A_op_opx & (A_iw_opx == 3);
  assign A_op_flushp = A_op_opx & (A_iw_opx == 4);
  assign A_op_ret = A_op_opx & (A_iw_opx == 5);
  assign A_op_nor = A_op_opx & (A_iw_opx == 6);
  assign A_op_mulxuu = A_op_opx & (A_iw_opx == 7);
  assign A_op_cmpge = A_op_opx & (A_iw_opx == 8);
  assign A_op_bret = A_op_opx & (A_iw_opx == 9);
  assign A_op_ror = A_op_opx & (A_iw_opx == 11);
  assign A_op_flushi = A_op_opx & (A_iw_opx == 12);
  assign A_op_jmp = A_op_opx & (A_iw_opx == 13);
  assign A_op_and = A_op_opx & (A_iw_opx == 14);
  assign A_op_cmplt = A_op_opx & (A_iw_opx == 16);
  assign A_op_slli = A_op_opx & (A_iw_opx == 18);
  assign A_op_sll = A_op_opx & (A_iw_opx == 19);
  assign A_op_wrprs = A_op_opx & (A_iw_opx == 20);
  assign A_op_or = A_op_opx & (A_iw_opx == 22);
  assign A_op_mulxsu = A_op_opx & (A_iw_opx == 23);
  assign A_op_cmpne = A_op_opx & (A_iw_opx == 24);
  assign A_op_srli = A_op_opx & (A_iw_opx == 26);
  assign A_op_srl = A_op_opx & (A_iw_opx == 27);
  assign A_op_nextpc = A_op_opx & (A_iw_opx == 28);
  assign A_op_callr = A_op_opx & (A_iw_opx == 29);
  assign A_op_xor = A_op_opx & (A_iw_opx == 30);
  assign A_op_mulxss = A_op_opx & (A_iw_opx == 31);
  assign A_op_cmpeq = A_op_opx & (A_iw_opx == 32);
  assign A_op_divu = A_op_opx & (A_iw_opx == 36);
  assign A_op_div = A_op_opx & (A_iw_opx == 37);
  assign A_op_rdctl = A_op_opx & (A_iw_opx == 38);
  assign A_op_mul = A_op_opx & (A_iw_opx == 39);
  assign A_op_cmpgeu = A_op_opx & (A_iw_opx == 40);
  assign A_op_initi = A_op_opx & (A_iw_opx == 41);
  assign A_op_trap = A_op_opx & (A_iw_opx == 45);
  assign A_op_wrctl = A_op_opx & (A_iw_opx == 46);
  assign A_op_cmpltu = A_op_opx & (A_iw_opx == 48);
  assign A_op_add = A_op_opx & (A_iw_opx == 49);
  assign A_op_break = A_op_opx & (A_iw_opx == 52);
  assign A_op_hbreak = A_op_opx & (A_iw_opx == 53);
  assign A_op_sync = A_op_opx & (A_iw_opx == 54);
  assign A_op_sub = A_op_opx & (A_iw_opx == 57);
  assign A_op_srai = A_op_opx & (A_iw_opx == 58);
  assign A_op_sra = A_op_opx & (A_iw_opx == 59);
  assign A_op_intr = A_op_opx & (A_iw_opx == 61);
  assign A_op_crst = A_op_opx & (A_iw_opx == 62);
  assign A_op_rsvx00 = A_op_opx & (A_iw_opx == 0);
  assign A_op_rsvx10 = A_op_opx & (A_iw_opx == 10);
  assign A_op_rsvx15 = A_op_opx & (A_iw_opx == 15);
  assign A_op_rsvx17 = A_op_opx & (A_iw_opx == 17);
  assign A_op_rsvx21 = A_op_opx & (A_iw_opx == 21);
  assign A_op_rsvx25 = A_op_opx & (A_iw_opx == 25);
  assign A_op_rsvx33 = A_op_opx & (A_iw_opx == 33);
  assign A_op_rsvx34 = A_op_opx & (A_iw_opx == 34);
  assign A_op_rsvx35 = A_op_opx & (A_iw_opx == 35);
  assign A_op_rsvx42 = A_op_opx & (A_iw_opx == 42);
  assign A_op_rsvx43 = A_op_opx & (A_iw_opx == 43);
  assign A_op_rsvx44 = A_op_opx & (A_iw_opx == 44);
  assign A_op_rsvx47 = A_op_opx & (A_iw_opx == 47);
  assign A_op_rsvx50 = A_op_opx & (A_iw_opx == 50);
  assign A_op_rsvx51 = A_op_opx & (A_iw_opx == 51);
  assign A_op_rsvx55 = A_op_opx & (A_iw_opx == 55);
  assign A_op_rsvx56 = A_op_opx & (A_iw_opx == 56);
  assign A_op_rsvx60 = A_op_opx & (A_iw_opx == 60);
  assign A_op_rsvx63 = A_op_opx & (A_iw_opx == 63);
  assign A_op_fpu = A_op_custom & 1'b1;
  assign A_op_opx = A_iw_op == 58;
  assign A_op_custom = A_iw_op == 50;
  assign W_op_call = W_iw_op == 0;
  assign W_op_jmpi = W_iw_op == 1;
  assign W_op_ldbu = W_iw_op == 3;
  assign W_op_addi = W_iw_op == 4;
  assign W_op_stb = W_iw_op == 5;
  assign W_op_br = W_iw_op == 6;
  assign W_op_ldb = W_iw_op == 7;
  assign W_op_cmpgei = W_iw_op == 8;
  assign W_op_ldhu = W_iw_op == 11;
  assign W_op_andi = W_iw_op == 12;
  assign W_op_sth = W_iw_op == 13;
  assign W_op_bge = W_iw_op == 14;
  assign W_op_ldh = W_iw_op == 15;
  assign W_op_cmplti = W_iw_op == 16;
  assign W_op_initda = W_iw_op == 19;
  assign W_op_ori = W_iw_op == 20;
  assign W_op_stw = W_iw_op == 21;
  assign W_op_blt = W_iw_op == 22;
  assign W_op_ldw = W_iw_op == 23;
  assign W_op_cmpnei = W_iw_op == 24;
  assign W_op_flushda = W_iw_op == 27;
  assign W_op_xori = W_iw_op == 28;
  assign W_op_stc = W_iw_op == 29;
  assign W_op_bne = W_iw_op == 30;
  assign W_op_ldl = W_iw_op == 31;
  assign W_op_cmpeqi = W_iw_op == 32;
  assign W_op_ldbuio = W_iw_op == 35;
  assign W_op_muli = W_iw_op == 36;
  assign W_op_stbio = W_iw_op == 37;
  assign W_op_beq = W_iw_op == 38;
  assign W_op_ldbio = W_iw_op == 39;
  assign W_op_cmpgeui = W_iw_op == 40;
  assign W_op_ldhuio = W_iw_op == 43;
  assign W_op_andhi = W_iw_op == 44;
  assign W_op_sthio = W_iw_op == 45;
  assign W_op_bgeu = W_iw_op == 46;
  assign W_op_ldhio = W_iw_op == 47;
  assign W_op_cmpltui = W_iw_op == 48;
  assign W_op_initd = W_iw_op == 51;
  assign W_op_orhi = W_iw_op == 52;
  assign W_op_stwio = W_iw_op == 53;
  assign W_op_bltu = W_iw_op == 54;
  assign W_op_ldwio = W_iw_op == 55;
  assign W_op_rdprs = W_iw_op == 56;
  assign W_op_flushd = W_iw_op == 59;
  assign W_op_xorhi = W_iw_op == 60;
  assign W_op_rsv02 = W_iw_op == 2;
  assign W_op_rsv09 = W_iw_op == 9;
  assign W_op_rsv10 = W_iw_op == 10;
  assign W_op_rsv17 = W_iw_op == 17;
  assign W_op_rsv18 = W_iw_op == 18;
  assign W_op_rsv25 = W_iw_op == 25;
  assign W_op_rsv26 = W_iw_op == 26;
  assign W_op_rsv33 = W_iw_op == 33;
  assign W_op_rsv34 = W_iw_op == 34;
  assign W_op_rsv41 = W_iw_op == 41;
  assign W_op_rsv42 = W_iw_op == 42;
  assign W_op_rsv49 = W_iw_op == 49;
  assign W_op_rsv57 = W_iw_op == 57;
  assign W_op_rsv61 = W_iw_op == 61;
  assign W_op_rsv62 = W_iw_op == 62;
  assign W_op_rsv63 = W_iw_op == 63;
  assign W_op_eret = W_op_opx & (W_iw_opx == 1);
  assign W_op_roli = W_op_opx & (W_iw_opx == 2);
  assign W_op_rol = W_op_opx & (W_iw_opx == 3);
  assign W_op_flushp = W_op_opx & (W_iw_opx == 4);
  assign W_op_ret = W_op_opx & (W_iw_opx == 5);
  assign W_op_nor = W_op_opx & (W_iw_opx == 6);
  assign W_op_mulxuu = W_op_opx & (W_iw_opx == 7);
  assign W_op_cmpge = W_op_opx & (W_iw_opx == 8);
  assign W_op_bret = W_op_opx & (W_iw_opx == 9);
  assign W_op_ror = W_op_opx & (W_iw_opx == 11);
  assign W_op_flushi = W_op_opx & (W_iw_opx == 12);
  assign W_op_jmp = W_op_opx & (W_iw_opx == 13);
  assign W_op_and = W_op_opx & (W_iw_opx == 14);
  assign W_op_cmplt = W_op_opx & (W_iw_opx == 16);
  assign W_op_slli = W_op_opx & (W_iw_opx == 18);
  assign W_op_sll = W_op_opx & (W_iw_opx == 19);
  assign W_op_wrprs = W_op_opx & (W_iw_opx == 20);
  assign W_op_or = W_op_opx & (W_iw_opx == 22);
  assign W_op_mulxsu = W_op_opx & (W_iw_opx == 23);
  assign W_op_cmpne = W_op_opx & (W_iw_opx == 24);
  assign W_op_srli = W_op_opx & (W_iw_opx == 26);
  assign W_op_srl = W_op_opx & (W_iw_opx == 27);
  assign W_op_nextpc = W_op_opx & (W_iw_opx == 28);
  assign W_op_callr = W_op_opx & (W_iw_opx == 29);
  assign W_op_xor = W_op_opx & (W_iw_opx == 30);
  assign W_op_mulxss = W_op_opx & (W_iw_opx == 31);
  assign W_op_cmpeq = W_op_opx & (W_iw_opx == 32);
  assign W_op_divu = W_op_opx & (W_iw_opx == 36);
  assign W_op_div = W_op_opx & (W_iw_opx == 37);
  assign W_op_rdctl = W_op_opx & (W_iw_opx == 38);
  assign W_op_mul = W_op_opx & (W_iw_opx == 39);
  assign W_op_cmpgeu = W_op_opx & (W_iw_opx == 40);
  assign W_op_initi = W_op_opx & (W_iw_opx == 41);
  assign W_op_trap = W_op_opx & (W_iw_opx == 45);
  assign W_op_wrctl = W_op_opx & (W_iw_opx == 46);
  assign W_op_cmpltu = W_op_opx & (W_iw_opx == 48);
  assign W_op_add = W_op_opx & (W_iw_opx == 49);
  assign W_op_break = W_op_opx & (W_iw_opx == 52);
  assign W_op_hbreak = W_op_opx & (W_iw_opx == 53);
  assign W_op_sync = W_op_opx & (W_iw_opx == 54);
  assign W_op_sub = W_op_opx & (W_iw_opx == 57);
  assign W_op_srai = W_op_opx & (W_iw_opx == 58);
  assign W_op_sra = W_op_opx & (W_iw_opx == 59);
  assign W_op_intr = W_op_opx & (W_iw_opx == 61);
  assign W_op_crst = W_op_opx & (W_iw_opx == 62);
  assign W_op_rsvx00 = W_op_opx & (W_iw_opx == 0);
  assign W_op_rsvx10 = W_op_opx & (W_iw_opx == 10);
  assign W_op_rsvx15 = W_op_opx & (W_iw_opx == 15);
  assign W_op_rsvx17 = W_op_opx & (W_iw_opx == 17);
  assign W_op_rsvx21 = W_op_opx & (W_iw_opx == 21);
  assign W_op_rsvx25 = W_op_opx & (W_iw_opx == 25);
  assign W_op_rsvx33 = W_op_opx & (W_iw_opx == 33);
  assign W_op_rsvx34 = W_op_opx & (W_iw_opx == 34);
  assign W_op_rsvx35 = W_op_opx & (W_iw_opx == 35);
  assign W_op_rsvx42 = W_op_opx & (W_iw_opx == 42);
  assign W_op_rsvx43 = W_op_opx & (W_iw_opx == 43);
  assign W_op_rsvx44 = W_op_opx & (W_iw_opx == 44);
  assign W_op_rsvx47 = W_op_opx & (W_iw_opx == 47);
  assign W_op_rsvx50 = W_op_opx & (W_iw_opx == 50);
  assign W_op_rsvx51 = W_op_opx & (W_iw_opx == 51);
  assign W_op_rsvx55 = W_op_opx & (W_iw_opx == 55);
  assign W_op_rsvx56 = W_op_opx & (W_iw_opx == 56);
  assign W_op_rsvx60 = W_op_opx & (W_iw_opx == 60);
  assign W_op_rsvx63 = W_op_opx & (W_iw_opx == 63);
  assign W_op_fpu = W_op_custom & 1'b1;
  assign W_op_opx = W_iw_op == 58;
  assign W_op_custom = W_iw_op == 50;
  assign F_stall = D_stall;
  assign F_en = ~F_stall;
  assign F_iw = (latched_oci_tb_hbreak_req & hbreak_enabled) ? 4040762 :
    1'b0                                 ? 127034 :
    (norm_intr_req)                                 ? 3926074 : 
    F_ram_iw;

  assign F_kill = D_refetch | M_pipe_flush | E_valid_jmp_indirect |
    ((D_br_pred_taken | D_ctrl_uncond_cti_non_br) & D_issue);

  assign F_br_taken_waddr_partial = F_pc_plus_one[9 : 0] + 
    F_ram_iw_imm16[11 : 2];

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_iw_valid <= 0;
      else if (D_en)
          D_iw_valid <= F_iw_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_issue <= 0;
      else if (D_en)
          D_issue <= F_issue;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_kill <= 0;
      else if (D_en)
          D_kill <= F_kill;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_br_taken_waddr_partial <= 0;
      else if (D_en)
          D_br_taken_waddr_partial <= F_br_taken_waddr_partial;
    end


  assign D_refetch = ~D_iw_valid & ~D_kill;
  assign D_br_offset_sex = {{16 {D_iw_imm16[15]}}, D_iw_imm16[15 : 12]};
  assign D_br_offset_remaining = D_br_offset_sex[14 : 0];
  assign D_br_taken_waddr = { D_pc_plus_one[24 : 10] +
    D_br_offset_remaining + 
    D_br_taken_waddr_partial[10],
    D_br_taken_waddr_partial[9 : 0]};

  assign D_br_taken_baddr = {D_br_taken_waddr, 2'b00};
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_br_taken_baddr <= 0;
      else if (E_en)
          E_br_taken_baddr <= D_br_taken_baddr;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_br_taken_baddr <= 0;
      else if (M_en)
          M_br_taken_baddr <= E_br_taken_baddr;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_br_taken_baddr <= 0;
      else if (A_en)
          A_br_taken_baddr <= M_br_taken_baddr;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_br_taken_baddr <= 0;
      else 
        W_br_taken_baddr <= A_br_taken_baddr;
    end


  assign F_pcb_nxt = {F_pc_nxt, 2'b00};
  assign F_pcb = {F_pc, 2'b00};
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          F_pc <= 0;
      else if (F_en)
          F_pc <= F_pc_nxt;
    end


  assign F_pc_plus_one = F_pc + 1;
  assign D_ic_bypass_start_avalon_read = 0;
  assign F_ic_bypass_req = 0;
  assign ic_bypass_active = 0;
  assign F_ic_data_rd_addr_nxt = F_pc_nxt[9 : 0];
  assign ic_data_wren = i_readdatavalid_d1 & ~ic_bypass_active;
  assign ic_data_rden = F_en;
//sopc_nios2_0_ic_data, which is an nios_sdp_ram
sopc_nios2_0_ic_data_module sopc_nios2_0_ic_data
  (
    .clock     (clk),
    .data      (i_readdata_d1),
    .q         (F_ic_iw),
    .rdaddress (F_ic_data_rd_addr_nxt),
    .rden      (ic_data_rden),
    .wraddress ({ic_fill_line, ic_fill_dp_offset}),
    .wren      (ic_data_wren)
  );

  assign F_ic_tag_rd_addr_nxt = F_pc_nxt[9 : 3];
  assign ic_tag_clr_valid_bits_nxt = (M_ctrl_invalidate_i & M_valid) | D_ic_fill_starting | clr_break_line;
  assign ic_fill_valid_bits_nxt = ic_tag_clr_valid_bits_nxt ? 0 :
    D_ic_fill_starting_d1     ? ic_fill_valid_bit_new : 
    (ic_fill_valid_bits | ic_fill_valid_bit_new);

  assign ic_fill_valid_bits_en = ic_tag_clr_valid_bits_nxt | D_ic_fill_starting_d1 | 
    i_readdatavalid_d1;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clr_break_line <= 1;
      else 
        clr_break_line <= 0;
    end


  assign ic_tag_wraddress_nxt = (clr_break_line)? 1 :
    ((M_ctrl_crst & M_valid))? 0 :
    ((M_ctrl_invalidate_i & M_valid))? (M_alu_result[11 : 5]) :
    (D_ic_fill_starting)? D_pc_line_field :
    ic_fill_line;

  assign ic_tag_wren = ic_tag_clr_valid_bits | i_readdatavalid_d1;
  assign ic_tag_wrdata = {ic_fill_tag, ic_fill_valid_bits};
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ic_tag_clr_valid_bits <= 1;
      else 
        ic_tag_clr_valid_bits <= ic_tag_clr_valid_bits_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ic_fill_valid_bits <= 0;
      else if (ic_fill_valid_bits_en)
          ic_fill_valid_bits <= ic_fill_valid_bits_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ic_tag_wraddress <= 0;
      else 
        ic_tag_wraddress <= ic_tag_wraddress_nxt;
    end


  assign ic_tag_rden = F_en;
//sopc_nios2_0_ic_tag, which is an nios_sdp_ram
sopc_nios2_0_ic_tag_module sopc_nios2_0_ic_tag
  (
    .clock     (clk),
    .data      (ic_tag_wrdata),
    .q         (F_ic_tag_rd),
    .rdaddress (F_ic_tag_rd_addr_nxt),
    .rden      (ic_tag_rden),
    .wraddress (ic_tag_wraddress),
    .wren      (ic_tag_wren)
  );

//synthesis translate_off
`ifdef NO_PLI
defparam sopc_nios2_0_ic_tag.lpm_file = "sopc_nios2_0_ic_tag_ram.dat";
`else
defparam sopc_nios2_0_ic_tag.lpm_file = "sopc_nios2_0_ic_tag_ram.hex";
`endif
//synthesis translate_on
//synthesis read_comments_as_HDL on
//defparam sopc_nios2_0_ic_tag.lpm_file = "sopc_nios2_0_ic_tag_ram.mif";
//synthesis read_comments_as_HDL off
  assign F_ic_tag_field = F_ic_tag_rd[22 : 8];
  assign F_ic_valid_bits = F_ic_tag_rd[7 : 0];
  assign F_ic_desired_tag = F_pc[24 : 10];
  assign F_ic_valid = (F_pc[2 : 0] == 3'd0)? F_ic_valid_bits[0] :
    (F_pc[2 : 0] == 3'd1)? F_ic_valid_bits[1] :
    (F_pc[2 : 0] == 3'd2)? F_ic_valid_bits[2] :
    (F_pc[2 : 0] == 3'd3)? F_ic_valid_bits[3] :
    (F_pc[2 : 0] == 3'd4)? F_ic_valid_bits[4] :
    (F_pc[2 : 0] == 3'd5)? F_ic_valid_bits[5] :
    (F_pc[2 : 0] == 3'd6)? F_ic_valid_bits[6] :
    F_ic_valid_bits[7];

  assign F_ic_hit = F_ic_valid & (F_ic_desired_tag == F_ic_tag_field) &
    ~F_ic_bypass_req & ~ic_bypass_active;

  assign F_pc_tag_field = F_pc[24 : 10];
  assign F_pc_line_field = F_pc[9 : 3];
  assign D_pc_tag_field = D_pc[24 : 10];
  assign D_pc_line_field = D_pc[9 : 3];
  assign D_pc_offset_field = D_pc[2 : 0];
  assign D_ic_want_fill_unfiltered = ~D_iw_valid & ~D_kill & ~M_pipe_flush;
  assign ic_fill_prevent_refill_nxt = D_ic_fill_starting | (ic_fill_prevent_refill & ~((M_ctrl_invalidate_i & M_valid) | ic_bypass_active));
  assign F_ic_fill_same_tag_line = (F_pc_tag_field == ic_fill_tag) & (F_pc_line_field == ic_fill_line);
  assign D_ic_fill_ignore = ic_fill_prevent_refill & D_ic_fill_same_tag_line;
  assign D_ic_fill_starting = ~ic_fill_active & D_ic_want_fill & ~D_ic_fill_ignore & ~ic_bypass_active;
  assign ic_fill_done = ic_fill_dp_last_word & i_readdatavalid_d1;
  assign ic_fill_active_nxt = D_ic_fill_starting | (ic_fill_active & ~ic_fill_done);
  assign ic_fill_dp_last_word = ic_fill_dp_offset_nxt == ic_fill_initial_offset;
  assign ic_fill_dp_offset_en = D_ic_fill_starting_d1 | i_readdatavalid_d1;
  assign ic_fill_dp_offset_nxt = D_ic_fill_starting_d1 ? 
    ic_fill_initial_offset : 
    (ic_fill_dp_offset + 1);

  assign ic_fill_ap_offset_nxt = ic_fill_req_accepted ? (ic_fill_ap_offset + 1) :
    (D_ic_fill_starting | D_ic_bypass_start_avalon_read) ? 
    D_pc_offset_field :
    ic_fill_ap_offset;

  assign ic_fill_ap_cnt_nxt = ic_fill_req_accepted ? (ic_fill_ap_cnt + 1) :
    D_ic_fill_starting   ? 1 :
    ic_fill_ap_cnt;

  assign ic_fill_ap_last_word = ic_fill_ap_cnt[3];
  assign ic_fill_req_accepted = i_read & ~i_waitrequest;
  assign i_read_nxt = D_ic_fill_starting | D_ic_bypass_start_avalon_read |
    (i_read & (i_waitrequest | 
    (~ic_fill_ap_last_word & ic_fill_active)));

  assign i_address = {ic_fill_tag, 
    ic_fill_line[6 : 0],
    ic_fill_ap_offset, 
    2'b00};

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ic_fill_ap_offset <= 0;
      else 
        ic_fill_ap_offset <= ic_fill_ap_offset_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ic_fill_ap_cnt <= 0;
      else 
        ic_fill_ap_cnt <= ic_fill_ap_cnt_nxt;
    end


  assign ic_fill_valid_bit_new = (ic_fill_dp_offset_nxt == 3'd0)? 8'b00000001 :
    (ic_fill_dp_offset_nxt == 3'd1)? 8'b00000010 :
    (ic_fill_dp_offset_nxt == 3'd2)? 8'b00000100 :
    (ic_fill_dp_offset_nxt == 3'd3)? 8'b00001000 :
    (ic_fill_dp_offset_nxt == 3'd4)? 8'b00010000 :
    (ic_fill_dp_offset_nxt == 3'd5)? 8'b00100000 :
    (ic_fill_dp_offset_nxt == 3'd6)? 8'b01000000 :
    8'b10000000;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ic_fill_starting_d1 <= 0;
      else 
        D_ic_fill_starting_d1 <= D_ic_fill_starting;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ic_fill_same_tag_line <= 0;
      else if (D_en)
          D_ic_fill_same_tag_line <= F_ic_fill_same_tag_line;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ic_fill_active <= 0;
      else 
        ic_fill_active <= ic_fill_active_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ic_fill_prevent_refill <= 0;
      else 
        ic_fill_prevent_refill <= ic_fill_prevent_refill_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ic_fill_tag <= 0;
      else if (D_ic_fill_starting | D_ic_bypass_start_avalon_read)
          ic_fill_tag <= D_pc_tag_field;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ic_fill_line <= 0;
      else if (D_ic_fill_starting | D_ic_bypass_start_avalon_read)
          ic_fill_line <= D_pc_line_field;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ic_fill_initial_offset <= 0;
      else if (D_ic_fill_starting | D_ic_bypass_start_avalon_read)
          ic_fill_initial_offset <= D_pc_offset_field;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ic_fill_dp_offset <= 0;
      else if (ic_fill_dp_offset_en)
          ic_fill_dp_offset <= ic_fill_dp_offset_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i_readdatavalid_d1 <= 0;
      else 
        i_readdatavalid_d1 <= i_readdatavalid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i_read <= 0;
      else 
        i_read <= i_read_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          i_readdata_d1 <= 0;
      else 
        i_readdata_d1 <= i_readdata;
    end


  assign F_bht_ptr_nxt = F_pc_nxt[7 : 0] ^ 
    M_br_cond_taken_history[7 : 0];

//sopc_nios2_0_bht, which is an nios_sdp_ram
sopc_nios2_0_bht_module sopc_nios2_0_bht
  (
    .clock     (clk),
    .data      (M_bht_wr_data_filtered),
    .q         (F_bht_data),
    .rdaddress (F_bht_ptr_nxt),
    .rden      (F_en),
    .wraddress (M_bht_ptr_filtered),
    .wren      (M_bht_wr_en_filtered)
  );

//synthesis translate_off
`ifdef NO_PLI
defparam sopc_nios2_0_bht.lpm_file = "sopc_nios2_0_bht_ram.dat";
`else
defparam sopc_nios2_0_bht.lpm_file = "sopc_nios2_0_bht_ram.hex";
`endif
//synthesis translate_on
//synthesis read_comments_as_HDL on
//defparam sopc_nios2_0_bht.lpm_file = "sopc_nios2_0_bht_ram.mif";
//synthesis read_comments_as_HDL off
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_bht_data <= 0;
      else if (D_en)
          D_bht_data <= F_bht_data;
    end


  assign D_br_cond_pred_taken = (D_bht_data[1] == 0) |
    D_ctrl_br_always_pred_taken;

  assign D_br_pred_taken = D_ctrl_br & (D_ctrl_br_uncond | D_br_cond_pred_taken);
  assign D_br_pred_not_taken = D_ctrl_br_cond & !D_br_cond_pred_taken;
  assign F_sel_instruction_master = 1'b1;
  assign F_ram_iw = F_ic_iw;
  assign F_inst_ram_hit = (F_ic_hit & ~(A_valid_crst)) | 
    ~F_sel_instruction_master;

  assign F_iw_valid = F_inst_ram_hit;
  assign F_issue = F_iw_valid & ~F_kill;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          F_bht_ptr <= 0;
      else if (F_en)
          F_bht_ptr <= F_bht_ptr_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_bht_ptr <= 0;
      else if (D_en)
          D_bht_ptr <= F_bht_ptr;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_bht_data <= 0;
      else if (E_en)
          E_bht_data <= D_bht_data;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_bht_ptr <= 0;
      else if (E_en)
          E_bht_ptr <= D_bht_ptr;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_bht_data <= 0;
      else if (M_en)
          M_bht_data <= E_bht_data;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_bht_ptr_unfiltered <= 0;
      else if (M_en)
          M_bht_ptr_unfiltered <= E_bht_ptr;
    end


  assign E_br_cond_pred_taken = (E_bht_data[1] == 0) | 
    E_ctrl_br_always_pred_taken;

  assign E_br_actually_taken = E_br_result;
  assign E_br_mispredict = E_ctrl_br_cond & E_valid & (E_br_cond_pred_taken != E_br_actually_taken);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_br_actually_taken <= 0;
      else if (M_en)
          M_br_actually_taken <= E_br_actually_taken;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_br_mispredict <= 0;
      else if (M_en)
          M_br_mispredict <= E_br_mispredict;
    end


  assign E_br_cond_taken_history = E_add_br_to_taken_history_filtered ? 
    { M_br_cond_taken_history[6 : 0], 
    E_br_actually_taken } :
    M_br_cond_taken_history;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_br_cond_taken_history <= 0;
      else if (M_en)
          M_br_cond_taken_history <= E_br_cond_taken_history;
    end


  assign M_bht_wr_data_unfiltered = ({M_bht_data, M_br_mispredict} == {2'd0, 1'b0})? 2'd1 :
    ({M_bht_data, M_br_mispredict} == {2'd0, 1'b1})? 2'd2 :
    ({M_bht_data, M_br_mispredict} == {2'd1, 1'b0})? 2'd1 :
    ({M_bht_data, M_br_mispredict} == {2'd1, 1'b1})? 2'd0 :
    ({M_bht_data, M_br_mispredict} == {2'd2, 1'b0})? 2'd3 :
    ({M_bht_data, M_br_mispredict} == {2'd2, 1'b1})? 2'd0 :
    ({M_bht_data, M_br_mispredict} == {2'd3, 1'b0})? 2'd3 :
    2'd2;

  assign M_bht_wr_en_unfiltered = M_ctrl_br_cond & ~M_ctrl_br_always_pred_taken & M_valid_from_E;
  assign E_add_br_to_taken_history_unfiltered = E_ctrl_br_cond & E_valid;
  assign F_iw_a_rf = D_en ? F_ram_iw_a : D_iw_a;
  assign F_iw_b_rf = D_en ? F_ram_iw_b : D_iw_b;
//sopc_nios2_0_register_bank_a, which is an nios_sdp_ram
sopc_nios2_0_register_bank_a_module sopc_nios2_0_register_bank_a
  (
    .clock     (clk),
    .data      (A_wr_data_filtered),
    .q         (D_rf_a),
    .rdaddress (F_iw_a_rf),
    .wraddress (A_dst_regnum),
    .wren      (A_wr_dst_reg)
  );

//synthesis translate_off
`ifdef NO_PLI
defparam sopc_nios2_0_register_bank_a.lpm_file = "sopc_nios2_0_rf_ram_a.dat";
`else
defparam sopc_nios2_0_register_bank_a.lpm_file = "sopc_nios2_0_rf_ram_a.hex";
`endif
//synthesis translate_on
//synthesis read_comments_as_HDL on
//defparam sopc_nios2_0_register_bank_a.lpm_file = "sopc_nios2_0_rf_ram_a.mif";
//synthesis read_comments_as_HDL off
//sopc_nios2_0_register_bank_b, which is an nios_sdp_ram
sopc_nios2_0_register_bank_b_module sopc_nios2_0_register_bank_b
  (
    .clock     (clk),
    .data      (A_wr_data_filtered),
    .q         (D_rf_b),
    .rdaddress (F_iw_b_rf),
    .wraddress (A_dst_regnum),
    .wren      (A_wr_dst_reg)
  );

//synthesis translate_off
`ifdef NO_PLI
defparam sopc_nios2_0_register_bank_b.lpm_file = "sopc_nios2_0_rf_ram_b.dat";
`else
defparam sopc_nios2_0_register_bank_b.lpm_file = "sopc_nios2_0_rf_ram_b.hex";
`endif
//synthesis translate_on
//synthesis read_comments_as_HDL on
//defparam sopc_nios2_0_register_bank_b.lpm_file = "sopc_nios2_0_rf_ram_b.mif";
//synthesis read_comments_as_HDL off
  assign A_shift_rot_cnt_nxt = A_shift_rot_stall ? 
    A_shift_rot_cnt-1 :
    1;

  assign A_shift_rot_done_nxt = A_shift_rot_cnt_nxt == 0;
  assign A_shift_rot_stall_nxt = ~A_shift_rot_done_nxt & 
    (A_shift_rot_stall |
    (M_ctrl_shift_rot & M_valid & A_en));

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_shift_rot_cnt <= 0;
      else 
        A_shift_rot_cnt <= A_shift_rot_cnt_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_shift_rot_stall <= 0;
      else 
        A_shift_rot_stall <= A_shift_rot_stall_nxt;
    end


  assign E_rot_n = E_src2[4 : 0];
  assign E_rot_rn = E_ctrl_shift_rot_right ? -E_rot_n : E_rot_n;
  assign E_rot_fill_bit = E_ctrl_shift_right_arith ? E_src1[31] : 0;
  assign E_rot_left_mask = (E_rot_n[2 : 0] == 3'b000)? 8'b00000000 :
    (E_rot_n[2 : 0] == 3'b001)? 8'b00000001 :
    (E_rot_n[2 : 0] == 3'b010)? 8'b00000011 :
    (E_rot_n[2 : 0] == 3'b011)? 8'b00000111 :
    (E_rot_n[2 : 0] == 3'b100)? 8'b00001111 :
    (E_rot_n[2 : 0] == 3'b101)? 8'b00011111 :
    (E_rot_n[2 : 0] == 3'b110)? 8'b00111111 :
    8'b01111111;

  assign E_rot_right_mask = (E_rot_n[2 : 0] == 3'b000)? 8'b00000000 :
    (E_rot_n[2 : 0] == 3'b001)? 8'b10000000 :
    (E_rot_n[2 : 0] == 3'b010)? 8'b11000000 :
    (E_rot_n[2 : 0] == 3'b011)? 8'b11100000 :
    (E_rot_n[2 : 0] == 3'b100)? 8'b11110000 :
    (E_rot_n[2 : 0] == 3'b101)? 8'b11111000 :
    (E_rot_n[2 : 0] == 3'b110)? 8'b11111100 :
    8'b11111110;

  assign E_rot_mask = E_ctrl_shift_rot_right ? E_rot_right_mask : E_rot_left_mask;
  assign E_rot_pass0 = E_ctrl_rot ||                                              (E_ctrl_shift_rot_right && (E_rot_n < 24));
  assign E_rot_pass1 = E_ctrl_rot || (E_ctrl_shift_rot_left && (E_rot_n <  8)) || (E_ctrl_shift_rot_right && (E_rot_n < 16));
  assign E_rot_pass2 = E_ctrl_rot || (E_ctrl_shift_rot_left && (E_rot_n < 16)) || (E_ctrl_shift_rot_right && (E_rot_n <  8));
  assign E_rot_pass3 = E_ctrl_rot || (E_ctrl_shift_rot_left && (E_rot_n < 24));
  assign E_rot_sel_fill0 = E_ctrl_shift_rot_left && (E_rot_n >=  8);
  assign E_rot_sel_fill1 = (E_ctrl_shift_rot_left && (E_rot_n >= 16)) || (E_ctrl_shift_rot_right && (E_rot_n >= 24));
  assign E_rot_sel_fill2 = (E_ctrl_shift_rot_left && (E_rot_n >= 24)) || (E_ctrl_shift_rot_right && (E_rot_n >= 16));
  assign E_rot_sel_fill3 = E_ctrl_shift_rot_right && (E_rot_n >=  8);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_fill_bit <= 0;
      else if (M_en)
          M_rot_fill_bit <= E_rot_fill_bit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_mask <= 0;
      else if (M_en)
          M_rot_mask <= E_rot_mask;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_pass0 <= 0;
      else if (M_en)
          M_rot_pass0 <= E_rot_pass0;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_pass1 <= 0;
      else if (M_en)
          M_rot_pass1 <= E_rot_pass1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_pass2 <= 0;
      else if (M_en)
          M_rot_pass2 <= E_rot_pass2;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_pass3 <= 0;
      else if (M_en)
          M_rot_pass3 <= E_rot_pass3;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_sel_fill0 <= 0;
      else if (M_en)
          M_rot_sel_fill0 <= E_rot_sel_fill0;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_sel_fill1 <= 0;
      else if (M_en)
          M_rot_sel_fill1 <= E_rot_sel_fill1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_sel_fill2 <= 0;
      else if (M_en)
          M_rot_sel_fill2 <= E_rot_sel_fill2;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_sel_fill3 <= 0;
      else if (M_en)
          M_rot_sel_fill3 <= E_rot_sel_fill3;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_rot_fill_bit <= 0;
      else if (A_en)
          A_rot_fill_bit <= M_rot_fill_bit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_rot_mask <= 0;
      else if (A_en)
          A_rot_mask <= M_rot_mask;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_rot_pass0 <= 0;
      else if (A_en)
          A_rot_pass0 <= M_rot_pass0;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_rot_pass1 <= 0;
      else if (A_en)
          A_rot_pass1 <= M_rot_pass1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_rot_pass2 <= 0;
      else if (A_en)
          A_rot_pass2 <= M_rot_pass2;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_rot_pass3 <= 0;
      else if (A_en)
          A_rot_pass3 <= M_rot_pass3;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_rot_sel_fill0 <= 0;
      else if (A_en)
          A_rot_sel_fill0 <= M_rot_sel_fill0;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_rot_sel_fill1 <= 0;
      else if (A_en)
          A_rot_sel_fill1 <= M_rot_sel_fill1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_rot_sel_fill2 <= 0;
      else if (A_en)
          A_rot_sel_fill2 <= M_rot_sel_fill2;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_rot_sel_fill3 <= 0;
      else if (A_en)
          A_rot_sel_fill3 <= M_rot_sel_fill3;
    end


  assign E_rot_prestep1 = E_rot_rn[0] ? {E_src1[30 : 0], E_src1[31]} : E_src1;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_step1 <= 0;
      else if (M_en)
          M_rot_step1 <= E_rot_rn[1] ? {E_rot_prestep1[29 : 0], E_rot_prestep1[31 : 30]} : E_rot_prestep1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_rot_rn <= 0;
      else if (M_en)
          M_rot_rn <= E_rot_rn;
    end


  assign M_rot_prestep2 = M_rot_rn[2] ? {M_rot_step1[27 : 0], M_rot_step1[31 : 28]} : M_rot_step1;
  always @(negedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Mn_rot_step2 <= 0;
      else 
        Mn_rot_step2 <= M_rot_rn[3] ? {M_rot_prestep2[23 : 0], M_rot_prestep2[31 : 24]} : M_rot_prestep2;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_rot <= 0;
      else if (A_en)
          A_rot <= M_rot_rn[4] ? 
                    {Mn_rot_step2[15 : 0], Mn_rot_step2[31 : 16]} : 
                    Mn_rot_step2;

    end


  assign A_rot_lut0 = {8{A_rot_sel_fill0 & A_rot_fill_bit}} | (A_rot_fill_bit ? ({8{~A_rot_sel_fill0}} & (A_rot[7 : 0] | A_rot_mask)) : ({8{~A_rot_sel_fill0}} & A_rot[7 : 0] & ~A_rot_mask));
  assign A_rot_lut1 = {8{A_rot_sel_fill1 & A_rot_fill_bit}} | (A_rot_fill_bit ? ({8{~A_rot_sel_fill1}} & (A_rot[15 : 8] | A_rot_mask)) : ({8{~A_rot_sel_fill1}} & A_rot[15 : 8] & ~A_rot_mask));
  assign A_rot_lut2 = {8{A_rot_sel_fill2 & A_rot_fill_bit}} | (A_rot_fill_bit ? ({8{~A_rot_sel_fill2}} & (A_rot[23 : 16] | A_rot_mask)) : ({8{~A_rot_sel_fill2}} & A_rot[23 : 16] & ~A_rot_mask));
  assign A_rot_lut3 = {8{A_rot_sel_fill3 & A_rot_fill_bit}} | (A_rot_fill_bit ? ({8{~A_rot_sel_fill3}} & (A_rot[31 : 24] | A_rot_mask)) : ({8{~A_rot_sel_fill3}} & A_rot[31 : 24] & ~A_rot_mask));
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_shift_rot_result[7 : 0] <= 0;
      else 
        A_shift_rot_result[7 : 0] <= A_rot_pass0 ? A_rot[7 : 0] : A_rot_lut0;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_shift_rot_result[15 : 8] <= 0;
      else 
        A_shift_rot_result[15 : 8] <= A_rot_pass1 ? A_rot[15 : 8] : A_rot_lut1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_shift_rot_result[23 : 16] <= 0;
      else 
        A_shift_rot_result[23 : 16] <= A_rot_pass2 ? A_rot[23 : 16] : A_rot_lut2;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_shift_rot_result[31 : 24] <= 0;
      else 
        A_shift_rot_result[31 : 24] <= A_rot_pass3 ? A_rot[31 : 24] : A_rot_lut3;
    end


  assign E_mem_bypass_non_io = E_arith_result[31];
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_rd_data <= 0;
      else if (A_en)
          A_dc_rd_data <= M_dc_rd_data;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_actual_tag <= 0;
      else if (A_en)
          A_dc_actual_tag <= M_dc_actual_tag;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_hit <= 0;
      else if (A_en)
          A_dc_hit <= M_dc_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_valid_st_cache_hit <= 0;
      else if (A_en)
          A_dc_valid_st_cache_hit <= M_dc_valid_st_cache_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_valid_st_bypass_hit <= 0;
      else if (A_en)
          A_dc_valid_st_bypass_hit <= M_dc_valid_st_bypass_hit;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_potential_hazard_after_st <= 0;
      else if (A_en)
          A_dc_potential_hazard_after_st <= M_dc_potential_hazard_after_st;
    end


  assign M_ctrl_st_cache = M_ctrl_st_non_bypass & M_sel_data_master;
  assign M_ctrl_ld_st_cache = M_ctrl_ld_st_non_bypass & M_sel_data_master;
  assign E_mem_baddr_line_field = E_mem_baddr[10 : 5];
  assign E_mem_baddr_offset_field = E_mem_baddr[4 : 2];
  assign E_mem_baddr_line_offset_field = E_mem_baddr[10 : 2];
  assign E_mem_baddr_byte_field = E_mem_baddr[1 : 0];
  assign M_mem_baddr_line_field = M_mem_baddr[10 : 5];
  assign M_mem_baddr_offset_field = M_mem_baddr[4 : 2];
  assign M_mem_baddr_line_offset_field = M_mem_baddr[10 : 2];
  assign M_mem_baddr_byte_field = M_mem_baddr[1 : 0];
  assign A_mem_baddr_line_field = A_mem_baddr[10 : 5];
  assign A_mem_baddr_offset_field = A_mem_baddr[4 : 2];
  assign A_mem_baddr_line_offset_field = A_mem_baddr[10 : 2];
  assign A_mem_baddr_byte_field = A_mem_baddr[1 : 0];
  assign M_dc_st_wr_en = M_ctrl_st_cache & M_valid & A_en;
  assign A_dc_dcache_management_wr_en = (A_ctrl_dc_index_inv | (A_ctrl_dc_addr_inv & A_dc_hit)) &
    A_valid & A_en_d1;

  assign dc_tag_wr_port_data = (A_dc_fill_starting_d1)? {A_ctrl_st, dc_line_valid_on, A_dc_desired_tag} :
    (A_dc_dcache_management_wr_en)? {dc_line_dirty_off, dc_line_valid_off, M_dc_desired_tag} :
    {dc_line_dirty_on,  dc_line_valid_on,  M_dc_desired_tag};

  assign dc_tag_wr_port_addr = ((A_dc_fill_starting_d1 | A_dc_dcache_management_wr_en))? A_mem_baddr_line_field :
    M_mem_baddr_line_field;

  assign dc_tag_wr_port_en = A_dc_fill_starting_d1 | 
    A_dc_dcache_management_wr_en | M_dc_st_wr_en;

  assign dc_line_dirty_on = 1'b1;
  assign dc_line_dirty_off = 1'b0;
  assign dc_line_valid_on = 1'b1;
  assign dc_line_valid_off = 1'b0;
  assign M_dc_tag_entry = dc_tag_rd_port_data;
  assign M_dc_dirty_raw = M_dc_tag_entry[17];
  assign M_dc_valid = M_dc_tag_entry[16];
  assign M_dc_actual_tag = M_dc_tag_entry[15 : 0];
  assign dc_tag_rd_port_addr = M_en                   ? E_mem_baddr_line_field : 
    M_mem_baddr_line_field;

//sopc_nios2_0_dc_tag, which is an nios_sdp_ram
sopc_nios2_0_dc_tag_module sopc_nios2_0_dc_tag
  (
    .clock     (clk),
    .data      (dc_tag_wr_port_data),
    .q         (dc_tag_rd_port_data),
    .rdaddress (dc_tag_rd_port_addr),
    .wraddress (dc_tag_wr_port_addr),
    .wren      (dc_tag_wr_port_en)
  );

//synthesis translate_off
`ifdef NO_PLI
defparam sopc_nios2_0_dc_tag.lpm_file = "sopc_nios2_0_dc_tag_ram.dat";
`else
defparam sopc_nios2_0_dc_tag.lpm_file = "sopc_nios2_0_dc_tag_ram.hex";
`endif
//synthesis translate_on
//synthesis read_comments_as_HDL on
//defparam sopc_nios2_0_dc_tag.lpm_file = "sopc_nios2_0_dc_tag_ram.mif";
//synthesis read_comments_as_HDL off
  assign M_dc_desired_tag = M_mem_baddr[26 : 11];
  assign A_dc_desired_tag = A_mem_baddr[26 : 11];
  assign M_dc_tag_match = M_dc_desired_tag == M_dc_actual_tag;
  assign M_dc_hit = M_dc_tag_match & M_dc_valid;
  assign M_dc_dirty = M_dc_dirty_raw | (M_A_dc_line_match & A_dc_valid_st_cache_hit);
  assign dc_data_rd_port_line_field = M_en                     ? E_mem_baddr_line_field : 
    A_dc_xfer_rd_addr_active ? A_mem_baddr_line_field :
    M_mem_baddr_line_field;

  assign dc_data_rd_port_offset_field = M_en                      ? E_mem_baddr_offset_field : 
    A_dc_xfer_rd_addr_active  ? A_dc_xfer_rd_addr_offset :
    M_mem_baddr_offset_field;

  assign dc_data_rd_port_addr = {dc_data_rd_port_line_field, dc_data_rd_port_offset_field};
  assign M_dc_rd_data = dc_data_rd_port_data;
  assign M_st_dc_wr_en = M_ctrl_st_cache & M_valid & A_en;
  assign dc_data_wr_port_data = A_dc_fill_active               ? A_dc_fill_wr_data : 
    A_dc_valid_st_bypass_hit_wr_en ? A_st_data :
    M_st_data;

  assign dc_data_wr_port_byte_en = A_dc_fill_active               ? A_dc_fill_byte_en : 
    A_dc_valid_st_bypass_hit_wr_en ? A_mem_byte_en :
    M_mem_byte_en;

  assign dc_data_wr_port_addr = A_dc_fill_active               ? 
    { A_mem_baddr_line_field, A_dc_fill_dp_offset } : 
    A_dc_valid_st_bypass_hit_wr_en ? A_mem_baddr_line_offset_field :
    M_mem_baddr_line_offset_field;

  assign dc_data_wr_port_en = (A_dc_fill_active ? d_readdatavalid_d1 : M_st_dc_wr_en) |
    A_dc_valid_st_bypass_hit_wr_en;

//sopc_nios2_0_dc_data, which is an nios_sdp_ram
sopc_nios2_0_dc_data_module sopc_nios2_0_dc_data
  (
    .byteenable (dc_data_wr_port_byte_en),
    .clock      (clk),
    .data       (dc_data_wr_port_data),
    .q          (dc_data_rd_port_data),
    .rdaddress  (dc_data_rd_port_addr),
    .wraddress  (dc_data_wr_port_addr),
    .wren       (dc_data_wr_port_en)
  );

  assign E_M_dc_line_offset_match = E_mem_baddr_line_offset_field == M_mem_baddr_line_offset_field;
  assign M_A_dc_line_match = M_mem_baddr_line_field == A_mem_baddr_line_field;
  assign M_dc_valid_st_cache_hit = M_valid & M_ctrl_st_cache & M_dc_hit;
  assign M_dc_valid_st_bypass_hit = M_valid & M_ctrl_st_bypass & M_dc_hit;
  assign M_dc_want_fill = M_valid & M_ctrl_ld_st_cache & ~M_dc_hit;
  assign A_dc_fill_starting = A_dc_want_fill & ~A_dc_fill_has_started & ~A_dc_wb_active;
  assign A_dc_fill_has_started_nxt = A_en ? 1'b0 : (A_dc_fill_starting | A_dc_fill_has_started);
  assign A_dc_fill_need_extra_stall_nxt = M_valid_mem_d1 & M_A_dc_line_match_d1 & 
    M_mem_baddr_offset_field == 7;

  assign A_dc_fill_done = A_dc_fill_need_extra_stall ? 
    A_dc_rd_last_transfer_d1 : 
    A_dc_rd_last_transfer;

  assign A_dc_fill_active_nxt = A_dc_fill_active ? ~A_dc_fill_done : A_dc_fill_starting;
  assign A_dc_fill_want_dmaster = A_dc_fill_starting | A_dc_fill_active;
  assign A_dc_fill_dp_offset_nxt = A_dc_fill_starting ? 0 : (A_dc_fill_dp_offset + 1);
  assign A_dc_fill_dp_offset_en = A_dc_fill_starting | d_readdatavalid_d1;
  assign A_dc_fill_miss_offset_is_next = A_dc_fill_active & (A_dc_fill_dp_offset == A_mem_baddr_offset_field);
  assign A_dc_fill_byte_en = (A_ctrl_st & A_dc_fill_miss_offset_is_next) ? 
    ~A_mem_byte_en : 
    {4{1'b1}};

  assign A_dc_fill_wr_data = d_readdata_d1;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_want_fill <= 0;
      else if (A_en)
          A_dc_want_fill <= M_dc_want_fill;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_fill_has_started <= 0;
      else 
        A_dc_fill_has_started <= A_dc_fill_has_started_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_fill_active <= 0;
      else 
        A_dc_fill_active <= A_dc_fill_active_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_fill_dp_offset <= 0;
      else if (A_dc_fill_dp_offset_en)
          A_dc_fill_dp_offset <= A_dc_fill_dp_offset_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_fill_starting_d1 <= 0;
      else 
        A_dc_fill_starting_d1 <= A_dc_fill_starting;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_valid_mem_d1 <= 0;
      else 
        M_valid_mem_d1 <= M_ctrl_ld_st & M_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_A_dc_line_match_d1 <= 0;
      else 
        M_A_dc_line_match_d1 <= M_A_dc_line_match;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_fill_need_extra_stall <= 0;
      else 
        A_dc_fill_need_extra_stall <= A_dc_fill_need_extra_stall_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_rd_last_transfer_d1 <= 0;
      else 
        A_dc_rd_last_transfer_d1 <= A_dc_rd_last_transfer;
    end


  assign A_dc_wb_active_nxt = A_dc_wb_active ? ~A_dc_wr_last_transfer : A_dc_xfer_rd_addr_starting;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_wb_active <= 0;
      else 
        A_dc_wb_active <= A_dc_wb_active_nxt;
    end


//sopc_nios2_0_dc_victim, which is an nios_sdp_ram
sopc_nios2_0_dc_victim_module sopc_nios2_0_dc_victim
  (
    .clock     (clk),
    .data      (A_dc_xfer_wr_data),
    .q         (A_dc_wb_rd_data),
    .rdaddress (A_dc_wb_rd_addr_offset),
    .rden      (A_dc_wb_rd_en),
    .wraddress (A_dc_xfer_wr_offset),
    .wren      (A_dc_xfer_wr_active)
  );

  assign A_dc_fill_want_xfer = A_dc_want_fill & A_dc_dirty;
  assign A_dc_index_wb_inv_want_xfer = A_ctrl_dc_index_wb_inv & A_valid & A_dc_dirty;
  assign A_dc_dc_addr_wb_inv_want_xfer = A_ctrl_dc_addr_wb_inv  & A_valid & A_dc_dirty & A_dc_hit;
  assign A_dc_want_xfer = A_dc_fill_want_xfer | A_dc_index_wb_inv_want_xfer | 
    A_dc_dc_addr_wb_inv_want_xfer;

  assign A_dc_xfer_rd_addr_starting = A_dc_want_xfer & ~A_dc_xfer_rd_addr_has_started & ~A_dc_wb_active;
  assign A_dc_xfer_rd_addr_has_started_nxt = A_en ? 1'b0 : 
    (A_dc_xfer_rd_addr_starting | A_dc_xfer_rd_addr_has_started);

  assign A_dc_xfer_rd_addr_done_nxt = A_dc_xfer_rd_addr_active & 
    (A_dc_xfer_rd_addr_offset == (7 - 1));

  assign A_dc_xfer_rd_addr_active_nxt = A_dc_xfer_rd_addr_active ? 
    ~A_dc_xfer_rd_addr_done : 
    A_dc_xfer_rd_addr_starting;

  assign A_dc_xfer_rd_addr_offset_nxt = A_dc_xfer_rd_addr_starting ? 0 : (A_dc_xfer_rd_addr_offset + 1);
  assign A_dc_xfer_rd_addr_offset_match = A_ctrl_st & (A_dc_xfer_rd_addr_offset == A_mem_baddr_offset_field);
  assign A_dc_xfer_wr_offset_starting = A_dc_xfer_wr_starting;
  assign A_dc_xfer_wr_offset_nxt = A_dc_xfer_wr_offset_starting          ? 0 : (A_dc_xfer_wr_offset + 1);
  assign A_dc_xfer_wr_data_nxt = A_dc_xfer_rd_data_offset_match ? 
    A_dc_rd_data :  
    dc_data_rd_port_data;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_dirty <= 0;
      else if (A_en)
          A_dc_dirty <= M_dc_dirty;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_xfer_rd_addr_has_started <= 0;
      else 
        A_dc_xfer_rd_addr_has_started <= A_dc_xfer_rd_addr_has_started_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_xfer_rd_addr_active <= 0;
      else 
        A_dc_xfer_rd_addr_active <= A_dc_xfer_rd_addr_active_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_xfer_rd_addr_done <= 0;
      else 
        A_dc_xfer_rd_addr_done <= A_dc_xfer_rd_addr_done_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_xfer_rd_addr_offset <= 0;
      else 
        A_dc_xfer_rd_addr_offset <= A_dc_xfer_rd_addr_offset_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_xfer_rd_data_starting <= 0;
      else 
        A_dc_xfer_rd_data_starting <= A_dc_xfer_rd_addr_starting;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_xfer_rd_data_active <= 0;
      else 
        A_dc_xfer_rd_data_active <= A_dc_xfer_rd_addr_active;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_xfer_rd_data_offset_match <= 0;
      else 
        A_dc_xfer_rd_data_offset_match <= A_dc_xfer_rd_addr_offset_match;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_xfer_wr_starting <= 0;
      else 
        A_dc_xfer_wr_starting <= A_dc_xfer_rd_data_starting;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_xfer_wr_active <= 0;
      else 
        A_dc_xfer_wr_active <= A_dc_xfer_rd_data_active;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_xfer_wr_offset <= 0;
      else 
        A_dc_xfer_wr_offset <= A_dc_xfer_wr_offset_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_xfer_wr_data <= 0;
      else 
        A_dc_xfer_wr_data <= A_dc_xfer_wr_data_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_wb_tag <= 0;
      else if (A_dc_xfer_rd_data_starting)
          A_dc_wb_tag <= A_dc_actual_tag;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_wb_line <= 0;
      else if (A_dc_xfer_rd_data_starting)
          A_dc_wb_line <= A_mem_baddr_line_field;
    end


  assign A_dc_wb_rd_en = A_dc_wb_rd_addr_starting | A_dc_wb_rd_data_starting | A_dc_wb_wr_starting | 
    av_wr_data_transfer;

  assign A_dc_wb_wr_starting = A_dc_wb_rd_data_first & ~d_read;
  assign A_dc_wb_wr_active_nxt = A_dc_wb_wr_active ? ~A_dc_wr_last_transfer : A_dc_wb_wr_starting;
  assign A_dc_wb_wr_want_dmaster = A_dc_wb_wr_starting | A_dc_wb_wr_active;
  assign A_dc_wb_rd_data_first_nxt = A_dc_wb_rd_data_first ? ~A_dc_wb_wr_starting : A_dc_wb_rd_data_starting;
  assign A_dc_wb_update_av_writedata = A_dc_wb_wr_starting | 
    (A_dc_wb_wr_active & ~A_dc_wr_last_driven & ~d_waitrequest);

  assign A_dc_wb_rd_addr_offset_nxt = A_dc_wb_rd_addr_starting ? 0 : (A_dc_wb_rd_addr_offset + 1);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_wb_rd_addr_starting <= 0;
      else 
        A_dc_wb_rd_addr_starting <= A_dc_xfer_wr_starting;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_wb_rd_addr_offset <= 0;
      else if (A_dc_wb_rd_en)
          A_dc_wb_rd_addr_offset <= A_dc_wb_rd_addr_offset_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_wb_rd_data_starting <= 0;
      else 
        A_dc_wb_rd_data_starting <= A_dc_wb_rd_addr_starting;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_wb_wr_active <= 0;
      else 
        A_dc_wb_wr_active <= A_dc_wb_wr_active_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_wb_rd_data_first <= 0;
      else 
        A_dc_wb_rd_data_first <= A_dc_wb_rd_data_first_nxt;
    end


  assign A_dc_index_wb_inv_done_nxt = ~A_dc_dirty | A_dc_xfer_rd_addr_done;
  assign A_dc_dc_addr_wb_inv_done_nxt = ~A_dc_dirty | A_dc_xfer_rd_addr_done | ~A_dc_hit;
  assign A_dc_dcache_management_done_nxt = A_valid & ~A_en &
    (A_ctrl_dc_nowb_inv |
    (A_ctrl_dc_index_wb_inv & A_dc_index_wb_inv_done_nxt) |
    ((A_ctrl_dc_addr_wb_inv ) & A_dc_dc_addr_wb_inv_done_nxt));

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_dcache_management_done <= 0;
      else 
        A_dc_dcache_management_done <= A_dc_dcache_management_done_nxt;
    end


  assign M_dc_want_mem_bypass_or_dcache_management = M_valid & M_ctrl_ld_st_bypass_or_dcache_management;
  assign A_ld_bypass_done = A_dc_rd_last_transfer;
  assign A_st_bypass_transfer_done = A_dc_wr_last_transfer & ~A_dc_wb_active;
  assign A_st_bypass_done = A_dc_valid_st_bypass_hit ? 
    A_st_bypass_transfer_done_d1 :
    A_st_bypass_transfer_done;

  assign A_mem_bypass_pending = A_ctrl_ld_st_bypass & A_valid & ~A_en;
  assign A_dc_valid_st_bypass_hit_wr_en = A_dc_valid_st_bypass_hit & A_en_d1;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ld_bypass_delayed <= 0;
      else if (A_en)
          A_ld_bypass_delayed <= M_ctrl_ld_bypass & M_valid & A_dc_wb_active;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_st_bypass_delayed <= 0;
      else if (A_en)
          A_st_bypass_delayed <= M_ctrl_st_bypass & M_valid & A_dc_wb_active;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ld_bypass_delayed_started <= 0;
      else 
        A_ld_bypass_delayed_started <= A_en ? 0 : 
                ((A_ld_bypass_delayed & ~A_dc_wb_active) | 
                A_ld_bypass_delayed_started);

    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_st_bypass_delayed_started <= 0;
      else 
        A_st_bypass_delayed_started <= A_en ? 0 : 
                ((A_st_bypass_delayed & ~A_dc_wb_active) | 
                A_st_bypass_delayed_started);

    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_st_bypass_transfer_done_d1 <= 0;
      else 
        A_st_bypass_transfer_done_d1 <= A_st_bypass_transfer_done;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_en_d1 <= 0;
      else 
        A_en_d1 <= A_en;
    end


  assign d_address_tag_field_nxt = A_dc_wb_wr_want_dmaster                         ? A_dc_wb_tag : 
    (A_dc_fill_want_dmaster | A_mem_bypass_pending) ? A_dc_desired_tag :
    M_dc_desired_tag;

  assign d_address_line_field_nxt = A_dc_wb_wr_want_dmaster                         ? 
    A_dc_wb_line : 
    (A_dc_fill_want_dmaster | A_mem_bypass_pending) ? 
    A_mem_baddr_line_field :
    M_mem_baddr_line_field;

  assign d_address_byte_field_nxt = (A_dc_wb_wr_want_dmaster | A_dc_fill_want_dmaster) ? 0 : 
    A_mem_bypass_pending                      ? A_mem_baddr_byte_field :
    M_mem_baddr_byte_field;

  assign d_byteenable_nxt = (A_dc_wb_wr_want_dmaster | A_dc_fill_want_dmaster) ? {4{1'b1}} : 
    A_mem_bypass_pending                               ? A_mem_byte_en :
    M_mem_byte_en;

  assign d_writedata_nxt = A_dc_wb_update_av_writedata                 ? A_dc_wb_rd_data : 
    A_dc_wb_wr_active                           ? d_writedata :
    A_mem_bypass_pending                        ? A_st_data :
    M_st_data;

  assign d_write_nxt = A_dc_wb_wr_starting |
    (M_ctrl_st_bypass & M_valid & A_en & ~A_dc_wb_active) | 
    (A_st_bypass_delayed & ~A_st_bypass_delayed_started & 
    ~A_dc_wb_active) |
    (d_write & (d_waitrequest | ~A_dc_wr_last_driven));

  assign d_address = {d_address_tag_field, 
    d_address_line_field[5 : 0],
    d_address_offset_field,
    d_address_byte_field};

  assign M_dc_potential_hazard_after_st_unfiltered = E_M_dc_line_offset_match & M_ctrl_st_cache & M_valid & 
    E_ctrl_mem & E_valid;

  assign A_mem_stall_start_nxt = A_en & (M_dc_want_fill|M_dc_want_mem_bypass_or_dcache_management|M_dc_potential_hazard_after_st);
  assign A_mem_stall_stop_nxt = (A_dc_fill_active & A_dc_fill_done)|(A_dc_dcache_management_done)|(A_ctrl_ld_bypass & A_ld_bypass_done)|(A_ctrl_st_bypass & A_st_bypass_done)|(A_dc_potential_hazard_after_st & A_dc_valid_st_cache_hit);
  assign A_mem_stall_nxt = A_mem_stall ? ~A_mem_stall_stop_nxt : A_mem_stall_start_nxt;
  assign A_dc_rd_data_cnt_nxt = d_readdatavalid_d1 ? (A_dc_rd_data_cnt + 1) :
    A_dc_fill_starting ? 1 :
    A_dc_fill_active   ? A_dc_rd_data_cnt :
    8;

  assign A_dc_rd_last_transfer = A_dc_rd_data_cnt[3] & d_readdatavalid_d1;
  assign av_wr_data_transfer = d_write & ~d_waitrequest;
  assign A_dc_wr_data_cnt_nxt = av_wr_data_transfer ? (A_dc_wr_data_cnt + 1) :
    A_dc_wb_wr_starting ? 1 :
    A_dc_wb_wr_active   ? A_dc_wr_data_cnt :
    8;

  assign A_dc_wr_last_driven = A_dc_wr_data_cnt[3];
  assign A_dc_wr_last_transfer = A_dc_wr_last_driven & d_write & ~d_waitrequest;
  assign av_addr_accepted = (d_read | d_write) & ~d_waitrequest;
  assign d_address_offset_field_nxt = av_addr_accepted ? (d_address_offset_field + 1) :
    (A_dc_wb_wr_starting | A_dc_fill_starting) ? 0 :
    (A_dc_wb_wr_active | A_dc_fill_active) ? d_address_offset_field :
    A_mem_bypass_pending                ? A_mem_baddr_offset_field :
    M_mem_baddr_offset_field;

  assign d_read_nxt = A_dc_fill_starting |
    (M_ctrl_ld_bypass & M_valid & A_en & ~A_dc_wb_active) | 
    (A_ld_bypass_delayed & ~A_ld_bypass_delayed_started & 
    ~A_dc_wb_active) |
    (d_read & (d_waitrequest | ~A_dc_rd_last_driven));

  assign av_rd_addr_accepted = d_read & ~d_waitrequest;
  assign A_dc_rd_addr_cnt_nxt = av_rd_addr_accepted ? (A_dc_rd_addr_cnt + 1) :
    A_dc_fill_starting  ? 1 :
    A_dc_fill_active    ? A_dc_rd_addr_cnt :
    8;

  assign A_dc_rd_last_driven = A_dc_rd_addr_cnt[3];
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_rd_addr_cnt <= 0;
      else 
        A_dc_rd_addr_cnt <= A_dc_rd_addr_cnt_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_address_tag_field <= 0;
      else 
        d_address_tag_field <= d_address_tag_field_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_address_line_field <= 0;
      else 
        d_address_line_field <= d_address_line_field_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_address_offset_field <= 0;
      else 
        d_address_offset_field <= d_address_offset_field_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_address_byte_field <= 0;
      else 
        d_address_byte_field <= d_address_byte_field_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_byteenable <= 0;
      else 
        d_byteenable <= d_byteenable_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_writedata <= 0;
      else 
        d_writedata <= d_writedata_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mem_stall <= 0;
      else 
        A_mem_stall <= A_mem_stall_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_rd_data_cnt <= 0;
      else 
        A_dc_rd_data_cnt <= A_dc_rd_data_cnt_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dc_wr_data_cnt <= 0;
      else 
        A_dc_wr_data_cnt <= A_dc_wr_data_cnt_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_readdata_d1 <= 0;
      else 
        d_readdata_d1 <= d_readdata;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_write <= 0;
      else 
        d_write <= d_write_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_read <= 0;
      else 
        d_read <= d_read_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d_readdatavalid_d1 <= 0;
      else 
        d_readdatavalid_d1 <= d_readdatavalid;
    end


  assign A_slow_ld_data_unaligned = d_readdata_d1;
  assign A_slow_ld_data_sign_bit_16 = A_mem_baddr[1]  ? 
    {A_slow_ld_data_unaligned[31], A_slow_ld_data_unaligned[23]} : 
    {A_slow_ld_data_unaligned[15], A_slow_ld_data_unaligned[7]};

  assign A_slow_ld_data_fill_bit = A_slow_ld_data_sign_bit & A_ctrl_ld_signed;
  assign A_slow_ld_data_sign_bit = ((A_mem_baddr[0]) | A_ctrl_ld16) ? 
    A_slow_ld_data_sign_bit_16[1] : A_slow_ld_data_sign_bit_16[0];

  assign A_slow_ld16_data = A_ld_align_sh16 ? 
    A_slow_ld_data_unaligned[31 : 16] :
    A_slow_ld_data_unaligned[15 : 0];

  assign A_slow_ld_byte0_data_aligned_nxt = A_ld_align_sh8 ? 
    A_slow_ld16_data[15 : 8] :
    A_slow_ld16_data[7 : 0];

  assign A_slow_ld_byte1_data_aligned_nxt = A_ld_align_byte1_fill ? 
    {8 {A_slow_ld_data_fill_bit}} : 
    A_slow_ld16_data[15 : 8];

  assign A_slow_ld_byte2_data_aligned_nxt = A_ld_align_byte2_byte3_fill ? 
    {8 {A_slow_ld_data_fill_bit}} : 
    A_slow_ld_data_unaligned[23 : 16];

  assign A_slow_ld_byte3_data_aligned_nxt = A_ld_align_byte2_byte3_fill ? 
    {8 {A_slow_ld_data_fill_bit}} : 
    A_slow_ld_data_unaligned[31 : 24];

  assign A_slow_ld_data_aligned_nxt = {A_slow_ld_byte3_data_aligned_nxt, A_slow_ld_byte2_data_aligned_nxt, 
    A_slow_ld_byte1_data_aligned_nxt, A_slow_ld_byte0_data_aligned_nxt};

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_data_ram_ld_align_sign_bit_16_hi <= 0;
      else if (M_en)
          M_data_ram_ld_align_sign_bit_16_hi <= (E_mem_baddr[0]) | E_ctrl_ld16;
    end


  assign M_data_ram_ld_align_sign_bit_16 = M_mem_baddr[1] ? 
    {M_ram_rd_data[31], M_ram_rd_data[23]} : 
    {M_ram_rd_data[15], M_ram_rd_data[7]};

  assign M_data_ram_ld_align_sign_bit = M_data_ram_ld_align_sign_bit_16_hi ?
    M_data_ram_ld_align_sign_bit_16[1] : 
    M_data_ram_ld_align_sign_bit_16[0];

  assign A_data_ram_ld_align_fill_bit = A_data_ram_ld_align_sign_bit & A_ctrl_ld_signed;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_data_ram_ld_align_sign_bit <= 0;
      else if (A_en)
          A_data_ram_ld_align_sign_bit <= M_data_ram_ld_align_sign_bit;
    end


  assign A_data_ram_ld16_data = A_ld_align_sh16 ? 
    A_inst_result[31 : 16] :
    A_inst_result[15 : 0];

  assign A_data_ram_ld_byte0_data = A_ld_align_sh8 ? 
    A_data_ram_ld16_data[15 : 8] :
    A_data_ram_ld16_data[7 : 0];

  assign A_data_ram_ld_byte1_data = A_ld_align_byte1_fill ? 
    {8 {A_data_ram_ld_align_fill_bit}} : 
    A_data_ram_ld16_data[15 : 8];

  assign A_data_ram_ld_byte2_data = A_ld_align_byte2_byte3_fill ? 
    {8 {A_data_ram_ld_align_fill_bit}} : 
    A_inst_result[23 : 16];

  assign A_data_ram_ld_byte3_data = A_ld_align_byte2_byte3_fill ? 
    {8 {A_data_ram_ld_align_fill_bit}} : 
    A_inst_result[31 : 24];

  assign A_inst_result_aligned = {A_data_ram_ld_byte3_data, A_data_ram_ld_byte2_data, 
    A_data_ram_ld_byte1_data, A_data_ram_ld_byte0_data};

  assign E_arith_src1 = { E_src1[31] ^ E_ctrl_alu_signed_comparison, 
    E_src1[30 : 0]};

  assign E_arith_src2 = { E_src2[31] ^ E_ctrl_alu_signed_comparison, 
    E_src2[30 : 0]};

  assign E_arith_result = E_ctrl_alu_subtract ?
    E_arith_src1 - E_arith_src2 :
    E_arith_src1 + E_arith_src2;

  assign E_mem_baddr = E_arith_result[26 : 0];
  assign E_logic_result = (E_logic_op == 2'b00)? (~(E_src1 | E_src2)) :
    (E_logic_op == 2'b01)? (E_src1 & E_src2) :
    (E_logic_op == 2'b10)? (E_src1 | E_src2) :
    (E_src1 ^ E_src2);

  assign E_eq = E_src1_eq_src2;
  assign E_lt = E_arith_result[32];
  assign E_cmp_result = (E_compare_op == 2'b00)? E_eq :
    (E_compare_op == 2'b01)? ~E_lt :
    (E_compare_op == 2'b10)? E_lt :
    ~E_eq;

  assign E_br_result = E_cmp_result;
  assign E_alu_result = ({32 {E_ctrl_cmp}} & E_cmp_result) |
    ({32 {E_ctrl_logic}} & E_logic_result) |
    ({32 {E_ctrl_retaddr}} & {E_extra_pc, 2'b00}) |
    ({32 {(~(E_ctrl_cmp)) && (~(E_ctrl_logic)) && (~(E_ctrl_retaddr))}} & E_arith_result[31 : 0]);

  assign E_sth_data = E_src2_reg[15 : 0];
  assign E_stw_data = E_src2_reg[31 : 0];
  assign E_stb_data = E_src2_reg[7 : 0];
  assign E_st_data = (E_mem8)? {E_stb_data, E_stb_data, E_stb_data, E_stb_data} :
    (E_mem16)? {E_sth_data, E_sth_data} :
    E_stw_data;

  assign E_mem_byte_en = ({E_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b00})? 4'b0001 :
    ({E_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b01})? 4'b0010 :
    ({E_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b10})? 4'b0100 :
    ({E_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b11})? 4'b1000 :
    ({E_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b00})? 4'b0011 :
    ({E_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b01})? 4'b0011 :
    ({E_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b10})? 4'b1100 :
    ({E_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b11})? 4'b1100 :
    4'b1111;

  assign A_status_reg_pie_inst_nxt = (M_ctrl_exception | M_ctrl_break |
    M_ctrl_crst)      ? 1'b0 :
    M_op_eret         ? A_estatus_reg[0] :
    M_op_bret         ? A_bstatus_reg[0] :
    M_wrctl_status    ? M_wrctl_data_status_reg_pie :
    A_status_reg_pie;

  assign A_estatus_reg_pie_inst_nxt = M_ctrl_crst       ? 0 :
    M_ctrl_exception  ? A_status_reg_pie :
    M_wrctl_estatus   ? M_wrctl_data_estatus_reg_pie :
    A_estatus_reg_pie;

  assign A_bstatus_reg_pie_inst_nxt = M_ctrl_break      ? A_status_reg_pie :
    M_wrctl_bstatus   ? M_wrctl_data_bstatus_reg_pie :
    A_bstatus_reg_pie;

  assign M_wrctl_status = M_ctrl_wrctl_inst & (M_iw_control_regnum == 0);
  assign M_wrctl_estatus = M_ctrl_wrctl_inst & (M_iw_control_regnum == 1);
  assign M_wrctl_bstatus = M_ctrl_wrctl_inst & (M_iw_control_regnum == 2);
  assign M_wrctl_ienable = M_ctrl_wrctl_inst & (M_iw_control_regnum == 3);
  assign M_wrctl_data_status_reg_pie = M_alu_result[0];
  assign M_wrctl_data_estatus_reg_pie = M_alu_result[0];
  assign M_wrctl_data_bstatus_reg_pie = M_alu_result[0];
  assign M_wrctl_data_ienable_reg_irq0 = M_alu_result[0];
  assign M_wrctl_data_ienable_reg_irq1 = M_alu_result[1];
  assign M_wrctl_data_ienable_reg_irq2 = M_alu_result[2];
  assign M_wrctl_data_ienable_reg_irq3 = M_alu_result[3];
  assign M_wrctl_data_ienable_reg_irq4 = M_alu_result[4];
  assign A_status_reg_pie_nxt = M_valid           ? A_status_reg_pie_inst_nxt : 
    A_status_reg_pie;

  assign A_status_reg_pie_wr_en = A_en;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_status_reg_pie <= 0;
      else if (A_status_reg_pie_wr_en)
          A_status_reg_pie <= A_status_reg_pie_nxt;
    end


  assign A_estatus_reg_pie_nxt = M_valid ? A_estatus_reg_pie_inst_nxt : 
    A_estatus_reg_pie;

  assign A_estatus_reg_pie_wr_en = A_en;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_estatus_reg_pie <= 0;
      else if (A_estatus_reg_pie_wr_en)
          A_estatus_reg_pie <= A_estatus_reg_pie_nxt;
    end


  assign A_bstatus_reg_pie_nxt = M_valid ? A_bstatus_reg_pie_inst_nxt : 
    A_bstatus_reg_pie;

  assign A_bstatus_reg_pie_wr_en = A_en;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_bstatus_reg_pie <= 0;
      else if (A_bstatus_reg_pie_wr_en)
          A_bstatus_reg_pie <= A_bstatus_reg_pie_nxt;
    end


  assign A_ienable_reg_irq0_nxt = (M_wrctl_ienable & M_valid) ? 
    M_wrctl_data_ienable_reg_irq0 :
    A_ienable_reg_irq0;

  assign A_ienable_reg_irq0_wr_en = A_en;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ienable_reg_irq0 <= 0;
      else if (A_ienable_reg_irq0_wr_en)
          A_ienable_reg_irq0 <= A_ienable_reg_irq0_nxt;
    end


  assign A_ienable_reg_irq1_nxt = (M_wrctl_ienable & M_valid) ? 
    M_wrctl_data_ienable_reg_irq1 :
    A_ienable_reg_irq1;

  assign A_ienable_reg_irq1_wr_en = A_en;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ienable_reg_irq1 <= 0;
      else if (A_ienable_reg_irq1_wr_en)
          A_ienable_reg_irq1 <= A_ienable_reg_irq1_nxt;
    end


  assign A_ienable_reg_irq2_nxt = (M_wrctl_ienable & M_valid) ? 
    M_wrctl_data_ienable_reg_irq2 :
    A_ienable_reg_irq2;

  assign A_ienable_reg_irq2_wr_en = A_en;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ienable_reg_irq2 <= 0;
      else if (A_ienable_reg_irq2_wr_en)
          A_ienable_reg_irq2 <= A_ienable_reg_irq2_nxt;
    end


  assign A_ienable_reg_irq3_nxt = (M_wrctl_ienable & M_valid) ? 
    M_wrctl_data_ienable_reg_irq3 :
    A_ienable_reg_irq3;

  assign A_ienable_reg_irq3_wr_en = A_en;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ienable_reg_irq3 <= 0;
      else if (A_ienable_reg_irq3_wr_en)
          A_ienable_reg_irq3 <= A_ienable_reg_irq3_nxt;
    end


  assign A_ienable_reg_irq4_nxt = (M_wrctl_ienable & M_valid) ? 
    M_wrctl_data_ienable_reg_irq4 :
    A_ienable_reg_irq4;

  assign A_ienable_reg_irq4_wr_en = A_en;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ienable_reg_irq4 <= 0;
      else if (A_ienable_reg_irq4_wr_en)
          A_ienable_reg_irq4 <= A_ienable_reg_irq4_nxt;
    end


  assign A_ipending_reg_irq0_nxt = d_irq[0] & A_ienable_reg_irq0 & oci_ienable[0];
  assign A_ipending_reg_irq0_wr_en = 1;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ipending_reg_irq0 <= 0;
      else if (A_ipending_reg_irq0_wr_en)
          A_ipending_reg_irq0 <= A_ipending_reg_irq0_nxt;
    end


  assign A_ipending_reg_irq1_nxt = d_irq[1] & A_ienable_reg_irq1 & oci_ienable[1];
  assign A_ipending_reg_irq1_wr_en = 1;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ipending_reg_irq1 <= 0;
      else if (A_ipending_reg_irq1_wr_en)
          A_ipending_reg_irq1 <= A_ipending_reg_irq1_nxt;
    end


  assign A_ipending_reg_irq2_nxt = d_irq[2] & A_ienable_reg_irq2 & oci_ienable[2];
  assign A_ipending_reg_irq2_wr_en = 1;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ipending_reg_irq2 <= 0;
      else if (A_ipending_reg_irq2_wr_en)
          A_ipending_reg_irq2 <= A_ipending_reg_irq2_nxt;
    end


  assign A_ipending_reg_irq3_nxt = d_irq[3] & A_ienable_reg_irq3 & oci_ienable[3];
  assign A_ipending_reg_irq3_wr_en = 1;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ipending_reg_irq3 <= 0;
      else if (A_ipending_reg_irq3_wr_en)
          A_ipending_reg_irq3 <= A_ipending_reg_irq3_nxt;
    end


  assign A_ipending_reg_irq4_nxt = d_irq[4] & A_ienable_reg_irq4 & oci_ienable[4];
  assign A_ipending_reg_irq4_wr_en = 1;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ipending_reg_irq4 <= 0;
      else if (A_ipending_reg_irq4_wr_en)
          A_ipending_reg_irq4 <= A_ipending_reg_irq4_nxt;
    end


  assign A_status_reg = { 31'd0, A_status_reg_pie };
  assign A_estatus_reg = { 31'd0, A_estatus_reg_pie };
  assign A_bstatus_reg = { 31'd0, A_bstatus_reg_pie };
  assign A_ienable_reg = { 27'd0, A_ienable_reg_irq4, A_ienable_reg_irq3, A_ienable_reg_irq2, A_ienable_reg_irq1, A_ienable_reg_irq0 };
  assign A_ipending_reg = { 27'd0, A_ipending_reg_irq4, A_ipending_reg_irq3, A_ipending_reg_irq2, A_ipending_reg_irq1, A_ipending_reg_irq0 };
  assign A_cpuid_reg = { 31'd0, 1'd0 };
  assign D_control_reg_rddata_muxed = (D_iw_control_regnum == 3'd0)? A_status_reg :
    (D_iw_control_regnum == 3'd1)? A_estatus_reg :
    (D_iw_control_regnum == 3'd2)? A_bstatus_reg :
    (D_iw_control_regnum == 3'd3)? A_ienable_reg :
    (D_iw_control_regnum == 3'd4)? A_ipending_reg :
    A_cpuid_reg;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_control_reg_rddata <= 0;
      else if (E_en)
          E_control_reg_rddata <= D_control_reg_rddata_muxed;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_control_reg_rddata <= 0;
      else if (M_en)
          M_control_reg_rddata <= E_control_reg_rddata;
    end


  assign M_rdctl_data = M_control_reg_rddata;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          hbreak_enabled <= 1'b1;
      else if (M_valid & M_en)
          hbreak_enabled <= M_ctrl_break ? 1'b0 : M_op_bret ? 1'b1 : hbreak_enabled;
    end


  assign oci_tb_hbreak_req = oci_hbreak_req;
  assign hbreak_req = (oci_tb_hbreak_req | latched_oci_tb_hbreak_req) 
    & hbreak_enabled   
    & ~(wait_for_one_post_bret_inst);

  assign E_hbreak_req = hbreak_req & 
    ~(E_op_hbreak & E_valid_prior_to_hbreak);

  assign latched_oci_tb_hbreak_req_next = latched_oci_tb_hbreak_req ? 
    hbreak_enabled : 
    (hbreak_req & E_valid_prior_to_hbreak);

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          latched_oci_tb_hbreak_req <= 1'b0;
      else 
        latched_oci_tb_hbreak_req <= latched_oci_tb_hbreak_req_next;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          wait_for_one_post_bret_inst <= 1'b0;
      else 
        wait_for_one_post_bret_inst <= (~hbreak_enabled & oci_single_step_mode) ? 1'b1 
                : ((E_en & E_valid_prior_to_hbreak) | 
                (~oci_single_step_mode))             ? 1'b0 
                : wait_for_one_post_bret_inst;

    end


  assign D_pcb = {D_pc, 2'b00};
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_pcb <= 0;
      else if (E_en)
          E_pcb <= D_pcb;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_pcb <= 0;
      else if (M_en)
          M_pcb <= E_pcb;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_pcb <= 0;
      else if (A_en)
          A_pcb <= M_pcb;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_pcb <= 0;
      else 
        W_pcb <= A_pcb;
    end


  assign D_stall = D_dep_stall | D_rdprs_stall | E_stall;
  assign D_en = ~D_stall;
  assign D_dep_stall = D_data_depend & D_issue & ~M_pipe_flush;
  assign D_issue_rdprs = 0;
  assign D_rdprs_stall_unfiltered = D_issue_rdprs & ~D_rdprs_stall_done & ~M_pipe_flush;
  assign D_rdprs_stall_done_nxt = M_pipe_flush        ? 0 :
    D_rdprs_stall_done  ? E_stall :
    D_issue_rdprs;

  assign D_rdprs_stall = D_rdprs_stall_unfiltered;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_iw <= 0;
      else if (D_en)
          D_iw <= F_iw;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_pc <= 0;
      else if (D_en)
          D_pc <= F_pc;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_pc_plus_one <= 0;
      else if (D_en)
          D_pc_plus_one <= F_pc_plus_one;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_rdprs_stall_done <= 0;
      else 
        D_rdprs_stall_done <= D_rdprs_stall_done_nxt;
    end


  assign D_valid = D_issue & ~D_data_depend & ~D_rdprs_stall & ~M_pipe_flush;
  assign D_jmp_direct_target_waddr = D_iw[31 : 6];
  assign D_jmp_direct_target_baddr = {D_jmp_direct_target_waddr, 2'b00};
  assign D_extra_pc = D_br_pred_not_taken ? D_br_taken_waddr : 
    D_pc_plus_one;

  assign D_extra_pcb = {D_extra_pc, 2'b00};
  assign E_stall = M_stall;
  assign E_en = ~E_stall;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_valid_from_D <= 0;
      else if (E_en)
          E_valid_from_D <= D_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_iw <= 0;
      else if (E_en)
          E_iw <= D_iw;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_dst_regnum <= 0;
      else if (E_en)
          E_dst_regnum <= D_dst_regnum;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_wr_dst_reg_from_D <= 0;
      else if (E_en)
          E_wr_dst_reg_from_D <= D_wr_dst_reg;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_extra_pc <= 0;
      else if (E_en)
          E_extra_pc <= D_extra_pc;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_pc <= 0;
      else if (E_en)
          E_pc <= D_pc;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_valid_jmp_indirect <= 0;
      else if (E_en)
          E_valid_jmp_indirect <= D_ctrl_jmp_indirect & D_valid;
    end


  assign E_extra_pcb = {E_extra_pc, 2'b00};
  assign E_valid = E_valid_from_D & ~E_cancel;
  assign E_wr_dst_reg = E_wr_dst_reg_from_D & ~E_cancel;
  assign E_valid_prior_to_hbreak = E_valid_from_D & ~M_pipe_flush;
  assign E_cancel = M_pipe_flush | E_hbreak_req;
  assign M_pipe_flush_nxt = E_br_mispredict | 
    (E_valid & E_ctrl_flush_pipe_always) |
    (E_valid_prior_to_hbreak & E_hbreak_req);

  assign M_pipe_flush_waddr_nxt = E_hbreak_req        ? E_pc                       :
    E_ctrl_jmp_indirect ? E_src1[26 : 2]        :
    E_ctrl_crst         ? 0:
    E_ctrl_exception    ? 16777216:
    E_ctrl_break        ? 1032:
    E_extra_pc;

  assign M_pipe_flush_baddr_nxt = {M_pipe_flush_waddr_nxt, 2'b00};
  assign E_sel_data_master = 1'b1;
  assign M_stall = A_stall;
  assign M_en = ~M_stall;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_valid_from_E <= 0;
      else if (M_en)
          M_valid_from_E <= E_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_iw <= 0;
      else if (M_en)
          M_iw <= E_iw;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_mem_byte_en <= 0;
      else if (M_en)
          M_mem_byte_en <= E_mem_byte_en;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_alu_result <= 0;
      else if (M_en)
          M_alu_result <= E_alu_result;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_st_data <= 0;
      else if (M_en)
          M_st_data <= E_st_data;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_dst_regnum <= 0;
      else if (M_en)
          M_dst_regnum <= E_dst_regnum;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_cmp_result <= 0;
      else if (M_en)
          M_cmp_result <= E_cmp_result;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_wr_dst_reg_from_E <= 0;
      else if (M_en)
          M_wr_dst_reg_from_E <= E_wr_dst_reg;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_target_pcb <= 0;
      else if (M_en)
          M_target_pcb <= E_src1[26 : 0];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_pipe_flush <= 1'b1;
      else if (M_en)
          M_pipe_flush <= M_pipe_flush_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_pipe_flush_waddr <= 0;
      else if (M_en)
          M_pipe_flush_waddr <= M_pipe_flush_waddr_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_sel_data_master <= 0;
      else if (M_en)
          M_sel_data_master <= E_sel_data_master;
    end


  assign M_pipe_flush_baddr = {M_pipe_flush_waddr, 2'b00};
  assign M_mem_baddr = M_alu_result[26 : 0];
  assign M_exc_any = 1'b0;
  assign M_ram_rd_data = M_dc_rd_data;
  assign M_fwd_reg_data = M_alu_result;
  assign M_inst_result = (M_ctrl_rdctl_inst)? M_rdctl_data :
    (M_ctrl_mem)? M_ram_rd_data :
    M_alu_result;

  assign M_ld_align_sh16 = (M_ctrl_ld8 | M_ctrl_ld16) & M_mem_baddr[1] &
    ~M_exc_any;

  assign M_ld_align_sh8 = M_ctrl_ld8 & M_mem_baddr[0] &
    ~M_exc_any;

  assign M_ld_align_byte1_fill = M_ctrl_ld8 & ~M_exc_any;
  assign M_ld_align_byte2_byte3_fill = M_ctrl_ld8_ld16 & ~M_exc_any;
  assign M_cancel = 1'b0;
  assign M_valid = M_valid_from_E & ~M_cancel;
  assign M_wr_dst_reg_with_wrprs = M_wr_dst_reg_from_E;
  assign M_wr_dst_reg = M_wr_dst_reg_with_wrprs & ~M_cancel;
  assign A_stall = A_mem_stall|A_mul_stall|A_shift_rot_stall|A_ci_multi_stall;
  assign A_en = ~A_stall;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_valid <= 0;
      else if (A_en)
          A_valid <= M_valid;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_iw <= 0;
      else if (A_en)
          A_iw <= M_iw;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_inst_result <= 0;
      else if (A_en)
          A_inst_result <= M_inst_result;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mem_byte_en <= 0;
      else if (A_en)
          A_mem_byte_en <= M_mem_byte_en;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_st_data <= 0;
      else if (A_en)
          A_st_data <= M_st_data;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_dst_regnum_from_M <= 0;
      else if (A_en)
          A_dst_regnum_from_M <= M_dst_regnum;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ld_align_sh16 <= 0;
      else if (A_en)
          A_ld_align_sh16 <= M_ld_align_sh16;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ld_align_sh8 <= 0;
      else if (A_en)
          A_ld_align_sh8 <= M_ld_align_sh8;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ld_align_byte1_fill <= 0;
      else if (A_en)
          A_ld_align_byte1_fill <= M_ld_align_byte1_fill;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ld_align_byte2_byte3_fill <= 0;
      else if (A_en)
          A_ld_align_byte2_byte3_fill <= M_ld_align_byte2_byte3_fill;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_cmp_result <= 0;
      else if (A_en)
          A_cmp_result <= M_cmp_result;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mem_baddr <= 0;
      else if (A_en)
          A_mem_baddr <= M_mem_baddr;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_wr_dst_reg_from_M <= 1'b1;
      else if (A_en)
          A_wr_dst_reg_from_M <= M_wr_dst_reg;
    end


  assign A_pipe_flush = 1'b0;
  assign A_pipe_flush_waddr = 0;
  assign A_valid_crst = 0;
  assign A_slow_inst_result_en = A_ctrl_custom_multi|((A_dc_fill_miss_offset_is_next | A_ctrl_ld_bypass) &
    d_readdatavalid_d1);

  assign A_slow_inst_sel_nxt = A_en ? 0 : A_ctrl_custom_multi|A_ctrl_ld_bypass|A_dc_want_fill;
  assign A_slow_inst_result_nxt = (A_ctrl_custom_multi)? A_ci_multi_result :
    A_slow_ld_data_aligned_nxt;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_slow_inst_sel <= 0;
      else 
        A_slow_inst_sel <= A_slow_inst_sel_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_slow_inst_result <= 0;
      else if (A_slow_inst_result_en)
          A_slow_inst_result <= A_slow_inst_result_nxt;
    end


  assign A_wr_data_unfiltered = (A_ctrl_mul_lsw)? A_mul_result :
    (A_ctrl_shift_rot)? A_shift_rot_result :
    (~A_slow_inst_sel)? A_inst_result_aligned :
    A_slow_inst_result;

  assign A_fwd_reg_data = A_wr_data_filtered;
  assign A_wr_dst_reg = A_wr_dst_reg_from_M;
  assign A_dst_regnum = A_dst_regnum_from_M;
  assign W_en = 1'b1;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_wr_data <= 0;
      else 
        W_wr_data <= A_wr_data_filtered;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_iw <= 0;
      else 
        W_iw <= A_iw;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_valid <= 0;
      else 
        W_valid <= A_valid & A_en;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_wr_dst_reg <= 0;
      else 
        W_wr_dst_reg <= A_wr_dst_reg & A_en;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_dst_regnum <= 0;
      else 
        W_dst_regnum <= A_dst_regnum;
    end


  assign F_pc_nxt = (A_pipe_flush)? A_pipe_flush_waddr :
    (M_pipe_flush)? M_pipe_flush_waddr :
    (E_valid_jmp_indirect)? E_src1[26 : 2] :
    (D_refetch)? D_pc :
    ((D_br_pred_taken & D_issue))? D_br_taken_waddr :
    ((D_ctrl_jmp_direct & D_issue))? D_jmp_direct_target_waddr :
    F_pc_plus_one;

  assign D_regnum_a_cmp_F = (F_ram_iw_a == D_dst_regnum) & D_wr_dst_reg;
  assign E_regnum_a_cmp_F = (F_ram_iw_a == E_dst_regnum) & E_wr_dst_reg;
  assign M_regnum_a_cmp_F = (F_ram_iw_a == M_dst_regnum) & M_wr_dst_reg;
  assign A_regnum_a_cmp_F = (F_ram_iw_a == A_dst_regnum) & A_wr_dst_reg;
  assign D_regnum_b_cmp_F = (F_ram_iw_b == D_dst_regnum) & D_wr_dst_reg;
  assign E_regnum_b_cmp_F = (F_ram_iw_b == E_dst_regnum) & E_wr_dst_reg;
  assign M_regnum_b_cmp_F = (F_ram_iw_b == M_dst_regnum) & M_wr_dst_reg;
  assign A_regnum_b_cmp_F = (F_ram_iw_b == A_dst_regnum) & A_wr_dst_reg;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_regnum_a_cmp_D <= 0;
      else if (E_en)
          E_regnum_a_cmp_D <= D_en ? D_regnum_a_cmp_F : 1'b0;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_regnum_a_cmp_D <= 0;
      else if (M_en)
          M_regnum_a_cmp_D <= D_en ? E_regnum_a_cmp_F : E_regnum_a_cmp_D;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_regnum_a_cmp_D <= 0;
      else if (A_en)
          A_regnum_a_cmp_D <= D_en ? M_regnum_a_cmp_F : M_regnum_a_cmp_D;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_regnum_a_cmp_D <= 0;
      else 
        W_regnum_a_cmp_D <= D_en ? A_regnum_a_cmp_F : A_regnum_a_cmp_D;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_regnum_b_cmp_D <= 0;
      else if (E_en)
          E_regnum_b_cmp_D <= D_en ? D_regnum_b_cmp_F : 1'b0;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_regnum_b_cmp_D <= 0;
      else if (M_en)
          M_regnum_b_cmp_D <= D_en ? E_regnum_b_cmp_F : E_regnum_b_cmp_D;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_regnum_b_cmp_D <= 0;
      else if (A_en)
          A_regnum_b_cmp_D <= D_en ? M_regnum_b_cmp_F : M_regnum_b_cmp_D;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_regnum_b_cmp_D <= 0;
      else 
        W_regnum_b_cmp_D <= D_en ? A_regnum_b_cmp_F : A_regnum_b_cmp_D;
    end


  assign D_ctrl_a_is_src = ~D_ctrl_a_not_src;
  assign D_ctrl_b_is_src = ~D_ctrl_b_not_src;
  assign D_src1_hazard_E = E_regnum_a_cmp_D & D_ctrl_a_is_src;
  assign D_src1_hazard_M = M_regnum_a_cmp_D & D_ctrl_a_is_src;
  assign D_src1_hazard_A = A_regnum_a_cmp_D & D_ctrl_a_is_src;
  assign D_src1_hazard_W = W_regnum_a_cmp_D & D_ctrl_a_is_src;
  assign D_src2_hazard_E = E_regnum_b_cmp_D & D_ctrl_b_is_src;
  assign D_src2_hazard_M = M_regnum_b_cmp_D & D_ctrl_b_is_src;
  assign D_src2_hazard_A = A_regnum_b_cmp_D & D_ctrl_b_is_src;
  assign D_src2_hazard_W = W_regnum_b_cmp_D & D_ctrl_b_is_src;
  assign D_src1_other_rs = 0;
  assign D_src1_choose_E = D_src1_hazard_E & ~D_src1_other_rs;
  assign D_src1_choose_M = D_src1_hazard_M & ~D_src1_other_rs;
  assign D_src1_choose_A = D_src1_hazard_A & ~D_src1_other_rs;
  assign D_src1_choose_W = D_src1_hazard_W & ~D_src1_other_rs;
  assign D_src2_choose_E = D_src2_hazard_E;
  assign D_src2_choose_M = D_src2_hazard_M;
  assign D_src2_choose_A = D_src2_hazard_A;
  assign D_src2_choose_W = D_src2_hazard_W;
  assign D_data_depend = ((D_src1_hazard_E | D_src2_hazard_E) & E_ctrl_late_result) |
    ((D_src1_hazard_M | D_src2_hazard_M) & M_ctrl_late_result);

  assign D_dstfield_regnum = D_ctrl_b_is_dst ? D_iw_b : D_iw_c;
  assign D_dst_regnum = D_ctrl_implicit_dst_retaddr ? 5'd31 : 
    D_ctrl_implicit_dst_eretaddr ? 5'd29 : 
    D_dstfield_regnum;

  assign D_wr_dst_reg = (D_dst_regnum != 0) & ~D_ctrl_ignore_dst & D_valid;
  assign E_fwd_reg_data = E_alu_result;
  assign D_src1_reg = (D_src1_choose_E)? E_fwd_reg_data :
    (D_src1_choose_M)? M_fwd_reg_data :
    (D_src1_choose_A)? A_fwd_reg_data :
    (D_src1_choose_W)? W_wr_data :
    D_rf_a;

  assign D_src1 = D_src1_reg;
  assign D_src2_reg = (D_src2_choose_E)? E_fwd_reg_data :
    (D_src2_choose_M)? M_fwd_reg_data :
    (D_src2_choose_A)? A_fwd_reg_data :
    (D_src2_choose_W)? W_wr_data :
    D_rf_b;

  assign D_src2_imm_sel = {D_ctrl_hi_imm16,D_ctrl_unsigned_lo_imm16};
  assign D_src2_imm = (D_src2_imm_sel == 2'b00)? {{16 {D_iw_imm16[15]}}, D_iw_imm16} :
    (D_src2_imm_sel == 2'b01)? {{16 {1'b0}}          , D_iw_imm16} :
    (D_src2_imm_sel == 2'b10)? {D_iw_imm16                               , 16'b0     } :
    {{16 {1'b0}}          , 16'b0     };

  assign D_src2 = D_ctrl_src2_choose_imm ? D_src2_imm : D_src2_reg;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_src1 <= 0;
      else if (E_en)
          E_src1 <= D_src1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_src2 <= 0;
      else if (E_en)
          E_src2 <= D_src2;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_src2_reg <= 0;
      else if (E_en)
          E_src2_reg <= D_src2_reg;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_src1 <= 0;
      else if (M_en)
          M_src1 <= E_src1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_src2 <= 0;
      else if (M_en)
          M_src2 <= E_src2;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_src2 <= 0;
      else if (A_en)
          A_src2 <= M_src2;
    end


  assign D_logic_op_raw = D_op_opx ? D_iw_opx[4 : 3] : 
    D_iw_op[4 : 3];

  assign D_logic_op = D_ctrl_alu_force_xor ? 2'b11 : D_logic_op_raw;
  assign D_compare_op = D_op_opx ? D_iw_opx[4 : 3] : 
    D_iw_op[4 : 3];

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_logic_op <= 0;
      else if (E_en)
          E_logic_op <= D_logic_op;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_compare_op <= 0;
      else if (E_en)
          E_compare_op <= D_compare_op;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_valid_wrctl_ienable <= 0;
      else if (A_en)
          A_valid_wrctl_ienable <= M_wrctl_ienable & M_valid;
    end


  assign norm_intr_req = A_status_reg_pie & (A_ipending_reg != 0) &
    ~A_valid_wrctl_ienable;

  assign A_mul_cnt_nxt = A_mul_stall ? 
    A_mul_cnt-1 :
    4;

  assign A_mul_done_nxt = A_mul_cnt_nxt == 0;
  assign A_mul_stall_nxt = ~A_mul_done_nxt & 
    (A_mul_stall |
    (M_ctrl_mul_lsw & M_valid & A_en));

  assign A_mul_src1_nxt = (~A_mul_stall)? M_src1 :
    {A_mul_src1[15 : 0],
    16'b0};

  assign A_mul_src2_nxt = (~A_mul_stall)? M_src2 :
    {16'b0,
    A_mul_src2[31 : 16]};

  assign A_mul_partial_prod_nxt = A_mul_cell_result[31 : 0];
  assign A_mul_result_nxt = A_mul_stall_d3 ?
    A_mul_partial_prod + A_mul_result :
    A_mul_partial_prod;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mul_src1 <= 0;
      else 
        A_mul_src1 <= A_mul_src1_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mul_src2 <= 0;
      else 
        A_mul_src2 <= A_mul_src2_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mul_partial_prod <= 0;
      else 
        A_mul_partial_prod <= A_mul_partial_prod_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mul_result <= 0;
      else 
        A_mul_result <= A_mul_result_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mul_cnt <= 0;
      else 
        A_mul_cnt <= A_mul_cnt_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mul_stall <= 0;
      else 
        A_mul_stall <= A_mul_stall_nxt;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mul_stall_d1 <= 0;
      else 
        A_mul_stall_d1 <= A_mul_stall;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mul_stall_d2 <= 0;
      else 
        A_mul_stall_d2 <= A_mul_stall_d1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_mul_stall_d3 <= 0;
      else 
        A_mul_stall_d3 <= A_mul_stall_d2;
    end


  sopc_nios2_0_mult_cell the_sopc_nios2_0_mult_cell
    (
      .A_mul_cell_result (A_mul_cell_result),
      .A_mul_src1        (A_mul_src1),
      .A_mul_src2        (A_mul_src2),
      .clk               (clk),
      .reset_n           (reset_n)
    );

  assign A_ci_multi_dataa = A_ci_multi_src1;
  assign A_ci_multi_datab = A_ci_multi_src2;
  assign A_ci_multi_ipending = A_ci_multi_ipending;
  assign A_ci_multi_status = A_ci_multi_status;
  assign A_ci_multi_estatus = A_ci_multi_estatus;
  assign A_ci_multi_n = A_iw_custom_n;
  assign A_ci_multi_a = A_iw_a;
  assign A_ci_multi_b = A_iw_b;
  assign A_ci_multi_c = A_iw_c;
  assign A_ci_multi_readra = A_iw_custom_readra;
  assign A_ci_multi_readrb = A_iw_custom_readrb;
  assign A_ci_multi_writerc = A_iw_custom_writerc;
  //custom_instruction_master, which is an e_custom_instruction_master
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ci_multi_src1 <= 0;
      else if (A_en)
          A_ci_multi_src1 <= M_src1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ci_multi_src2 <= 0;
      else if (A_en)
          A_ci_multi_src2 <= M_src2;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ci_multi_stall <= 0;
      else 
        A_ci_multi_stall <= A_ci_multi_stall ? ~A_ci_multi_done : 
                (M_ctrl_custom_multi & M_valid & A_en);

    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ci_multi_start <= 0;
      else 
        A_ci_multi_start <= A_ci_multi_start ? 1'b0 : 
                (M_ctrl_custom_multi & M_valid & A_en);

    end


  assign A_ci_multi_clk_en = A_ci_multi_stall;
  assign A_ci_multi_clock = clk;
  assign A_ci_multi_reset = ~reset_n;
  assign E_ctrl_ld_bypass = (E_ctrl_ld_io | (E_ctrl_ld_non_io & E_mem_bypass_non_io)) &
    E_sel_data_master;

  assign M_ctrl_ld_bypass_nxt = E_ctrl_ld_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_bypass <= 0;
      else if (M_en)
          M_ctrl_ld_bypass <= M_ctrl_ld_bypass_nxt;
    end


  assign A_ctrl_ld_bypass_nxt = M_ctrl_ld_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_bypass <= 0;
      else if (A_en)
          A_ctrl_ld_bypass <= A_ctrl_ld_bypass_nxt;
    end


  assign E_ctrl_st_bypass = (E_ctrl_st_io | (E_ctrl_st_non_io & E_mem_bypass_non_io)) &
    E_sel_data_master;

  assign M_ctrl_st_bypass_nxt = E_ctrl_st_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_st_bypass <= 0;
      else if (M_en)
          M_ctrl_st_bypass <= M_ctrl_st_bypass_nxt;
    end


  assign A_ctrl_st_bypass_nxt = M_ctrl_st_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_st_bypass <= 0;
      else if (A_en)
          A_ctrl_st_bypass <= A_ctrl_st_bypass_nxt;
    end


  assign E_ctrl_ld_st_bypass = (E_ctrl_ld_st_io | 
    (E_ctrl_ld_st_non_io & E_mem_bypass_non_io)) &
    E_sel_data_master;

  assign M_ctrl_ld_st_bypass_nxt = E_ctrl_ld_st_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_st_bypass <= 0;
      else if (M_en)
          M_ctrl_ld_st_bypass <= M_ctrl_ld_st_bypass_nxt;
    end


  assign A_ctrl_ld_st_bypass_nxt = M_ctrl_ld_st_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_st_bypass <= 0;
      else if (A_en)
          A_ctrl_ld_st_bypass <= A_ctrl_ld_st_bypass_nxt;
    end


  assign E_ctrl_ld_st_bypass_or_dcache_management = ((E_ctrl_ld_st_io | 
    (E_ctrl_ld_st_non_io & E_mem_bypass_non_io)) &
    E_sel_data_master) | E_ctrl_dcache_management;

  assign M_ctrl_ld_st_bypass_or_dcache_management_nxt = E_ctrl_ld_st_bypass_or_dcache_management;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_st_bypass_or_dcache_management <= 0;
      else if (M_en)
          M_ctrl_ld_st_bypass_or_dcache_management <= M_ctrl_ld_st_bypass_or_dcache_management_nxt;
    end


  assign A_ctrl_ld_st_bypass_or_dcache_management_nxt = M_ctrl_ld_st_bypass_or_dcache_management;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_st_bypass_or_dcache_management <= 0;
      else if (A_en)
          A_ctrl_ld_st_bypass_or_dcache_management <= A_ctrl_ld_st_bypass_or_dcache_management_nxt;
    end


  assign E_ctrl_ld_non_bypass = (E_ctrl_ld_non_io & ~E_mem_bypass_non_io) | 
    (E_ctrl_ld & ~E_sel_data_master);

  assign M_ctrl_ld_non_bypass_nxt = E_ctrl_ld_non_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_non_bypass <= 0;
      else if (M_en)
          M_ctrl_ld_non_bypass <= M_ctrl_ld_non_bypass_nxt;
    end


  assign A_ctrl_ld_non_bypass_nxt = M_ctrl_ld_non_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_non_bypass <= 0;
      else if (A_en)
          A_ctrl_ld_non_bypass <= A_ctrl_ld_non_bypass_nxt;
    end


  assign E_ctrl_st_non_bypass = (E_ctrl_st_non_io & ~E_mem_bypass_non_io) | 
    (E_ctrl_st & ~E_sel_data_master);

  assign M_ctrl_st_non_bypass_nxt = E_ctrl_st_non_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_st_non_bypass <= 0;
      else if (M_en)
          M_ctrl_st_non_bypass <= M_ctrl_st_non_bypass_nxt;
    end


  assign A_ctrl_st_non_bypass_nxt = M_ctrl_st_non_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_st_non_bypass <= 0;
      else if (A_en)
          A_ctrl_st_non_bypass <= A_ctrl_st_non_bypass_nxt;
    end


  assign E_ctrl_ld_st_non_bypass = (E_ctrl_ld_st_non_io & ~E_mem_bypass_non_io) | 
    (E_ctrl_ld_st & ~E_sel_data_master);

  assign M_ctrl_ld_st_non_bypass_nxt = E_ctrl_ld_st_non_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_st_non_bypass <= 0;
      else if (M_en)
          M_ctrl_ld_st_non_bypass <= M_ctrl_ld_st_non_bypass_nxt;
    end


  assign A_ctrl_ld_st_non_bypass_nxt = M_ctrl_ld_st_non_bypass;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_st_non_bypass <= 0;
      else if (A_en)
          A_ctrl_ld_st_non_bypass <= A_ctrl_ld_st_non_bypass_nxt;
    end


  assign E_ctrl_ld_st_non_bypass_non_st32 = (E_ctrl_ld_st_non_io_non_st32 & ~E_mem_bypass_non_io) |
    (E_ctrl_ld_st_non_st32 & ~E_sel_data_master);

  assign M_ctrl_ld_st_non_bypass_non_st32_nxt = E_ctrl_ld_st_non_bypass_non_st32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_st_non_bypass_non_st32 <= 0;
      else if (M_en)
          M_ctrl_ld_st_non_bypass_non_st32 <= M_ctrl_ld_st_non_bypass_non_st32_nxt;
    end


  assign A_ctrl_ld_st_non_bypass_non_st32_nxt = M_ctrl_ld_st_non_bypass_non_st32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_st_non_bypass_non_st32 <= 0;
      else if (A_en)
          A_ctrl_ld_st_non_bypass_non_st32 <= A_ctrl_ld_st_non_bypass_non_st32_nxt;
    end


  sopc_nios2_0_nios2_oci the_sopc_nios2_0_nios2_oci
    (
      .A_cmp_result                          (A_cmp_result),
      .A_ctrl_exception                      (A_ctrl_exception),
      .A_ctrl_ld                             (A_ctrl_ld),
      .A_ctrl_st                             (A_ctrl_st),
      .A_en                                  (A_en),
      .A_mem_baddr                           (A_mem_baddr),
      .A_op_beq                              (A_op_beq),
      .A_op_bge                              (A_op_bge),
      .A_op_bgeu                             (A_op_bgeu),
      .A_op_blt                              (A_op_blt),
      .A_op_bltu                             (A_op_bltu),
      .A_op_bne                              (A_op_bne),
      .A_op_br                               (A_op_br),
      .A_op_bret                             (A_op_bret),
      .A_op_call                             (A_op_call),
      .A_op_callr                            (A_op_callr),
      .A_op_eret                             (A_op_eret),
      .A_op_jmp                              (A_op_jmp),
      .A_op_jmpi                             (A_op_jmpi),
      .A_op_ret                              (A_op_ret),
      .A_pcb                                 (A_pcb),
      .A_st_data                             (A_st_data),
      .A_valid                               (A_valid),
      .A_wr_data_filtered                    (A_wr_data_filtered),
      .D_en                                  (D_en),
      .E_en                                  (E_en),
      .E_valid                               (E_valid),
      .F_pc                                  (F_pc),
      .M_en                                  (M_en),
      .address_nxt                           (jtag_debug_module_address),
      .byteenable_nxt                        (jtag_debug_module_byteenable),
      .clk                                   (jtag_debug_module_clk),
      .debugaccess_nxt                       (jtag_debug_module_debugaccess),
      .hbreak_enabled                        (hbreak_enabled),
      .jtag_debug_module_debugaccess_to_roms (jtag_debug_module_debugaccess_to_roms),
      .oci_hbreak_req                        (oci_hbreak_req),
      .oci_ienable                           (oci_ienable),
      .oci_single_step_mode                  (oci_single_step_mode),
      .read_nxt                              (jtag_debug_module_read),
      .readdata                              (jtag_debug_module_readdata),
      .reset                                 (jtag_debug_module_reset),
      .reset_n                               (reset_n),
      .resetrequest                          (jtag_debug_module_resetrequest),
      .test_ending                           (test_ending),
      .test_has_ended                        (test_has_ended),
      .waitrequest                           (jtag_debug_module_waitrequest),
      .write_nxt                             (jtag_debug_module_write),
      .writedata_nxt                         (jtag_debug_module_writedata)
    );

  //jtag_debug_module, which is an e_avalon_slave
  assign jtag_debug_module_clk = clk;
  assign jtag_debug_module_reset = ~reset_n;
  assign D_ctrl_unimp_trap = D_op_div|D_op_divu|D_op_mulxss|D_op_mulxsu|D_op_mulxuu;
  assign E_ctrl_unimp_trap_nxt = D_ctrl_unimp_trap;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_unimp_trap <= 0;
      else if (E_en)
          E_ctrl_unimp_trap <= E_ctrl_unimp_trap_nxt;
    end


  assign M_ctrl_unimp_trap_nxt = E_ctrl_unimp_trap;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_unimp_trap <= 0;
      else if (M_en)
          M_ctrl_unimp_trap <= M_ctrl_unimp_trap_nxt;
    end


  assign A_ctrl_unimp_trap_nxt = M_ctrl_unimp_trap;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_unimp_trap <= 0;
      else if (A_en)
          A_ctrl_unimp_trap <= A_ctrl_unimp_trap_nxt;
    end


  assign W_ctrl_unimp_trap_nxt = A_ctrl_unimp_trap;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_unimp_trap <= 0;
      else if (W_en)
          W_ctrl_unimp_trap <= W_ctrl_unimp_trap_nxt;
    end


  assign D_ctrl_unimp_nop = 1'b0;
  assign E_ctrl_unimp_nop_nxt = D_ctrl_unimp_nop;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_unimp_nop <= 0;
      else if (E_en)
          E_ctrl_unimp_nop <= E_ctrl_unimp_nop_nxt;
    end


  assign M_ctrl_unimp_nop_nxt = E_ctrl_unimp_nop;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_unimp_nop <= 0;
      else if (M_en)
          M_ctrl_unimp_nop <= M_ctrl_unimp_nop_nxt;
    end


  assign A_ctrl_unimp_nop_nxt = M_ctrl_unimp_nop;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_unimp_nop <= 0;
      else if (A_en)
          A_ctrl_unimp_nop <= A_ctrl_unimp_nop_nxt;
    end


  assign W_ctrl_unimp_nop_nxt = A_ctrl_unimp_nop;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_unimp_nop <= 0;
      else if (W_en)
          W_ctrl_unimp_nop <= W_ctrl_unimp_nop_nxt;
    end


  assign D_ctrl_illegal = 1'b0;
  assign E_ctrl_illegal_nxt = D_ctrl_illegal;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_illegal <= 0;
      else if (E_en)
          E_ctrl_illegal <= E_ctrl_illegal_nxt;
    end


  assign M_ctrl_illegal_nxt = E_ctrl_illegal;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_illegal <= 0;
      else if (M_en)
          M_ctrl_illegal <= M_ctrl_illegal_nxt;
    end


  assign A_ctrl_illegal_nxt = M_ctrl_illegal;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_illegal <= 0;
      else if (A_en)
          A_ctrl_illegal <= A_ctrl_illegal_nxt;
    end


  assign W_ctrl_illegal_nxt = A_ctrl_illegal;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_illegal <= 0;
      else if (W_en)
          W_ctrl_illegal <= W_ctrl_illegal_nxt;
    end


  assign D_ctrl_custom_combo = 1'b0;
  assign E_ctrl_custom_combo_nxt = D_ctrl_custom_combo;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_custom_combo <= 0;
      else if (E_en)
          E_ctrl_custom_combo <= E_ctrl_custom_combo_nxt;
    end


  assign M_ctrl_custom_combo_nxt = E_ctrl_custom_combo;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_custom_combo <= 0;
      else if (M_en)
          M_ctrl_custom_combo <= M_ctrl_custom_combo_nxt;
    end


  assign A_ctrl_custom_combo_nxt = M_ctrl_custom_combo;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_custom_combo <= 0;
      else if (A_en)
          A_ctrl_custom_combo <= A_ctrl_custom_combo_nxt;
    end


  assign W_ctrl_custom_combo_nxt = A_ctrl_custom_combo;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_custom_combo <= 0;
      else if (W_en)
          W_ctrl_custom_combo <= W_ctrl_custom_combo_nxt;
    end


  assign D_ctrl_custom_multi = D_op_fpu;
  assign E_ctrl_custom_multi_nxt = D_ctrl_custom_multi;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_custom_multi <= 0;
      else if (E_en)
          E_ctrl_custom_multi <= E_ctrl_custom_multi_nxt;
    end


  assign M_ctrl_custom_multi_nxt = E_ctrl_custom_multi;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_custom_multi <= 0;
      else if (M_en)
          M_ctrl_custom_multi <= M_ctrl_custom_multi_nxt;
    end


  assign A_ctrl_custom_multi_nxt = M_ctrl_custom_multi;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_custom_multi <= 0;
      else if (A_en)
          A_ctrl_custom_multi <= A_ctrl_custom_multi_nxt;
    end


  assign W_ctrl_custom_multi_nxt = A_ctrl_custom_multi;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_custom_multi <= 0;
      else if (W_en)
          W_ctrl_custom_multi <= W_ctrl_custom_multi_nxt;
    end


  assign D_ctrl_supervisor_only = D_op_initi|D_op_initd|D_op_eret|D_op_bret|D_op_wrctl|D_op_rdctl;
  assign E_ctrl_supervisor_only_nxt = D_ctrl_supervisor_only;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_supervisor_only <= 0;
      else if (E_en)
          E_ctrl_supervisor_only <= E_ctrl_supervisor_only_nxt;
    end


  assign M_ctrl_supervisor_only_nxt = E_ctrl_supervisor_only;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_supervisor_only <= 0;
      else if (M_en)
          M_ctrl_supervisor_only <= M_ctrl_supervisor_only_nxt;
    end


  assign A_ctrl_supervisor_only_nxt = M_ctrl_supervisor_only;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_supervisor_only <= 0;
      else if (A_en)
          A_ctrl_supervisor_only <= A_ctrl_supervisor_only_nxt;
    end


  assign W_ctrl_supervisor_only_nxt = A_ctrl_supervisor_only;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_supervisor_only <= 0;
      else if (W_en)
          W_ctrl_supervisor_only <= W_ctrl_supervisor_only_nxt;
    end


  assign E_ctrl_invalidate_i = E_op_initi|E_op_flushi|E_op_crst|E_op_rsvx63;
  assign M_ctrl_invalidate_i_nxt = E_ctrl_invalidate_i;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_invalidate_i <= 0;
      else if (M_en)
          M_ctrl_invalidate_i <= M_ctrl_invalidate_i_nxt;
    end


  assign A_ctrl_invalidate_i_nxt = M_ctrl_invalidate_i;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_invalidate_i <= 0;
      else if (A_en)
          A_ctrl_invalidate_i <= A_ctrl_invalidate_i_nxt;
    end


  assign W_ctrl_invalidate_i_nxt = A_ctrl_invalidate_i;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_invalidate_i <= 0;
      else if (W_en)
          W_ctrl_invalidate_i <= W_ctrl_invalidate_i_nxt;
    end


  assign D_ctrl_jmp_indirect = D_op_eret|
    D_op_bret|
    D_op_rsvx17|
    D_op_rsvx25|
    D_op_ret|
    D_op_jmp|
    D_op_rsvx21|
    D_op_callr;

  assign E_ctrl_jmp_indirect_nxt = D_ctrl_jmp_indirect;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_jmp_indirect <= 0;
      else if (E_en)
          E_ctrl_jmp_indirect <= E_ctrl_jmp_indirect_nxt;
    end


  assign M_ctrl_jmp_indirect_nxt = E_ctrl_jmp_indirect;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_jmp_indirect <= 0;
      else if (M_en)
          M_ctrl_jmp_indirect <= M_ctrl_jmp_indirect_nxt;
    end


  assign A_ctrl_jmp_indirect_nxt = M_ctrl_jmp_indirect;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_jmp_indirect <= 0;
      else if (A_en)
          A_ctrl_jmp_indirect <= A_ctrl_jmp_indirect_nxt;
    end


  assign W_ctrl_jmp_indirect_nxt = A_ctrl_jmp_indirect;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_jmp_indirect <= 0;
      else if (W_en)
          W_ctrl_jmp_indirect <= W_ctrl_jmp_indirect_nxt;
    end


  assign F_ctrl_jmp_direct = F_op_call|F_op_jmpi;
  assign D_ctrl_jmp_direct_nxt = F_ctrl_jmp_direct;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_jmp_direct <= 0;
      else if (D_en)
          D_ctrl_jmp_direct <= D_ctrl_jmp_direct_nxt;
    end


  assign E_ctrl_jmp_direct_nxt = D_ctrl_jmp_direct;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_jmp_direct <= 0;
      else if (E_en)
          E_ctrl_jmp_direct <= E_ctrl_jmp_direct_nxt;
    end


  assign M_ctrl_jmp_direct_nxt = E_ctrl_jmp_direct;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_jmp_direct <= 0;
      else if (M_en)
          M_ctrl_jmp_direct <= M_ctrl_jmp_direct_nxt;
    end


  assign A_ctrl_jmp_direct_nxt = M_ctrl_jmp_direct;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_jmp_direct <= 0;
      else if (A_en)
          A_ctrl_jmp_direct <= A_ctrl_jmp_direct_nxt;
    end


  assign W_ctrl_jmp_direct_nxt = A_ctrl_jmp_direct;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_jmp_direct <= 0;
      else if (W_en)
          W_ctrl_jmp_direct <= W_ctrl_jmp_direct_nxt;
    end


  assign D_ctrl_mul_lsw = D_op_muli|D_op_mul|D_op_rsvx47|D_op_rsvx55|D_op_rsvx63;
  assign E_ctrl_mul_lsw_nxt = D_ctrl_mul_lsw;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_mul_lsw <= 0;
      else if (E_en)
          E_ctrl_mul_lsw <= E_ctrl_mul_lsw_nxt;
    end


  assign M_ctrl_mul_lsw_nxt = E_ctrl_mul_lsw;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_mul_lsw <= 0;
      else if (M_en)
          M_ctrl_mul_lsw <= M_ctrl_mul_lsw_nxt;
    end


  assign A_ctrl_mul_lsw_nxt = M_ctrl_mul_lsw;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_mul_lsw <= 0;
      else if (A_en)
          A_ctrl_mul_lsw <= A_ctrl_mul_lsw_nxt;
    end


  assign W_ctrl_mul_lsw_nxt = A_ctrl_mul_lsw;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_mul_lsw <= 0;
      else if (W_en)
          W_ctrl_mul_lsw <= W_ctrl_mul_lsw_nxt;
    end


  assign F_ctrl_implicit_dst_retaddr = F_op_call|F_op_rsv02;
  assign D_ctrl_implicit_dst_retaddr_nxt = F_ctrl_implicit_dst_retaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_implicit_dst_retaddr <= 0;
      else if (D_en)
          D_ctrl_implicit_dst_retaddr <= D_ctrl_implicit_dst_retaddr_nxt;
    end


  assign E_ctrl_implicit_dst_retaddr_nxt = D_ctrl_implicit_dst_retaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_implicit_dst_retaddr <= 0;
      else if (E_en)
          E_ctrl_implicit_dst_retaddr <= E_ctrl_implicit_dst_retaddr_nxt;
    end


  assign M_ctrl_implicit_dst_retaddr_nxt = E_ctrl_implicit_dst_retaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_implicit_dst_retaddr <= 0;
      else if (M_en)
          M_ctrl_implicit_dst_retaddr <= M_ctrl_implicit_dst_retaddr_nxt;
    end


  assign A_ctrl_implicit_dst_retaddr_nxt = M_ctrl_implicit_dst_retaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_implicit_dst_retaddr <= 0;
      else if (A_en)
          A_ctrl_implicit_dst_retaddr <= A_ctrl_implicit_dst_retaddr_nxt;
    end


  assign W_ctrl_implicit_dst_retaddr_nxt = A_ctrl_implicit_dst_retaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_implicit_dst_retaddr <= 0;
      else if (W_en)
          W_ctrl_implicit_dst_retaddr <= W_ctrl_implicit_dst_retaddr_nxt;
    end


  assign F_ctrl_implicit_dst_eretaddr = F_op_div|F_op_divu|F_op_mulxss|F_op_mulxsu|F_op_mulxuu;
  assign D_ctrl_implicit_dst_eretaddr_nxt = F_ctrl_implicit_dst_eretaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_implicit_dst_eretaddr <= 0;
      else if (D_en)
          D_ctrl_implicit_dst_eretaddr <= D_ctrl_implicit_dst_eretaddr_nxt;
    end


  assign E_ctrl_implicit_dst_eretaddr_nxt = D_ctrl_implicit_dst_eretaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_implicit_dst_eretaddr <= 0;
      else if (E_en)
          E_ctrl_implicit_dst_eretaddr <= E_ctrl_implicit_dst_eretaddr_nxt;
    end


  assign M_ctrl_implicit_dst_eretaddr_nxt = E_ctrl_implicit_dst_eretaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_implicit_dst_eretaddr <= 0;
      else if (M_en)
          M_ctrl_implicit_dst_eretaddr <= M_ctrl_implicit_dst_eretaddr_nxt;
    end


  assign A_ctrl_implicit_dst_eretaddr_nxt = M_ctrl_implicit_dst_eretaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_implicit_dst_eretaddr <= 0;
      else if (A_en)
          A_ctrl_implicit_dst_eretaddr <= A_ctrl_implicit_dst_eretaddr_nxt;
    end


  assign W_ctrl_implicit_dst_eretaddr_nxt = A_ctrl_implicit_dst_eretaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_implicit_dst_eretaddr <= 0;
      else if (W_en)
          W_ctrl_implicit_dst_eretaddr <= W_ctrl_implicit_dst_eretaddr_nxt;
    end


  assign D_ctrl_exception = D_op_trap|
    D_op_rsvx44|
    D_op_div|
    D_op_divu|
    D_op_mulxss|
    D_op_mulxsu|
    D_op_mulxuu|
    D_op_intr|
    D_op_rsvx60;

  assign E_ctrl_exception_nxt = D_ctrl_exception;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_exception <= 0;
      else if (E_en)
          E_ctrl_exception <= E_ctrl_exception_nxt;
    end


  assign M_ctrl_exception_nxt = E_ctrl_exception;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_exception <= 0;
      else if (M_en)
          M_ctrl_exception <= M_ctrl_exception_nxt;
    end


  assign A_ctrl_exception_nxt = M_ctrl_exception;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_exception <= 0;
      else if (A_en)
          A_ctrl_exception <= A_ctrl_exception_nxt;
    end


  assign W_ctrl_exception_nxt = A_ctrl_exception;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_exception <= 0;
      else if (W_en)
          W_ctrl_exception <= W_ctrl_exception_nxt;
    end


  assign D_ctrl_break = D_op_break|D_op_hbreak;
  assign E_ctrl_break_nxt = D_ctrl_break;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_break <= 0;
      else if (E_en)
          E_ctrl_break <= E_ctrl_break_nxt;
    end


  assign M_ctrl_break_nxt = E_ctrl_break;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_break <= 0;
      else if (M_en)
          M_ctrl_break <= M_ctrl_break_nxt;
    end


  assign A_ctrl_break_nxt = M_ctrl_break;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_break <= 0;
      else if (A_en)
          A_ctrl_break <= A_ctrl_break_nxt;
    end


  assign W_ctrl_break_nxt = A_ctrl_break;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_break <= 0;
      else if (W_en)
          W_ctrl_break <= W_ctrl_break_nxt;
    end


  assign D_ctrl_crst = D_op_crst|D_op_rsvx63;
  assign E_ctrl_crst_nxt = D_ctrl_crst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_crst <= 0;
      else if (E_en)
          E_ctrl_crst <= E_ctrl_crst_nxt;
    end


  assign M_ctrl_crst_nxt = E_ctrl_crst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_crst <= 0;
      else if (M_en)
          M_ctrl_crst <= M_ctrl_crst_nxt;
    end


  assign A_ctrl_crst_nxt = M_ctrl_crst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_crst <= 0;
      else if (A_en)
          A_ctrl_crst <= A_ctrl_crst_nxt;
    end


  assign W_ctrl_crst_nxt = A_ctrl_crst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_crst <= 0;
      else if (W_en)
          W_ctrl_crst <= W_ctrl_crst_nxt;
    end


  assign D_ctrl_uncond_cti_non_br = D_op_call|
    D_op_jmpi|
    D_op_eret|
    D_op_bret|
    D_op_rsvx17|
    D_op_rsvx25|
    D_op_ret|
    D_op_jmp|
    D_op_rsvx21|
    D_op_callr;

  assign E_ctrl_uncond_cti_non_br_nxt = D_ctrl_uncond_cti_non_br;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_uncond_cti_non_br <= 0;
      else if (E_en)
          E_ctrl_uncond_cti_non_br <= E_ctrl_uncond_cti_non_br_nxt;
    end


  assign M_ctrl_uncond_cti_non_br_nxt = E_ctrl_uncond_cti_non_br;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_uncond_cti_non_br <= 0;
      else if (M_en)
          M_ctrl_uncond_cti_non_br <= M_ctrl_uncond_cti_non_br_nxt;
    end


  assign A_ctrl_uncond_cti_non_br_nxt = M_ctrl_uncond_cti_non_br;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_uncond_cti_non_br <= 0;
      else if (A_en)
          A_ctrl_uncond_cti_non_br <= A_ctrl_uncond_cti_non_br_nxt;
    end


  assign W_ctrl_uncond_cti_non_br_nxt = A_ctrl_uncond_cti_non_br;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_uncond_cti_non_br <= 0;
      else if (W_en)
          W_ctrl_uncond_cti_non_br <= W_ctrl_uncond_cti_non_br_nxt;
    end


  assign D_ctrl_retaddr = D_op_call|
    D_op_rsv02|
    D_op_nextpc|
    D_op_callr|
    D_op_trap|
    D_op_rsvx44|
    D_op_div|
    D_op_divu|
    D_op_mulxss|
    D_op_mulxsu|
    D_op_mulxuu|
    D_op_intr|
    D_op_rsvx60|
    D_op_break|
    D_op_hbreak;

  assign E_ctrl_retaddr_nxt = D_ctrl_retaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_retaddr <= 0;
      else if (E_en)
          E_ctrl_retaddr <= E_ctrl_retaddr_nxt;
    end


  assign M_ctrl_retaddr_nxt = E_ctrl_retaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_retaddr <= 0;
      else if (M_en)
          M_ctrl_retaddr <= M_ctrl_retaddr_nxt;
    end


  assign A_ctrl_retaddr_nxt = M_ctrl_retaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_retaddr <= 0;
      else if (A_en)
          A_ctrl_retaddr <= A_ctrl_retaddr_nxt;
    end


  assign W_ctrl_retaddr_nxt = A_ctrl_retaddr;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_retaddr <= 0;
      else if (W_en)
          W_ctrl_retaddr <= W_ctrl_retaddr_nxt;
    end


  assign D_ctrl_shift_rot_left = D_op_slli|
    D_op_rsvx50|
    D_op_sll|
    D_op_rsvx51|
    D_op_roli|
    D_op_rsvx34|
    D_op_rol|
    D_op_rsvx35;

  assign E_ctrl_shift_rot_left_nxt = D_ctrl_shift_rot_left;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_shift_rot_left <= 0;
      else if (E_en)
          E_ctrl_shift_rot_left <= E_ctrl_shift_rot_left_nxt;
    end


  assign M_ctrl_shift_rot_left_nxt = E_ctrl_shift_rot_left;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_shift_rot_left <= 0;
      else if (M_en)
          M_ctrl_shift_rot_left <= M_ctrl_shift_rot_left_nxt;
    end


  assign A_ctrl_shift_rot_left_nxt = M_ctrl_shift_rot_left;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_shift_rot_left <= 0;
      else if (A_en)
          A_ctrl_shift_rot_left <= A_ctrl_shift_rot_left_nxt;
    end


  assign W_ctrl_shift_rot_left_nxt = A_ctrl_shift_rot_left;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_shift_rot_left <= 0;
      else if (W_en)
          W_ctrl_shift_rot_left <= W_ctrl_shift_rot_left_nxt;
    end


  assign D_ctrl_shift_right_arith = D_op_srai|D_op_sra;
  assign E_ctrl_shift_right_arith_nxt = D_ctrl_shift_right_arith;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_shift_right_arith <= 0;
      else if (E_en)
          E_ctrl_shift_right_arith <= E_ctrl_shift_right_arith_nxt;
    end


  assign M_ctrl_shift_right_arith_nxt = E_ctrl_shift_right_arith;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_shift_right_arith <= 0;
      else if (M_en)
          M_ctrl_shift_right_arith <= M_ctrl_shift_right_arith_nxt;
    end


  assign A_ctrl_shift_right_arith_nxt = M_ctrl_shift_right_arith;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_shift_right_arith <= 0;
      else if (A_en)
          A_ctrl_shift_right_arith <= A_ctrl_shift_right_arith_nxt;
    end


  assign W_ctrl_shift_right_arith_nxt = A_ctrl_shift_right_arith;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_shift_right_arith <= 0;
      else if (W_en)
          W_ctrl_shift_right_arith <= W_ctrl_shift_right_arith_nxt;
    end


  assign D_ctrl_shift_rot_right = D_op_srli|
    D_op_srl|
    D_op_srai|
    D_op_sra|
    D_op_rsvx10|
    D_op_ror|
    D_op_rsvx42|
    D_op_rsvx43;

  assign E_ctrl_shift_rot_right_nxt = D_ctrl_shift_rot_right;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_shift_rot_right <= 0;
      else if (E_en)
          E_ctrl_shift_rot_right <= E_ctrl_shift_rot_right_nxt;
    end


  assign M_ctrl_shift_rot_right_nxt = E_ctrl_shift_rot_right;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_shift_rot_right <= 0;
      else if (M_en)
          M_ctrl_shift_rot_right <= M_ctrl_shift_rot_right_nxt;
    end


  assign A_ctrl_shift_rot_right_nxt = M_ctrl_shift_rot_right;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_shift_rot_right <= 0;
      else if (A_en)
          A_ctrl_shift_rot_right <= A_ctrl_shift_rot_right_nxt;
    end


  assign W_ctrl_shift_rot_right_nxt = A_ctrl_shift_rot_right;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_shift_rot_right <= 0;
      else if (W_en)
          W_ctrl_shift_rot_right <= W_ctrl_shift_rot_right_nxt;
    end


  assign D_ctrl_shift_rot = D_op_slli|
    D_op_rsvx50|
    D_op_sll|
    D_op_rsvx51|
    D_op_roli|
    D_op_rsvx34|
    D_op_rol|
    D_op_rsvx35|
    D_op_srli|
    D_op_srl|
    D_op_srai|
    D_op_sra|
    D_op_rsvx10|
    D_op_ror|
    D_op_rsvx42|
    D_op_rsvx43;

  assign E_ctrl_shift_rot_nxt = D_ctrl_shift_rot;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_shift_rot <= 0;
      else if (E_en)
          E_ctrl_shift_rot <= E_ctrl_shift_rot_nxt;
    end


  assign M_ctrl_shift_rot_nxt = E_ctrl_shift_rot;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_shift_rot <= 0;
      else if (M_en)
          M_ctrl_shift_rot <= M_ctrl_shift_rot_nxt;
    end


  assign A_ctrl_shift_rot_nxt = M_ctrl_shift_rot;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_shift_rot <= 0;
      else if (A_en)
          A_ctrl_shift_rot <= A_ctrl_shift_rot_nxt;
    end


  assign W_ctrl_shift_rot_nxt = A_ctrl_shift_rot;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_shift_rot <= 0;
      else if (W_en)
          W_ctrl_shift_rot <= W_ctrl_shift_rot_nxt;
    end


  assign D_ctrl_rot = D_op_roli|
    D_op_rsvx34|
    D_op_rol|
    D_op_rsvx35|
    D_op_rsvx10|
    D_op_ror|
    D_op_rsvx42|
    D_op_rsvx43;

  assign E_ctrl_rot_nxt = D_ctrl_rot;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_rot <= 0;
      else if (E_en)
          E_ctrl_rot <= E_ctrl_rot_nxt;
    end


  assign M_ctrl_rot_nxt = E_ctrl_rot;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_rot <= 0;
      else if (M_en)
          M_ctrl_rot <= M_ctrl_rot_nxt;
    end


  assign A_ctrl_rot_nxt = M_ctrl_rot;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_rot <= 0;
      else if (A_en)
          A_ctrl_rot <= A_ctrl_rot_nxt;
    end


  assign W_ctrl_rot_nxt = A_ctrl_rot;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_rot <= 0;
      else if (W_en)
          W_ctrl_rot <= W_ctrl_rot_nxt;
    end


  assign D_ctrl_logic = D_op_and|
    D_op_or|
    D_op_xor|
    D_op_nor|
    D_op_andhi|
    D_op_orhi|
    D_op_xorhi|
    D_op_andi|
    D_op_ori|
    D_op_xori;

  assign E_ctrl_logic_nxt = D_ctrl_logic;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_logic <= 0;
      else if (E_en)
          E_ctrl_logic <= E_ctrl_logic_nxt;
    end


  assign M_ctrl_logic_nxt = E_ctrl_logic;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_logic <= 0;
      else if (M_en)
          M_ctrl_logic <= M_ctrl_logic_nxt;
    end


  assign A_ctrl_logic_nxt = M_ctrl_logic;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_logic <= 0;
      else if (A_en)
          A_ctrl_logic <= A_ctrl_logic_nxt;
    end


  assign W_ctrl_logic_nxt = A_ctrl_logic;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_logic <= 0;
      else if (W_en)
          W_ctrl_logic <= W_ctrl_logic_nxt;
    end


  assign F_ctrl_hi_imm16 = F_op_andhi|F_op_orhi|F_op_xorhi;
  assign D_ctrl_hi_imm16_nxt = F_ctrl_hi_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_hi_imm16 <= 0;
      else if (D_en)
          D_ctrl_hi_imm16 <= D_ctrl_hi_imm16_nxt;
    end


  assign E_ctrl_hi_imm16_nxt = D_ctrl_hi_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_hi_imm16 <= 0;
      else if (E_en)
          E_ctrl_hi_imm16 <= E_ctrl_hi_imm16_nxt;
    end


  assign M_ctrl_hi_imm16_nxt = E_ctrl_hi_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_hi_imm16 <= 0;
      else if (M_en)
          M_ctrl_hi_imm16 <= M_ctrl_hi_imm16_nxt;
    end


  assign A_ctrl_hi_imm16_nxt = M_ctrl_hi_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_hi_imm16 <= 0;
      else if (A_en)
          A_ctrl_hi_imm16 <= A_ctrl_hi_imm16_nxt;
    end


  assign W_ctrl_hi_imm16_nxt = A_ctrl_hi_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_hi_imm16 <= 0;
      else if (W_en)
          W_ctrl_hi_imm16 <= W_ctrl_hi_imm16_nxt;
    end


  assign F_ctrl_unsigned_lo_imm16 = F_op_cmpgeui|
    F_op_cmpltui|
    F_op_andi|
    F_op_ori|
    F_op_xori|
    F_op_roli|
    F_op_rsvx10|
    F_op_slli|
    F_op_srli|
    F_op_rsvx34|
    F_op_rsvx42|
    F_op_rsvx50|
    F_op_srai;

  assign D_ctrl_unsigned_lo_imm16_nxt = F_ctrl_unsigned_lo_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_unsigned_lo_imm16 <= 0;
      else if (D_en)
          D_ctrl_unsigned_lo_imm16 <= D_ctrl_unsigned_lo_imm16_nxt;
    end


  assign E_ctrl_unsigned_lo_imm16_nxt = D_ctrl_unsigned_lo_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_unsigned_lo_imm16 <= 0;
      else if (E_en)
          E_ctrl_unsigned_lo_imm16 <= E_ctrl_unsigned_lo_imm16_nxt;
    end


  assign M_ctrl_unsigned_lo_imm16_nxt = E_ctrl_unsigned_lo_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_unsigned_lo_imm16 <= 0;
      else if (M_en)
          M_ctrl_unsigned_lo_imm16 <= M_ctrl_unsigned_lo_imm16_nxt;
    end


  assign A_ctrl_unsigned_lo_imm16_nxt = M_ctrl_unsigned_lo_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_unsigned_lo_imm16 <= 0;
      else if (A_en)
          A_ctrl_unsigned_lo_imm16 <= A_ctrl_unsigned_lo_imm16_nxt;
    end


  assign W_ctrl_unsigned_lo_imm16_nxt = A_ctrl_unsigned_lo_imm16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_unsigned_lo_imm16 <= 0;
      else if (W_en)
          W_ctrl_unsigned_lo_imm16 <= W_ctrl_unsigned_lo_imm16_nxt;
    end


  assign D_ctrl_cmp = D_op_cmpgei|
    D_op_cmplti|
    D_op_cmpnei|
    D_op_cmpgeui|
    D_op_cmpltui|
    D_op_cmpeqi|
    D_op_rsvx00|
    D_op_cmpge|
    D_op_cmplt|
    D_op_cmpne|
    D_op_cmpgeu|
    D_op_cmpltu|
    D_op_cmpeq|
    D_op_rsvx56;

  assign E_ctrl_cmp_nxt = D_ctrl_cmp;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_cmp <= 0;
      else if (E_en)
          E_ctrl_cmp <= E_ctrl_cmp_nxt;
    end


  assign M_ctrl_cmp_nxt = E_ctrl_cmp;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_cmp <= 0;
      else if (M_en)
          M_ctrl_cmp <= M_ctrl_cmp_nxt;
    end


  assign A_ctrl_cmp_nxt = M_ctrl_cmp;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_cmp <= 0;
      else if (A_en)
          A_ctrl_cmp <= A_ctrl_cmp_nxt;
    end


  assign W_ctrl_cmp_nxt = A_ctrl_cmp;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_cmp <= 0;
      else if (W_en)
          W_ctrl_cmp <= W_ctrl_cmp_nxt;
    end


  assign D_ctrl_br_cond = D_op_bge|
    D_op_rsv10|
    D_op_blt|
    D_op_bne|
    D_op_rsv62|
    D_op_bgeu|
    D_op_rsv42|
    D_op_bltu|
    D_op_beq|
    D_op_rsv34;

  assign E_ctrl_br_cond_nxt = D_ctrl_br_cond;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_br_cond <= 0;
      else if (E_en)
          E_ctrl_br_cond <= E_ctrl_br_cond_nxt;
    end


  assign M_ctrl_br_cond_nxt = E_ctrl_br_cond;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_br_cond <= 0;
      else if (M_en)
          M_ctrl_br_cond <= M_ctrl_br_cond_nxt;
    end


  assign A_ctrl_br_cond_nxt = M_ctrl_br_cond;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_br_cond <= 0;
      else if (A_en)
          A_ctrl_br_cond <= A_ctrl_br_cond_nxt;
    end


  assign W_ctrl_br_cond_nxt = A_ctrl_br_cond;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_br_cond <= 0;
      else if (W_en)
          W_ctrl_br_cond <= W_ctrl_br_cond_nxt;
    end


  assign F_ctrl_br_uncond = F_op_br|F_op_rsv02;
  assign D_ctrl_br_uncond_nxt = F_ctrl_br_uncond;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_br_uncond <= 0;
      else if (D_en)
          D_ctrl_br_uncond <= D_ctrl_br_uncond_nxt;
    end


  assign E_ctrl_br_uncond_nxt = D_ctrl_br_uncond;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_br_uncond <= 0;
      else if (E_en)
          E_ctrl_br_uncond <= E_ctrl_br_uncond_nxt;
    end


  assign M_ctrl_br_uncond_nxt = E_ctrl_br_uncond;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_br_uncond <= 0;
      else if (M_en)
          M_ctrl_br_uncond <= M_ctrl_br_uncond_nxt;
    end


  assign A_ctrl_br_uncond_nxt = M_ctrl_br_uncond;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_br_uncond <= 0;
      else if (A_en)
          A_ctrl_br_uncond <= A_ctrl_br_uncond_nxt;
    end


  assign W_ctrl_br_uncond_nxt = A_ctrl_br_uncond;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_br_uncond <= 0;
      else if (W_en)
          W_ctrl_br_uncond <= W_ctrl_br_uncond_nxt;
    end


  assign D_ctrl_br_always_pred_taken = 1'b0;
  assign E_ctrl_br_always_pred_taken_nxt = D_ctrl_br_always_pred_taken;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_br_always_pred_taken <= 0;
      else if (E_en)
          E_ctrl_br_always_pred_taken <= E_ctrl_br_always_pred_taken_nxt;
    end


  assign M_ctrl_br_always_pred_taken_nxt = E_ctrl_br_always_pred_taken;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_br_always_pred_taken <= 0;
      else if (M_en)
          M_ctrl_br_always_pred_taken <= M_ctrl_br_always_pred_taken_nxt;
    end


  assign A_ctrl_br_always_pred_taken_nxt = M_ctrl_br_always_pred_taken;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_br_always_pred_taken <= 0;
      else if (A_en)
          A_ctrl_br_always_pred_taken <= A_ctrl_br_always_pred_taken_nxt;
    end


  assign W_ctrl_br_always_pred_taken_nxt = A_ctrl_br_always_pred_taken;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_br_always_pred_taken <= 0;
      else if (W_en)
          W_ctrl_br_always_pred_taken <= W_ctrl_br_always_pred_taken_nxt;
    end


  assign F_ctrl_br = F_op_br|
    F_op_bge|
    F_op_blt|
    F_op_bne|
    F_op_beq|
    F_op_bgeu|
    F_op_bltu|
    F_op_rsv62;

  assign D_ctrl_br_nxt = F_ctrl_br;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_br <= 0;
      else if (D_en)
          D_ctrl_br <= D_ctrl_br_nxt;
    end


  assign E_ctrl_br_nxt = D_ctrl_br;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_br <= 0;
      else if (E_en)
          E_ctrl_br <= E_ctrl_br_nxt;
    end


  assign M_ctrl_br_nxt = E_ctrl_br;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_br <= 0;
      else if (M_en)
          M_ctrl_br <= M_ctrl_br_nxt;
    end


  assign A_ctrl_br_nxt = M_ctrl_br;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_br <= 0;
      else if (A_en)
          A_ctrl_br <= A_ctrl_br_nxt;
    end


  assign W_ctrl_br_nxt = A_ctrl_br;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_br <= 0;
      else if (W_en)
          W_ctrl_br <= W_ctrl_br_nxt;
    end


  assign D_ctrl_alu_subtract = D_op_sub|
    D_op_rsvx25|
    D_op_cmplti|
    D_op_cmpltui|
    D_op_cmplt|
    D_op_cmpltu|
    D_op_blt|
    D_op_bltu|
    D_op_cmpgei|
    D_op_cmpgeui|
    D_op_cmpge|
    D_op_cmpgeu|
    D_op_bge|
    D_op_rsv10|
    D_op_bgeu|
    D_op_rsv42;

  assign E_ctrl_alu_subtract_nxt = D_ctrl_alu_subtract;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_alu_subtract <= 0;
      else if (E_en)
          E_ctrl_alu_subtract <= E_ctrl_alu_subtract_nxt;
    end


  assign M_ctrl_alu_subtract_nxt = E_ctrl_alu_subtract;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_alu_subtract <= 0;
      else if (M_en)
          M_ctrl_alu_subtract <= M_ctrl_alu_subtract_nxt;
    end


  assign A_ctrl_alu_subtract_nxt = M_ctrl_alu_subtract;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_alu_subtract <= 0;
      else if (A_en)
          A_ctrl_alu_subtract <= A_ctrl_alu_subtract_nxt;
    end


  assign W_ctrl_alu_subtract_nxt = A_ctrl_alu_subtract;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_alu_subtract <= 0;
      else if (W_en)
          W_ctrl_alu_subtract <= W_ctrl_alu_subtract_nxt;
    end


  assign D_ctrl_alu_signed_comparison = D_op_cmpge|D_op_cmpgei|D_op_cmplt|D_op_cmplti|D_op_bge|D_op_blt;
  assign E_ctrl_alu_signed_comparison_nxt = D_ctrl_alu_signed_comparison;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_alu_signed_comparison <= 0;
      else if (E_en)
          E_ctrl_alu_signed_comparison <= E_ctrl_alu_signed_comparison_nxt;
    end


  assign M_ctrl_alu_signed_comparison_nxt = E_ctrl_alu_signed_comparison;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_alu_signed_comparison <= 0;
      else if (M_en)
          M_ctrl_alu_signed_comparison <= M_ctrl_alu_signed_comparison_nxt;
    end


  assign A_ctrl_alu_signed_comparison_nxt = M_ctrl_alu_signed_comparison;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_alu_signed_comparison <= 0;
      else if (A_en)
          A_ctrl_alu_signed_comparison <= A_ctrl_alu_signed_comparison_nxt;
    end


  assign W_ctrl_alu_signed_comparison_nxt = A_ctrl_alu_signed_comparison;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_alu_signed_comparison <= 0;
      else if (W_en)
          W_ctrl_alu_signed_comparison <= W_ctrl_alu_signed_comparison_nxt;
    end


  assign E_ctrl_ld8 = E_op_ldb|E_op_ldbu|E_op_ldbio|E_op_ldbuio;
  assign M_ctrl_ld8_nxt = E_ctrl_ld8;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld8 <= 0;
      else if (M_en)
          M_ctrl_ld8 <= M_ctrl_ld8_nxt;
    end


  assign A_ctrl_ld8_nxt = M_ctrl_ld8;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld8 <= 0;
      else if (A_en)
          A_ctrl_ld8 <= A_ctrl_ld8_nxt;
    end


  assign W_ctrl_ld8_nxt = A_ctrl_ld8;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld8 <= 0;
      else if (W_en)
          W_ctrl_ld8 <= W_ctrl_ld8_nxt;
    end


  assign E_ctrl_ld16 = E_op_ldhu|E_op_ldh|E_op_ldhio|E_op_ldhuio;
  assign M_ctrl_ld16_nxt = E_ctrl_ld16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld16 <= 0;
      else if (M_en)
          M_ctrl_ld16 <= M_ctrl_ld16_nxt;
    end


  assign A_ctrl_ld16_nxt = M_ctrl_ld16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld16 <= 0;
      else if (A_en)
          A_ctrl_ld16 <= A_ctrl_ld16_nxt;
    end


  assign W_ctrl_ld16_nxt = A_ctrl_ld16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld16 <= 0;
      else if (W_en)
          W_ctrl_ld16 <= W_ctrl_ld16_nxt;
    end


  assign E_ctrl_ld8_ld16 = E_op_ldb|
    E_op_ldbu|
    E_op_ldbio|
    E_op_ldbuio|
    E_op_ldhu|
    E_op_ldh|
    E_op_ldhio|
    E_op_ldhuio;

  assign M_ctrl_ld8_ld16_nxt = E_ctrl_ld8_ld16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld8_ld16 <= 0;
      else if (M_en)
          M_ctrl_ld8_ld16 <= M_ctrl_ld8_ld16_nxt;
    end


  assign A_ctrl_ld8_ld16_nxt = M_ctrl_ld8_ld16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld8_ld16 <= 0;
      else if (A_en)
          A_ctrl_ld8_ld16 <= A_ctrl_ld8_ld16_nxt;
    end


  assign W_ctrl_ld8_ld16_nxt = A_ctrl_ld8_ld16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld8_ld16 <= 0;
      else if (W_en)
          W_ctrl_ld8_ld16 <= W_ctrl_ld8_ld16_nxt;
    end


  assign E_ctrl_ld32 = E_op_ldw|E_op_ldl|E_op_ldwio|E_op_rsv63;
  assign M_ctrl_ld32_nxt = E_ctrl_ld32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld32 <= 0;
      else if (M_en)
          M_ctrl_ld32 <= M_ctrl_ld32_nxt;
    end


  assign A_ctrl_ld32_nxt = M_ctrl_ld32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld32 <= 0;
      else if (A_en)
          A_ctrl_ld32 <= A_ctrl_ld32_nxt;
    end


  assign W_ctrl_ld32_nxt = A_ctrl_ld32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld32 <= 0;
      else if (W_en)
          W_ctrl_ld32 <= W_ctrl_ld32_nxt;
    end


  assign E_ctrl_ld_signed = E_op_ldb|
    E_op_ldh|
    E_op_ldl|
    E_op_ldw|
    E_op_ldbio|
    E_op_ldhio|
    E_op_ldwio|
    E_op_rsv63;

  assign M_ctrl_ld_signed_nxt = E_ctrl_ld_signed;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_signed <= 0;
      else if (M_en)
          M_ctrl_ld_signed <= M_ctrl_ld_signed_nxt;
    end


  assign A_ctrl_ld_signed_nxt = M_ctrl_ld_signed;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_signed <= 0;
      else if (A_en)
          A_ctrl_ld_signed <= A_ctrl_ld_signed_nxt;
    end


  assign W_ctrl_ld_signed_nxt = A_ctrl_ld_signed;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld_signed <= 0;
      else if (W_en)
          W_ctrl_ld_signed <= W_ctrl_ld_signed_nxt;
    end


  assign D_ctrl_ld = D_op_ldb|
    D_op_ldh|
    D_op_ldl|
    D_op_ldw|
    D_op_ldbio|
    D_op_ldhio|
    D_op_ldwio|
    D_op_rsv63|
    D_op_ldbu|
    D_op_ldhu|
    D_op_ldbuio|
    D_op_ldhuio;

  assign E_ctrl_ld_nxt = D_ctrl_ld;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_ld <= 0;
      else if (E_en)
          E_ctrl_ld <= E_ctrl_ld_nxt;
    end


  assign M_ctrl_ld_nxt = E_ctrl_ld;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld <= 0;
      else if (M_en)
          M_ctrl_ld <= M_ctrl_ld_nxt;
    end


  assign A_ctrl_ld_nxt = M_ctrl_ld;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld <= 0;
      else if (A_en)
          A_ctrl_ld <= A_ctrl_ld_nxt;
    end


  assign W_ctrl_ld_nxt = A_ctrl_ld;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld <= 0;
      else if (W_en)
          W_ctrl_ld <= W_ctrl_ld_nxt;
    end


  assign E_ctrl_ld_dcache_management = E_op_initd|
    E_op_initda|
    E_op_flushd|
    E_op_flushda|
    E_op_ldb|
    E_op_ldh|
    E_op_ldl|
    E_op_ldw|
    E_op_ldbio|
    E_op_ldhio|
    E_op_ldwio|
    E_op_rsv63|
    E_op_ldbu|
    E_op_ldhu|
    E_op_ldbuio|
    E_op_ldhuio;

  assign M_ctrl_ld_dcache_management_nxt = E_ctrl_ld_dcache_management;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_dcache_management <= 0;
      else if (M_en)
          M_ctrl_ld_dcache_management <= M_ctrl_ld_dcache_management_nxt;
    end


  assign A_ctrl_ld_dcache_management_nxt = M_ctrl_ld_dcache_management;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_dcache_management <= 0;
      else if (A_en)
          A_ctrl_ld_dcache_management <= A_ctrl_ld_dcache_management_nxt;
    end


  assign W_ctrl_ld_dcache_management_nxt = A_ctrl_ld_dcache_management;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld_dcache_management <= 0;
      else if (W_en)
          W_ctrl_ld_dcache_management <= W_ctrl_ld_dcache_management_nxt;
    end


  assign E_ctrl_ld_non_io = E_op_ldbu|E_op_ldhu|E_op_ldb|E_op_ldh|E_op_ldw|E_op_ldl;
  assign M_ctrl_ld_non_io_nxt = E_ctrl_ld_non_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_non_io <= 0;
      else if (M_en)
          M_ctrl_ld_non_io <= M_ctrl_ld_non_io_nxt;
    end


  assign A_ctrl_ld_non_io_nxt = M_ctrl_ld_non_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_non_io <= 0;
      else if (A_en)
          A_ctrl_ld_non_io <= A_ctrl_ld_non_io_nxt;
    end


  assign W_ctrl_ld_non_io_nxt = A_ctrl_ld_non_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld_non_io <= 0;
      else if (W_en)
          W_ctrl_ld_non_io <= W_ctrl_ld_non_io_nxt;
    end


  assign E_ctrl_st8 = E_op_stb|E_op_stbio;
  assign M_ctrl_st8_nxt = E_ctrl_st8;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_st8 <= 0;
      else if (M_en)
          M_ctrl_st8 <= M_ctrl_st8_nxt;
    end


  assign A_ctrl_st8_nxt = M_ctrl_st8;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_st8 <= 0;
      else if (A_en)
          A_ctrl_st8 <= A_ctrl_st8_nxt;
    end


  assign W_ctrl_st8_nxt = A_ctrl_st8;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_st8 <= 0;
      else if (W_en)
          W_ctrl_st8 <= W_ctrl_st8_nxt;
    end


  assign E_ctrl_st16 = E_op_sth|E_op_rsv09|E_op_sthio|E_op_rsv41;
  assign M_ctrl_st16_nxt = E_ctrl_st16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_st16 <= 0;
      else if (M_en)
          M_ctrl_st16 <= M_ctrl_st16_nxt;
    end


  assign A_ctrl_st16_nxt = M_ctrl_st16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_st16 <= 0;
      else if (A_en)
          A_ctrl_st16 <= A_ctrl_st16_nxt;
    end


  assign W_ctrl_st16_nxt = A_ctrl_st16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_st16 <= 0;
      else if (W_en)
          W_ctrl_st16 <= W_ctrl_st16_nxt;
    end


  assign E_ctrl_st = E_op_stb|
    E_op_sth|
    E_op_stw|
    E_op_stc|
    E_op_stbio|
    E_op_sthio|
    E_op_stwio|
    E_op_rsv61;

  assign M_ctrl_st_nxt = E_ctrl_st;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_st <= 0;
      else if (M_en)
          M_ctrl_st <= M_ctrl_st_nxt;
    end


  assign A_ctrl_st_nxt = M_ctrl_st;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_st <= 0;
      else if (A_en)
          A_ctrl_st <= A_ctrl_st_nxt;
    end


  assign W_ctrl_st_nxt = A_ctrl_st;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_st <= 0;
      else if (W_en)
          W_ctrl_st <= W_ctrl_st_nxt;
    end


  assign E_ctrl_st_non_io = E_op_stb|E_op_sth|E_op_stw|E_op_stc;
  assign M_ctrl_st_non_io_nxt = E_ctrl_st_non_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_st_non_io <= 0;
      else if (M_en)
          M_ctrl_st_non_io <= M_ctrl_st_non_io_nxt;
    end


  assign A_ctrl_st_non_io_nxt = M_ctrl_st_non_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_st_non_io <= 0;
      else if (A_en)
          A_ctrl_st_non_io <= A_ctrl_st_non_io_nxt;
    end


  assign W_ctrl_st_non_io_nxt = A_ctrl_st_non_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_st_non_io <= 0;
      else if (W_en)
          W_ctrl_st_non_io <= W_ctrl_st_non_io_nxt;
    end


  assign E_ctrl_ld_st = E_op_ldb|
    E_op_ldh|
    E_op_ldl|
    E_op_ldw|
    E_op_ldbio|
    E_op_ldhio|
    E_op_ldwio|
    E_op_rsv63|
    E_op_ldbu|
    E_op_ldhu|
    E_op_ldbuio|
    E_op_ldhuio|
    E_op_stb|
    E_op_sth|
    E_op_stw|
    E_op_stc|
    E_op_stbio|
    E_op_sthio|
    E_op_stwio|
    E_op_rsv61;

  assign M_ctrl_ld_st_nxt = E_ctrl_ld_st;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_st <= 0;
      else if (M_en)
          M_ctrl_ld_st <= M_ctrl_ld_st_nxt;
    end


  assign A_ctrl_ld_st_nxt = M_ctrl_ld_st;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_st <= 0;
      else if (A_en)
          A_ctrl_ld_st <= A_ctrl_ld_st_nxt;
    end


  assign W_ctrl_ld_st_nxt = A_ctrl_ld_st;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld_st <= 0;
      else if (W_en)
          W_ctrl_ld_st <= W_ctrl_ld_st_nxt;
    end


  assign E_ctrl_ld_st_io = E_op_ldbuio|
    E_op_ldhuio|
    E_op_ldbio|
    E_op_ldhio|
    E_op_ldwio|
    E_op_rsv63|
    E_op_stbio|
    E_op_rsv33|
    E_op_sthio|
    E_op_rsv41|
    E_op_stwio|
    E_op_rsv49|
    E_op_rsv61|
    E_op_rsv57;

  assign M_ctrl_ld_st_io_nxt = E_ctrl_ld_st_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_st_io <= 0;
      else if (M_en)
          M_ctrl_ld_st_io <= M_ctrl_ld_st_io_nxt;
    end


  assign A_ctrl_ld_st_io_nxt = M_ctrl_ld_st_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_st_io <= 0;
      else if (A_en)
          A_ctrl_ld_st_io <= A_ctrl_ld_st_io_nxt;
    end


  assign W_ctrl_ld_st_io_nxt = A_ctrl_ld_st_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld_st_io <= 0;
      else if (W_en)
          W_ctrl_ld_st_io <= W_ctrl_ld_st_io_nxt;
    end


  assign E_ctrl_ld_st_non_io = E_op_ldbu|
    E_op_ldhu|
    E_op_ldb|
    E_op_ldh|
    E_op_ldw|
    E_op_ldl|
    E_op_stb|
    E_op_sth|
    E_op_stw|
    E_op_stc;

  assign M_ctrl_ld_st_non_io_nxt = E_ctrl_ld_st_non_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_st_non_io <= 0;
      else if (M_en)
          M_ctrl_ld_st_non_io <= M_ctrl_ld_st_non_io_nxt;
    end


  assign A_ctrl_ld_st_non_io_nxt = M_ctrl_ld_st_non_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_st_non_io <= 0;
      else if (A_en)
          A_ctrl_ld_st_non_io <= A_ctrl_ld_st_non_io_nxt;
    end


  assign W_ctrl_ld_st_non_io_nxt = A_ctrl_ld_st_non_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld_st_non_io <= 0;
      else if (W_en)
          W_ctrl_ld_st_non_io <= W_ctrl_ld_st_non_io_nxt;
    end


  assign E_ctrl_ld_st_non_io_non_st32 = E_op_stb|
    E_op_sth|
    E_op_ldbu|
    E_op_ldhu|
    E_op_ldb|
    E_op_ldh|
    E_op_ldw|
    E_op_ldl;

  assign M_ctrl_ld_st_non_io_non_st32_nxt = E_ctrl_ld_st_non_io_non_st32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_st_non_io_non_st32 <= 0;
      else if (M_en)
          M_ctrl_ld_st_non_io_non_st32 <= M_ctrl_ld_st_non_io_non_st32_nxt;
    end


  assign A_ctrl_ld_st_non_io_non_st32_nxt = M_ctrl_ld_st_non_io_non_st32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_st_non_io_non_st32 <= 0;
      else if (A_en)
          A_ctrl_ld_st_non_io_non_st32 <= A_ctrl_ld_st_non_io_non_st32_nxt;
    end


  assign W_ctrl_ld_st_non_io_non_st32_nxt = A_ctrl_ld_st_non_io_non_st32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld_st_non_io_non_st32 <= 0;
      else if (W_en)
          W_ctrl_ld_st_non_io_non_st32 <= W_ctrl_ld_st_non_io_non_st32_nxt;
    end


  assign E_ctrl_ld_st_non_st32 = E_op_ldb|
    E_op_ldh|
    E_op_ldl|
    E_op_ldw|
    E_op_ldbio|
    E_op_ldhio|
    E_op_ldwio|
    E_op_rsv63|
    E_op_ldbu|
    E_op_ldhu|
    E_op_ldbuio|
    E_op_ldhuio|
    E_op_stb|
    E_op_stbio|
    E_op_sth|
    E_op_rsv09|
    E_op_sthio|
    E_op_rsv41;

  assign M_ctrl_ld_st_non_st32_nxt = E_ctrl_ld_st_non_st32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_st_non_st32 <= 0;
      else if (M_en)
          M_ctrl_ld_st_non_st32 <= M_ctrl_ld_st_non_st32_nxt;
    end


  assign A_ctrl_ld_st_non_st32_nxt = M_ctrl_ld_st_non_st32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_st_non_st32 <= 0;
      else if (A_en)
          A_ctrl_ld_st_non_st32 <= A_ctrl_ld_st_non_st32_nxt;
    end


  assign W_ctrl_ld_st_non_st32_nxt = A_ctrl_ld_st_non_st32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld_st_non_st32 <= 0;
      else if (W_en)
          W_ctrl_ld_st_non_st32 <= W_ctrl_ld_st_non_st32_nxt;
    end


  assign E_ctrl_mem = E_op_initd|
    E_op_initda|
    E_op_flushd|
    E_op_flushda|
    E_op_ldb|
    E_op_ldh|
    E_op_ldl|
    E_op_ldw|
    E_op_ldbio|
    E_op_ldhio|
    E_op_ldwio|
    E_op_rsv63|
    E_op_ldbu|
    E_op_ldhu|
    E_op_ldbuio|
    E_op_ldhuio|
    E_op_stb|
    E_op_sth|
    E_op_stw|
    E_op_stc|
    E_op_stbio|
    E_op_sthio|
    E_op_stwio|
    E_op_rsv61;

  assign M_ctrl_mem_nxt = E_ctrl_mem;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_mem <= 0;
      else if (M_en)
          M_ctrl_mem <= M_ctrl_mem_nxt;
    end


  assign A_ctrl_mem_nxt = M_ctrl_mem;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_mem <= 0;
      else if (A_en)
          A_ctrl_mem <= A_ctrl_mem_nxt;
    end


  assign W_ctrl_mem_nxt = A_ctrl_mem;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_mem <= 0;
      else if (W_en)
          W_ctrl_mem <= W_ctrl_mem_nxt;
    end


  assign E_ctrl_mem_data_access = E_op_flushda|
    E_op_initda|
    E_op_ldb|
    E_op_ldh|
    E_op_ldl|
    E_op_ldw|
    E_op_ldbio|
    E_op_ldhio|
    E_op_ldwio|
    E_op_rsv63|
    E_op_ldbu|
    E_op_ldhu|
    E_op_ldbuio|
    E_op_ldhuio|
    E_op_stb|
    E_op_sth|
    E_op_stw|
    E_op_stc|
    E_op_stbio|
    E_op_sthio|
    E_op_stwio|
    E_op_rsv61;

  assign M_ctrl_mem_data_access_nxt = E_ctrl_mem_data_access;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_mem_data_access <= 0;
      else if (M_en)
          M_ctrl_mem_data_access <= M_ctrl_mem_data_access_nxt;
    end


  assign A_ctrl_mem_data_access_nxt = M_ctrl_mem_data_access;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_mem_data_access <= 0;
      else if (A_en)
          A_ctrl_mem_data_access <= A_ctrl_mem_data_access_nxt;
    end


  assign W_ctrl_mem_data_access_nxt = A_ctrl_mem_data_access;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_mem_data_access <= 0;
      else if (W_en)
          W_ctrl_mem_data_access <= W_ctrl_mem_data_access_nxt;
    end


  assign E_ctrl_mem8 = E_op_ldb|E_op_ldbu|E_op_ldbio|E_op_ldbuio|E_op_stb|E_op_stbio;
  assign M_ctrl_mem8_nxt = E_ctrl_mem8;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_mem8 <= 0;
      else if (M_en)
          M_ctrl_mem8 <= M_ctrl_mem8_nxt;
    end


  assign A_ctrl_mem8_nxt = M_ctrl_mem8;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_mem8 <= 0;
      else if (A_en)
          A_ctrl_mem8 <= A_ctrl_mem8_nxt;
    end


  assign W_ctrl_mem8_nxt = A_ctrl_mem8;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_mem8 <= 0;
      else if (W_en)
          W_ctrl_mem8 <= W_ctrl_mem8_nxt;
    end


  assign E_ctrl_mem16 = E_op_ldhu|
    E_op_ldh|
    E_op_ldhio|
    E_op_ldhuio|
    E_op_sth|
    E_op_rsv09|
    E_op_sthio|
    E_op_rsv41;

  assign M_ctrl_mem16_nxt = E_ctrl_mem16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_mem16 <= 0;
      else if (M_en)
          M_ctrl_mem16 <= M_ctrl_mem16_nxt;
    end


  assign A_ctrl_mem16_nxt = M_ctrl_mem16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_mem16 <= 0;
      else if (A_en)
          A_ctrl_mem16 <= A_ctrl_mem16_nxt;
    end


  assign W_ctrl_mem16_nxt = A_ctrl_mem16;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_mem16 <= 0;
      else if (W_en)
          W_ctrl_mem16 <= W_ctrl_mem16_nxt;
    end


  assign E_ctrl_mem32 = E_op_ldw|
    E_op_ldl|
    E_op_ldwio|
    E_op_rsv63|
    E_op_stw|
    E_op_rsv17|
    E_op_stc|
    E_op_rsv25|
    E_op_stwio|
    E_op_rsv49|
    E_op_rsv61|
    E_op_rsv57;

  assign M_ctrl_mem32_nxt = E_ctrl_mem32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_mem32 <= 0;
      else if (M_en)
          M_ctrl_mem32 <= M_ctrl_mem32_nxt;
    end


  assign A_ctrl_mem32_nxt = M_ctrl_mem32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_mem32 <= 0;
      else if (A_en)
          A_ctrl_mem32 <= A_ctrl_mem32_nxt;
    end


  assign W_ctrl_mem32_nxt = A_ctrl_mem32;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_mem32 <= 0;
      else if (W_en)
          W_ctrl_mem32 <= W_ctrl_mem32_nxt;
    end


  assign E_ctrl_dc_index_nowb_inv = E_op_initd|E_op_rsv49;
  assign M_ctrl_dc_index_nowb_inv_nxt = E_ctrl_dc_index_nowb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_dc_index_nowb_inv <= 0;
      else if (M_en)
          M_ctrl_dc_index_nowb_inv <= M_ctrl_dc_index_nowb_inv_nxt;
    end


  assign A_ctrl_dc_index_nowb_inv_nxt = M_ctrl_dc_index_nowb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_dc_index_nowb_inv <= 0;
      else if (A_en)
          A_ctrl_dc_index_nowb_inv <= A_ctrl_dc_index_nowb_inv_nxt;
    end


  assign W_ctrl_dc_index_nowb_inv_nxt = A_ctrl_dc_index_nowb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_dc_index_nowb_inv <= 0;
      else if (W_en)
          W_ctrl_dc_index_nowb_inv <= W_ctrl_dc_index_nowb_inv_nxt;
    end


  assign E_ctrl_dc_addr_nowb_inv = E_op_initda|E_op_rsv17;
  assign M_ctrl_dc_addr_nowb_inv_nxt = E_ctrl_dc_addr_nowb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_dc_addr_nowb_inv <= 0;
      else if (M_en)
          M_ctrl_dc_addr_nowb_inv <= M_ctrl_dc_addr_nowb_inv_nxt;
    end


  assign A_ctrl_dc_addr_nowb_inv_nxt = M_ctrl_dc_addr_nowb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_dc_addr_nowb_inv <= 0;
      else if (A_en)
          A_ctrl_dc_addr_nowb_inv <= A_ctrl_dc_addr_nowb_inv_nxt;
    end


  assign W_ctrl_dc_addr_nowb_inv_nxt = A_ctrl_dc_addr_nowb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_dc_addr_nowb_inv <= 0;
      else if (W_en)
          W_ctrl_dc_addr_nowb_inv <= W_ctrl_dc_addr_nowb_inv_nxt;
    end


  assign E_ctrl_dc_index_wb_inv = E_op_flushd|E_op_rsv57;
  assign M_ctrl_dc_index_wb_inv_nxt = E_ctrl_dc_index_wb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_dc_index_wb_inv <= 0;
      else if (M_en)
          M_ctrl_dc_index_wb_inv <= M_ctrl_dc_index_wb_inv_nxt;
    end


  assign A_ctrl_dc_index_wb_inv_nxt = M_ctrl_dc_index_wb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_dc_index_wb_inv <= 0;
      else if (A_en)
          A_ctrl_dc_index_wb_inv <= A_ctrl_dc_index_wb_inv_nxt;
    end


  assign W_ctrl_dc_index_wb_inv_nxt = A_ctrl_dc_index_wb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_dc_index_wb_inv <= 0;
      else if (W_en)
          W_ctrl_dc_index_wb_inv <= W_ctrl_dc_index_wb_inv_nxt;
    end


  assign E_ctrl_dc_addr_wb_inv = E_op_flushda|E_op_rsv25;
  assign M_ctrl_dc_addr_wb_inv_nxt = E_ctrl_dc_addr_wb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_dc_addr_wb_inv <= 0;
      else if (M_en)
          M_ctrl_dc_addr_wb_inv <= M_ctrl_dc_addr_wb_inv_nxt;
    end


  assign A_ctrl_dc_addr_wb_inv_nxt = M_ctrl_dc_addr_wb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_dc_addr_wb_inv <= 0;
      else if (A_en)
          A_ctrl_dc_addr_wb_inv <= A_ctrl_dc_addr_wb_inv_nxt;
    end


  assign W_ctrl_dc_addr_wb_inv_nxt = A_ctrl_dc_addr_wb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_dc_addr_wb_inv <= 0;
      else if (W_en)
          W_ctrl_dc_addr_wb_inv <= W_ctrl_dc_addr_wb_inv_nxt;
    end


  assign E_ctrl_dc_index_inv = E_op_initd|E_op_rsv49|E_op_flushd|E_op_rsv57;
  assign M_ctrl_dc_index_inv_nxt = E_ctrl_dc_index_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_dc_index_inv <= 0;
      else if (M_en)
          M_ctrl_dc_index_inv <= M_ctrl_dc_index_inv_nxt;
    end


  assign A_ctrl_dc_index_inv_nxt = M_ctrl_dc_index_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_dc_index_inv <= 0;
      else if (A_en)
          A_ctrl_dc_index_inv <= A_ctrl_dc_index_inv_nxt;
    end


  assign W_ctrl_dc_index_inv_nxt = A_ctrl_dc_index_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_dc_index_inv <= 0;
      else if (W_en)
          W_ctrl_dc_index_inv <= W_ctrl_dc_index_inv_nxt;
    end


  assign E_ctrl_dc_addr_inv = E_op_initda|E_op_rsv17|E_op_flushda|E_op_rsv25;
  assign M_ctrl_dc_addr_inv_nxt = E_ctrl_dc_addr_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_dc_addr_inv <= 0;
      else if (M_en)
          M_ctrl_dc_addr_inv <= M_ctrl_dc_addr_inv_nxt;
    end


  assign A_ctrl_dc_addr_inv_nxt = M_ctrl_dc_addr_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_dc_addr_inv <= 0;
      else if (A_en)
          A_ctrl_dc_addr_inv <= A_ctrl_dc_addr_inv_nxt;
    end


  assign W_ctrl_dc_addr_inv_nxt = A_ctrl_dc_addr_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_dc_addr_inv <= 0;
      else if (W_en)
          W_ctrl_dc_addr_inv <= W_ctrl_dc_addr_inv_nxt;
    end


  assign E_ctrl_dc_nowb_inv = E_op_initd|E_op_rsv49|E_op_initda|E_op_rsv17;
  assign M_ctrl_dc_nowb_inv_nxt = E_ctrl_dc_nowb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_dc_nowb_inv <= 0;
      else if (M_en)
          M_ctrl_dc_nowb_inv <= M_ctrl_dc_nowb_inv_nxt;
    end


  assign A_ctrl_dc_nowb_inv_nxt = M_ctrl_dc_nowb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_dc_nowb_inv <= 0;
      else if (A_en)
          A_ctrl_dc_nowb_inv <= A_ctrl_dc_nowb_inv_nxt;
    end


  assign W_ctrl_dc_nowb_inv_nxt = A_ctrl_dc_nowb_inv;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_dc_nowb_inv <= 0;
      else if (W_en)
          W_ctrl_dc_nowb_inv <= W_ctrl_dc_nowb_inv_nxt;
    end


  assign E_ctrl_dcache_management = E_op_initd|
    E_op_rsv49|
    E_op_flushd|
    E_op_rsv57|
    E_op_initda|
    E_op_rsv17|
    E_op_flushda|
    E_op_rsv25;

  assign M_ctrl_dcache_management_nxt = E_ctrl_dcache_management;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_dcache_management <= 0;
      else if (M_en)
          M_ctrl_dcache_management <= M_ctrl_dcache_management_nxt;
    end


  assign A_ctrl_dcache_management_nxt = M_ctrl_dcache_management;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_dcache_management <= 0;
      else if (A_en)
          A_ctrl_dcache_management <= A_ctrl_dcache_management_nxt;
    end


  assign W_ctrl_dcache_management_nxt = A_ctrl_dcache_management;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_dcache_management <= 0;
      else if (W_en)
          W_ctrl_dcache_management <= W_ctrl_dcache_management_nxt;
    end


  assign E_ctrl_ld_io = E_op_ldbuio|E_op_ldhuio|E_op_ldbio|E_op_ldhio|E_op_ldwio|E_op_rsv63;
  assign M_ctrl_ld_io_nxt = E_ctrl_ld_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ld_io <= 0;
      else if (M_en)
          M_ctrl_ld_io <= M_ctrl_ld_io_nxt;
    end


  assign A_ctrl_ld_io_nxt = M_ctrl_ld_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ld_io <= 0;
      else if (A_en)
          A_ctrl_ld_io <= A_ctrl_ld_io_nxt;
    end


  assign W_ctrl_ld_io_nxt = A_ctrl_ld_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ld_io <= 0;
      else if (W_en)
          W_ctrl_ld_io <= W_ctrl_ld_io_nxt;
    end


  assign E_ctrl_st_io = E_op_stbio|
    E_op_rsv33|
    E_op_sthio|
    E_op_rsv41|
    E_op_stwio|
    E_op_rsv49|
    E_op_rsv61|
    E_op_rsv57;

  assign M_ctrl_st_io_nxt = E_ctrl_st_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_st_io <= 0;
      else if (M_en)
          M_ctrl_st_io <= M_ctrl_st_io_nxt;
    end


  assign A_ctrl_st_io_nxt = M_ctrl_st_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_st_io <= 0;
      else if (A_en)
          A_ctrl_st_io <= A_ctrl_st_io_nxt;
    end


  assign W_ctrl_st_io_nxt = A_ctrl_st_io;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_st_io <= 0;
      else if (W_en)
          W_ctrl_st_io <= W_ctrl_st_io_nxt;
    end


  assign F_ctrl_a_not_src = (F_op_call|F_op_jmpi) | (F_op_custom & ~F_iw_custom_readra);
  assign D_ctrl_a_not_src_nxt = F_ctrl_a_not_src;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_a_not_src <= 0;
      else if (D_en)
          D_ctrl_a_not_src <= D_ctrl_a_not_src_nxt;
    end


  assign E_ctrl_a_not_src_nxt = D_ctrl_a_not_src;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_a_not_src <= 0;
      else if (E_en)
          E_ctrl_a_not_src <= E_ctrl_a_not_src_nxt;
    end


  assign M_ctrl_a_not_src_nxt = E_ctrl_a_not_src;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_a_not_src <= 0;
      else if (M_en)
          M_ctrl_a_not_src <= M_ctrl_a_not_src_nxt;
    end


  assign A_ctrl_a_not_src_nxt = M_ctrl_a_not_src;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_a_not_src <= 0;
      else if (A_en)
          A_ctrl_a_not_src <= A_ctrl_a_not_src_nxt;
    end


  assign W_ctrl_a_not_src_nxt = A_ctrl_a_not_src;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_a_not_src <= 0;
      else if (W_en)
          W_ctrl_a_not_src <= W_ctrl_a_not_src_nxt;
    end


  assign F_ctrl_b_not_src = (F_op_addi|
    F_op_muli|
    F_op_andhi|
    F_op_orhi|
    F_op_xorhi|
    F_op_andi|
    F_op_ori|
    F_op_xori|
    F_op_call|
    F_op_rdprs|
    F_op_cmpgei|
    F_op_cmplti|
    F_op_cmpnei|
    F_op_cmpgeui|
    F_op_cmpltui|
    F_op_cmpeqi|
    F_op_jmpi|
    F_op_rsv09|
    F_op_rsv17|
    F_op_rsv25|
    F_op_rsv33|
    F_op_rsv41|
    F_op_rsv49|
    F_op_rsv57|
    F_op_ldb|
    F_op_ldh|
    F_op_ldl|
    F_op_ldw|
    F_op_ldbio|
    F_op_ldhio|
    F_op_ldwio|
    F_op_rsv63|
    F_op_ldbu|
    F_op_ldhu|
    F_op_ldbuio|
    F_op_ldhuio|
    F_op_initd|
    F_op_initda|
    F_op_flushd|
    F_op_flushda) | (F_op_custom & ~F_iw_custom_readrb);

  assign D_ctrl_b_not_src_nxt = F_ctrl_b_not_src;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_b_not_src <= 0;
      else if (D_en)
          D_ctrl_b_not_src <= D_ctrl_b_not_src_nxt;
    end


  assign E_ctrl_b_not_src_nxt = D_ctrl_b_not_src;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_b_not_src <= 0;
      else if (E_en)
          E_ctrl_b_not_src <= E_ctrl_b_not_src_nxt;
    end


  assign M_ctrl_b_not_src_nxt = E_ctrl_b_not_src;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_b_not_src <= 0;
      else if (M_en)
          M_ctrl_b_not_src <= M_ctrl_b_not_src_nxt;
    end


  assign A_ctrl_b_not_src_nxt = M_ctrl_b_not_src;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_b_not_src <= 0;
      else if (A_en)
          A_ctrl_b_not_src <= A_ctrl_b_not_src_nxt;
    end


  assign W_ctrl_b_not_src_nxt = A_ctrl_b_not_src;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_b_not_src <= 0;
      else if (W_en)
          W_ctrl_b_not_src <= W_ctrl_b_not_src_nxt;
    end


  assign F_ctrl_b_is_dst = (F_op_addi|
    F_op_muli|
    F_op_andhi|
    F_op_orhi|
    F_op_xorhi|
    F_op_andi|
    F_op_ori|
    F_op_xori|
    F_op_call|
    F_op_rdprs|
    F_op_cmpgei|
    F_op_cmplti|
    F_op_cmpnei|
    F_op_cmpgeui|
    F_op_cmpltui|
    F_op_cmpeqi|
    F_op_jmpi|
    F_op_rsv09|
    F_op_rsv17|
    F_op_rsv25|
    F_op_rsv33|
    F_op_rsv41|
    F_op_rsv49|
    F_op_rsv57|
    F_op_ldb|
    F_op_ldh|
    F_op_ldl|
    F_op_ldw|
    F_op_ldbio|
    F_op_ldhio|
    F_op_ldwio|
    F_op_rsv63|
    F_op_ldbu|
    F_op_ldhu|
    F_op_ldbuio|
    F_op_ldhuio|
    F_op_initd|
    F_op_initda|
    F_op_flushd|
    F_op_flushda) & ~F_op_custom;

  assign D_ctrl_b_is_dst_nxt = F_ctrl_b_is_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_b_is_dst <= 0;
      else if (D_en)
          D_ctrl_b_is_dst <= D_ctrl_b_is_dst_nxt;
    end


  assign E_ctrl_b_is_dst_nxt = D_ctrl_b_is_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_b_is_dst <= 0;
      else if (E_en)
          E_ctrl_b_is_dst <= E_ctrl_b_is_dst_nxt;
    end


  assign M_ctrl_b_is_dst_nxt = E_ctrl_b_is_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_b_is_dst <= 0;
      else if (M_en)
          M_ctrl_b_is_dst <= M_ctrl_b_is_dst_nxt;
    end


  assign A_ctrl_b_is_dst_nxt = M_ctrl_b_is_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_b_is_dst <= 0;
      else if (A_en)
          A_ctrl_b_is_dst <= A_ctrl_b_is_dst_nxt;
    end


  assign W_ctrl_b_is_dst_nxt = A_ctrl_b_is_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_b_is_dst <= 0;
      else if (W_en)
          W_ctrl_b_is_dst <= W_ctrl_b_is_dst_nxt;
    end


  assign F_ctrl_ignore_dst = (F_op_br|
    F_op_bge|
    F_op_blt|
    F_op_bne|
    F_op_beq|
    F_op_bgeu|
    F_op_bltu|
    F_op_rsv62|
    F_op_stb|
    F_op_sth|
    F_op_stw|
    F_op_stc|
    F_op_stbio|
    F_op_sthio|
    F_op_stwio|
    F_op_rsv61|
    F_op_jmpi|
    F_op_rsv09|
    F_op_rsv17|
    F_op_rsv25|
    F_op_rsv33|
    F_op_rsv41|
    F_op_rsv49|
    F_op_rsv57) | (F_op_custom & ~F_iw_custom_writerc);

  assign D_ctrl_ignore_dst_nxt = F_ctrl_ignore_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_ignore_dst <= 0;
      else if (D_en)
          D_ctrl_ignore_dst <= D_ctrl_ignore_dst_nxt;
    end


  assign E_ctrl_ignore_dst_nxt = D_ctrl_ignore_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_ignore_dst <= 0;
      else if (E_en)
          E_ctrl_ignore_dst <= E_ctrl_ignore_dst_nxt;
    end


  assign M_ctrl_ignore_dst_nxt = E_ctrl_ignore_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_ignore_dst <= 0;
      else if (M_en)
          M_ctrl_ignore_dst <= M_ctrl_ignore_dst_nxt;
    end


  assign A_ctrl_ignore_dst_nxt = M_ctrl_ignore_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_ignore_dst <= 0;
      else if (A_en)
          A_ctrl_ignore_dst <= A_ctrl_ignore_dst_nxt;
    end


  assign W_ctrl_ignore_dst_nxt = A_ctrl_ignore_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_ignore_dst <= 0;
      else if (W_en)
          W_ctrl_ignore_dst <= W_ctrl_ignore_dst_nxt;
    end


  assign F_ctrl_src2_choose_imm = F_op_addi|
    F_op_muli|
    F_op_andhi|
    F_op_orhi|
    F_op_xorhi|
    F_op_andi|
    F_op_ori|
    F_op_xori|
    F_op_call|
    F_op_rdprs|
    F_op_cmpgei|
    F_op_cmplti|
    F_op_cmpnei|
    F_op_cmpgeui|
    F_op_cmpltui|
    F_op_cmpeqi|
    F_op_jmpi|
    F_op_rsv09|
    F_op_rsv17|
    F_op_rsv25|
    F_op_rsv33|
    F_op_rsv41|
    F_op_rsv49|
    F_op_rsv57|
    F_op_ldb|
    F_op_ldh|
    F_op_ldl|
    F_op_ldw|
    F_op_ldbio|
    F_op_ldhio|
    F_op_ldwio|
    F_op_rsv63|
    F_op_ldbu|
    F_op_ldhu|
    F_op_ldbuio|
    F_op_ldhuio|
    F_op_initd|
    F_op_initda|
    F_op_flushd|
    F_op_flushda|
    F_op_stb|
    F_op_sth|
    F_op_stw|
    F_op_stc|
    F_op_stbio|
    F_op_sthio|
    F_op_stwio|
    F_op_rsv61|
    F_op_roli|
    F_op_rsvx10|
    F_op_slli|
    F_op_srli|
    F_op_rsvx34|
    F_op_rsvx42|
    F_op_rsvx50|
    F_op_srai;

  assign D_ctrl_src2_choose_imm_nxt = F_ctrl_src2_choose_imm;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          D_ctrl_src2_choose_imm <= 0;
      else if (D_en)
          D_ctrl_src2_choose_imm <= D_ctrl_src2_choose_imm_nxt;
    end


  assign E_ctrl_src2_choose_imm_nxt = D_ctrl_src2_choose_imm;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_src2_choose_imm <= 0;
      else if (E_en)
          E_ctrl_src2_choose_imm <= E_ctrl_src2_choose_imm_nxt;
    end


  assign M_ctrl_src2_choose_imm_nxt = E_ctrl_src2_choose_imm;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_src2_choose_imm <= 0;
      else if (M_en)
          M_ctrl_src2_choose_imm <= M_ctrl_src2_choose_imm_nxt;
    end


  assign A_ctrl_src2_choose_imm_nxt = M_ctrl_src2_choose_imm;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_src2_choose_imm <= 0;
      else if (A_en)
          A_ctrl_src2_choose_imm <= A_ctrl_src2_choose_imm_nxt;
    end


  assign W_ctrl_src2_choose_imm_nxt = A_ctrl_src2_choose_imm;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_src2_choose_imm <= 0;
      else if (W_en)
          W_ctrl_src2_choose_imm <= W_ctrl_src2_choose_imm_nxt;
    end


  assign E_ctrl_wrctl_inst = E_op_wrctl;
  assign M_ctrl_wrctl_inst_nxt = E_ctrl_wrctl_inst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_wrctl_inst <= 0;
      else if (M_en)
          M_ctrl_wrctl_inst <= M_ctrl_wrctl_inst_nxt;
    end


  assign A_ctrl_wrctl_inst_nxt = M_ctrl_wrctl_inst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_wrctl_inst <= 0;
      else if (A_en)
          A_ctrl_wrctl_inst <= A_ctrl_wrctl_inst_nxt;
    end


  assign W_ctrl_wrctl_inst_nxt = A_ctrl_wrctl_inst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_wrctl_inst <= 0;
      else if (W_en)
          W_ctrl_wrctl_inst <= W_ctrl_wrctl_inst_nxt;
    end


  assign E_ctrl_rdctl_inst = E_op_rdctl;
  assign M_ctrl_rdctl_inst_nxt = E_ctrl_rdctl_inst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_rdctl_inst <= 0;
      else if (M_en)
          M_ctrl_rdctl_inst <= M_ctrl_rdctl_inst_nxt;
    end


  assign A_ctrl_rdctl_inst_nxt = M_ctrl_rdctl_inst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_rdctl_inst <= 0;
      else if (A_en)
          A_ctrl_rdctl_inst <= A_ctrl_rdctl_inst_nxt;
    end


  assign W_ctrl_rdctl_inst_nxt = A_ctrl_rdctl_inst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_rdctl_inst <= 0;
      else if (W_en)
          W_ctrl_rdctl_inst <= W_ctrl_rdctl_inst_nxt;
    end


  assign D_ctrl_flush_pipe_always = D_op_flushp|
    D_op_bret|
    D_op_wrprs|
    D_op_initi|
    D_op_flushi|
    D_op_wrctl|
    D_op_eret|
    D_op_trap|
    D_op_rsvx44|
    D_op_div|
    D_op_divu|
    D_op_mulxss|
    D_op_mulxsu|
    D_op_mulxuu|
    D_op_intr|
    D_op_rsvx60|
    D_op_break|
    D_op_hbreak|
    D_op_crst|
    D_op_rsvx63;

  assign E_ctrl_flush_pipe_always_nxt = D_ctrl_flush_pipe_always;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_flush_pipe_always <= 0;
      else if (E_en)
          E_ctrl_flush_pipe_always <= E_ctrl_flush_pipe_always_nxt;
    end


  assign M_ctrl_flush_pipe_always_nxt = E_ctrl_flush_pipe_always;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_flush_pipe_always <= 0;
      else if (M_en)
          M_ctrl_flush_pipe_always <= M_ctrl_flush_pipe_always_nxt;
    end


  assign A_ctrl_flush_pipe_always_nxt = M_ctrl_flush_pipe_always;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_flush_pipe_always <= 0;
      else if (A_en)
          A_ctrl_flush_pipe_always <= A_ctrl_flush_pipe_always_nxt;
    end


  assign W_ctrl_flush_pipe_always_nxt = A_ctrl_flush_pipe_always;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_flush_pipe_always <= 0;
      else if (W_en)
          W_ctrl_flush_pipe_always <= W_ctrl_flush_pipe_always_nxt;
    end


  assign D_ctrl_alu_force_xor = D_op_cmpgei|
    D_op_cmpgeui|
    D_op_cmpeqi|
    D_op_cmpge|
    D_op_cmpgeu|
    D_op_cmpeq|
    D_op_cmpnei|
    D_op_cmpne|
    D_op_bge|
    D_op_rsv10|
    D_op_bgeu|
    D_op_rsv42|
    D_op_beq|
    D_op_rsv34|
    D_op_bne|
    D_op_rsv62;

  assign E_ctrl_alu_force_xor_nxt = D_ctrl_alu_force_xor;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_alu_force_xor <= 0;
      else if (E_en)
          E_ctrl_alu_force_xor <= E_ctrl_alu_force_xor_nxt;
    end


  assign M_ctrl_alu_force_xor_nxt = E_ctrl_alu_force_xor;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_alu_force_xor <= 0;
      else if (M_en)
          M_ctrl_alu_force_xor <= M_ctrl_alu_force_xor_nxt;
    end


  assign A_ctrl_alu_force_xor_nxt = M_ctrl_alu_force_xor;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_alu_force_xor <= 0;
      else if (A_en)
          A_ctrl_alu_force_xor <= A_ctrl_alu_force_xor_nxt;
    end


  assign W_ctrl_alu_force_xor_nxt = A_ctrl_alu_force_xor;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_alu_force_xor <= 0;
      else if (W_en)
          W_ctrl_alu_force_xor <= W_ctrl_alu_force_xor_nxt;
    end


  assign D_ctrl_late_result = D_op_ldb|
    D_op_ldh|
    D_op_ldl|
    D_op_ldw|
    D_op_ldbio|
    D_op_ldhio|
    D_op_ldwio|
    D_op_rsv63|
    D_op_ldbu|
    D_op_ldhu|
    D_op_ldbuio|
    D_op_ldhuio|
    D_op_slli|
    D_op_rsvx50|
    D_op_sll|
    D_op_rsvx51|
    D_op_roli|
    D_op_rsvx34|
    D_op_rol|
    D_op_rsvx35|
    D_op_srli|
    D_op_srl|
    D_op_srai|
    D_op_sra|
    D_op_rsvx10|
    D_op_ror|
    D_op_rsvx42|
    D_op_rsvx43|
    D_op_rdctl|
    D_op_fpu|
    D_op_muli|
    D_op_mul|
    D_op_rsvx47|
    D_op_rsvx55|
    D_op_rsvx63;

  assign E_ctrl_late_result_nxt = D_ctrl_late_result;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_ctrl_late_result <= 0;
      else if (E_en)
          E_ctrl_late_result <= E_ctrl_late_result_nxt;
    end


  assign M_ctrl_late_result_nxt = E_ctrl_late_result;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M_ctrl_late_result <= 0;
      else if (M_en)
          M_ctrl_late_result <= M_ctrl_late_result_nxt;
    end


  assign A_ctrl_late_result_nxt = M_ctrl_late_result;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          A_ctrl_late_result <= 0;
      else if (A_en)
          A_ctrl_late_result <= A_ctrl_late_result_nxt;
    end


  assign W_ctrl_late_result_nxt = A_ctrl_late_result;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          W_ctrl_late_result <= 0;
      else if (W_en)
          W_ctrl_late_result <= W_ctrl_late_result_nxt;
    end


  //data_master, which is an e_avalon_master
  //instruction_master, which is an e_avalon_master

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign F_inst = (F_op_call)? 56'h20202063616c6c :
    (F_op_jmpi)? 56'h2020206a6d7069 :
    (F_op_ldbu)? 56'h2020206c646275 :
    (F_op_addi)? 56'h20202061646469 :
    (F_op_stb)? 56'h20202020737462 :
    (F_op_br)? 56'h20202020206272 :
    (F_op_ldb)? 56'h202020206c6462 :
    (F_op_cmpgei)? 56'h20636d70676569 :
    (F_op_ldhu)? 56'h2020206c646875 :
    (F_op_andi)? 56'h202020616e6469 :
    (F_op_sth)? 56'h20202020737468 :
    (F_op_bge)? 56'h20202020626765 :
    (F_op_ldh)? 56'h202020206c6468 :
    (F_op_cmplti)? 56'h20636d706c7469 :
    (F_op_initda)? 56'h20696e69746461 :
    (F_op_ori)? 56'h202020206f7269 :
    (F_op_stw)? 56'h20202020737477 :
    (F_op_blt)? 56'h20202020626c74 :
    (F_op_ldw)? 56'h202020206c6477 :
    (F_op_cmpnei)? 56'h20636d706e6569 :
    (F_op_flushda)? 56'h666c7573686461 :
    (F_op_xori)? 56'h202020786f7269 :
    (F_op_bne)? 56'h20202020626e65 :
    (F_op_cmpeqi)? 56'h20636d70657169 :
    (F_op_ldbuio)? 56'h206c646275696f :
    (F_op_muli)? 56'h2020206d756c69 :
    (F_op_stbio)? 56'h2020737462696f :
    (F_op_beq)? 56'h20202020626571 :
    (F_op_ldbio)? 56'h20206c6462696f :
    (F_op_cmpgeui)? 56'h636d7067657569 :
    (F_op_ldhuio)? 56'h206c646875696f :
    (F_op_andhi)? 56'h2020616e646869 :
    (F_op_sthio)? 56'h2020737468696f :
    (F_op_bgeu)? 56'h20202062676575 :
    (F_op_ldhio)? 56'h20206c6468696f :
    (F_op_cmpltui)? 56'h636d706c747569 :
    (F_op_initd)? 56'h2020696e697464 :
    (F_op_orhi)? 56'h2020206f726869 :
    (F_op_stwio)? 56'h2020737477696f :
    (F_op_bltu)? 56'h202020626c7475 :
    (F_op_ldwio)? 56'h20206c6477696f :
    (F_op_flushd)? 56'h20666c75736864 :
    (F_op_xorhi)? 56'h2020786f726869 :
    (F_op_eret)? 56'h20202065726574 :
    (F_op_roli)? 56'h202020726f6c69 :
    (F_op_rol)? 56'h20202020726f6c :
    (F_op_flushp)? 56'h20666c75736870 :
    (F_op_ret)? 56'h20202020726574 :
    (F_op_nor)? 56'h202020206e6f72 :
    (F_op_mulxuu)? 56'h206d756c787575 :
    (F_op_cmpge)? 56'h2020636d706765 :
    (F_op_bret)? 56'h20202062726574 :
    (F_op_ror)? 56'h20202020726f72 :
    (F_op_flushi)? 56'h20666c75736869 :
    (F_op_jmp)? 56'h202020206a6d70 :
    (F_op_and)? 56'h20202020616e64 :
    (F_op_cmplt)? 56'h2020636d706c74 :
    (F_op_slli)? 56'h202020736c6c69 :
    (F_op_sll)? 56'h20202020736c6c :
    (F_op_or)? 56'h20202020206f72 :
    (F_op_mulxsu)? 56'h206d756c787375 :
    (F_op_cmpne)? 56'h2020636d706e65 :
    (F_op_srli)? 56'h20202073726c69 :
    (F_op_srl)? 56'h2020202073726c :
    (F_op_nextpc)? 56'h206e6578747063 :
    (F_op_callr)? 56'h202063616c6c72 :
    (F_op_xor)? 56'h20202020786f72 :
    (F_op_mulxss)? 56'h206d756c787373 :
    (F_op_cmpeq)? 56'h2020636d706571 :
    (F_op_divu)? 56'h20202064697675 :
    (F_op_div)? 56'h20202020646976 :
    (F_op_rdctl)? 56'h2020726463746c :
    (F_op_mul)? 56'h202020206d756c :
    (F_op_cmpgeu)? 56'h20636d70676575 :
    (F_op_initi)? 56'h2020696e697469 :
    (F_op_trap)? 56'h20202074726170 :
    (F_op_wrctl)? 56'h2020777263746c :
    (F_op_cmpltu)? 56'h20636d706c7475 :
    (F_op_add)? 56'h20202020616464 :
    (F_op_break)? 56'h2020627265616b :
    (F_op_hbreak)? 56'h2068627265616b :
    (F_op_sync)? 56'h20202073796e63 :
    (F_op_sub)? 56'h20202020737562 :
    (F_op_srai)? 56'h20202073726169 :
    (F_op_sra)? 56'h20202020737261 :
    (F_op_intr)? 56'h202020696e7472 :
    (F_op_fpu)? 56'h20202020667075 :
    56'h20202020424144;

  assign D_inst = (D_op_call)? 56'h20202063616c6c :
    (D_op_jmpi)? 56'h2020206a6d7069 :
    (D_op_ldbu)? 56'h2020206c646275 :
    (D_op_addi)? 56'h20202061646469 :
    (D_op_stb)? 56'h20202020737462 :
    (D_op_br)? 56'h20202020206272 :
    (D_op_ldb)? 56'h202020206c6462 :
    (D_op_cmpgei)? 56'h20636d70676569 :
    (D_op_ldhu)? 56'h2020206c646875 :
    (D_op_andi)? 56'h202020616e6469 :
    (D_op_sth)? 56'h20202020737468 :
    (D_op_bge)? 56'h20202020626765 :
    (D_op_ldh)? 56'h202020206c6468 :
    (D_op_cmplti)? 56'h20636d706c7469 :
    (D_op_initda)? 56'h20696e69746461 :
    (D_op_ori)? 56'h202020206f7269 :
    (D_op_stw)? 56'h20202020737477 :
    (D_op_blt)? 56'h20202020626c74 :
    (D_op_ldw)? 56'h202020206c6477 :
    (D_op_cmpnei)? 56'h20636d706e6569 :
    (D_op_flushda)? 56'h666c7573686461 :
    (D_op_xori)? 56'h202020786f7269 :
    (D_op_bne)? 56'h20202020626e65 :
    (D_op_cmpeqi)? 56'h20636d70657169 :
    (D_op_ldbuio)? 56'h206c646275696f :
    (D_op_muli)? 56'h2020206d756c69 :
    (D_op_stbio)? 56'h2020737462696f :
    (D_op_beq)? 56'h20202020626571 :
    (D_op_ldbio)? 56'h20206c6462696f :
    (D_op_cmpgeui)? 56'h636d7067657569 :
    (D_op_ldhuio)? 56'h206c646875696f :
    (D_op_andhi)? 56'h2020616e646869 :
    (D_op_sthio)? 56'h2020737468696f :
    (D_op_bgeu)? 56'h20202062676575 :
    (D_op_ldhio)? 56'h20206c6468696f :
    (D_op_cmpltui)? 56'h636d706c747569 :
    (D_op_initd)? 56'h2020696e697464 :
    (D_op_orhi)? 56'h2020206f726869 :
    (D_op_stwio)? 56'h2020737477696f :
    (D_op_bltu)? 56'h202020626c7475 :
    (D_op_ldwio)? 56'h20206c6477696f :
    (D_op_flushd)? 56'h20666c75736864 :
    (D_op_xorhi)? 56'h2020786f726869 :
    (D_op_eret)? 56'h20202065726574 :
    (D_op_roli)? 56'h202020726f6c69 :
    (D_op_rol)? 56'h20202020726f6c :
    (D_op_flushp)? 56'h20666c75736870 :
    (D_op_ret)? 56'h20202020726574 :
    (D_op_nor)? 56'h202020206e6f72 :
    (D_op_mulxuu)? 56'h206d756c787575 :
    (D_op_cmpge)? 56'h2020636d706765 :
    (D_op_bret)? 56'h20202062726574 :
    (D_op_ror)? 56'h20202020726f72 :
    (D_op_flushi)? 56'h20666c75736869 :
    (D_op_jmp)? 56'h202020206a6d70 :
    (D_op_and)? 56'h20202020616e64 :
    (D_op_cmplt)? 56'h2020636d706c74 :
    (D_op_slli)? 56'h202020736c6c69 :
    (D_op_sll)? 56'h20202020736c6c :
    (D_op_or)? 56'h20202020206f72 :
    (D_op_mulxsu)? 56'h206d756c787375 :
    (D_op_cmpne)? 56'h2020636d706e65 :
    (D_op_srli)? 56'h20202073726c69 :
    (D_op_srl)? 56'h2020202073726c :
    (D_op_nextpc)? 56'h206e6578747063 :
    (D_op_callr)? 56'h202063616c6c72 :
    (D_op_xor)? 56'h20202020786f72 :
    (D_op_mulxss)? 56'h206d756c787373 :
    (D_op_cmpeq)? 56'h2020636d706571 :
    (D_op_divu)? 56'h20202064697675 :
    (D_op_div)? 56'h20202020646976 :
    (D_op_rdctl)? 56'h2020726463746c :
    (D_op_mul)? 56'h202020206d756c :
    (D_op_cmpgeu)? 56'h20636d70676575 :
    (D_op_initi)? 56'h2020696e697469 :
    (D_op_trap)? 56'h20202074726170 :
    (D_op_wrctl)? 56'h2020777263746c :
    (D_op_cmpltu)? 56'h20636d706c7475 :
    (D_op_add)? 56'h20202020616464 :
    (D_op_break)? 56'h2020627265616b :
    (D_op_hbreak)? 56'h2068627265616b :
    (D_op_sync)? 56'h20202073796e63 :
    (D_op_sub)? 56'h20202020737562 :
    (D_op_srai)? 56'h20202073726169 :
    (D_op_sra)? 56'h20202020737261 :
    (D_op_intr)? 56'h202020696e7472 :
    (D_op_fpu)? 56'h20202020667075 :
    56'h20202020424144;

  assign E_inst = (E_op_call)? 56'h20202063616c6c :
    (E_op_jmpi)? 56'h2020206a6d7069 :
    (E_op_ldbu)? 56'h2020206c646275 :
    (E_op_addi)? 56'h20202061646469 :
    (E_op_stb)? 56'h20202020737462 :
    (E_op_br)? 56'h20202020206272 :
    (E_op_ldb)? 56'h202020206c6462 :
    (E_op_cmpgei)? 56'h20636d70676569 :
    (E_op_ldhu)? 56'h2020206c646875 :
    (E_op_andi)? 56'h202020616e6469 :
    (E_op_sth)? 56'h20202020737468 :
    (E_op_bge)? 56'h20202020626765 :
    (E_op_ldh)? 56'h202020206c6468 :
    (E_op_cmplti)? 56'h20636d706c7469 :
    (E_op_initda)? 56'h20696e69746461 :
    (E_op_ori)? 56'h202020206f7269 :
    (E_op_stw)? 56'h20202020737477 :
    (E_op_blt)? 56'h20202020626c74 :
    (E_op_ldw)? 56'h202020206c6477 :
    (E_op_cmpnei)? 56'h20636d706e6569 :
    (E_op_flushda)? 56'h666c7573686461 :
    (E_op_xori)? 56'h202020786f7269 :
    (E_op_bne)? 56'h20202020626e65 :
    (E_op_cmpeqi)? 56'h20636d70657169 :
    (E_op_ldbuio)? 56'h206c646275696f :
    (E_op_muli)? 56'h2020206d756c69 :
    (E_op_stbio)? 56'h2020737462696f :
    (E_op_beq)? 56'h20202020626571 :
    (E_op_ldbio)? 56'h20206c6462696f :
    (E_op_cmpgeui)? 56'h636d7067657569 :
    (E_op_ldhuio)? 56'h206c646875696f :
    (E_op_andhi)? 56'h2020616e646869 :
    (E_op_sthio)? 56'h2020737468696f :
    (E_op_bgeu)? 56'h20202062676575 :
    (E_op_ldhio)? 56'h20206c6468696f :
    (E_op_cmpltui)? 56'h636d706c747569 :
    (E_op_initd)? 56'h2020696e697464 :
    (E_op_orhi)? 56'h2020206f726869 :
    (E_op_stwio)? 56'h2020737477696f :
    (E_op_bltu)? 56'h202020626c7475 :
    (E_op_ldwio)? 56'h20206c6477696f :
    (E_op_flushd)? 56'h20666c75736864 :
    (E_op_xorhi)? 56'h2020786f726869 :
    (E_op_eret)? 56'h20202065726574 :
    (E_op_roli)? 56'h202020726f6c69 :
    (E_op_rol)? 56'h20202020726f6c :
    (E_op_flushp)? 56'h20666c75736870 :
    (E_op_ret)? 56'h20202020726574 :
    (E_op_nor)? 56'h202020206e6f72 :
    (E_op_mulxuu)? 56'h206d756c787575 :
    (E_op_cmpge)? 56'h2020636d706765 :
    (E_op_bret)? 56'h20202062726574 :
    (E_op_ror)? 56'h20202020726f72 :
    (E_op_flushi)? 56'h20666c75736869 :
    (E_op_jmp)? 56'h202020206a6d70 :
    (E_op_and)? 56'h20202020616e64 :
    (E_op_cmplt)? 56'h2020636d706c74 :
    (E_op_slli)? 56'h202020736c6c69 :
    (E_op_sll)? 56'h20202020736c6c :
    (E_op_or)? 56'h20202020206f72 :
    (E_op_mulxsu)? 56'h206d756c787375 :
    (E_op_cmpne)? 56'h2020636d706e65 :
    (E_op_srli)? 56'h20202073726c69 :
    (E_op_srl)? 56'h2020202073726c :
    (E_op_nextpc)? 56'h206e6578747063 :
    (E_op_callr)? 56'h202063616c6c72 :
    (E_op_xor)? 56'h20202020786f72 :
    (E_op_mulxss)? 56'h206d756c787373 :
    (E_op_cmpeq)? 56'h2020636d706571 :
    (E_op_divu)? 56'h20202064697675 :
    (E_op_div)? 56'h20202020646976 :
    (E_op_rdctl)? 56'h2020726463746c :
    (E_op_mul)? 56'h202020206d756c :
    (E_op_cmpgeu)? 56'h20636d70676575 :
    (E_op_initi)? 56'h2020696e697469 :
    (E_op_trap)? 56'h20202074726170 :
    (E_op_wrctl)? 56'h2020777263746c :
    (E_op_cmpltu)? 56'h20636d706c7475 :
    (E_op_add)? 56'h20202020616464 :
    (E_op_break)? 56'h2020627265616b :
    (E_op_hbreak)? 56'h2068627265616b :
    (E_op_sync)? 56'h20202073796e63 :
    (E_op_sub)? 56'h20202020737562 :
    (E_op_srai)? 56'h20202073726169 :
    (E_op_sra)? 56'h20202020737261 :
    (E_op_intr)? 56'h202020696e7472 :
    (E_op_fpu)? 56'h20202020667075 :
    56'h20202020424144;

  assign M_inst = (M_op_call)? 56'h20202063616c6c :
    (M_op_jmpi)? 56'h2020206a6d7069 :
    (M_op_ldbu)? 56'h2020206c646275 :
    (M_op_addi)? 56'h20202061646469 :
    (M_op_stb)? 56'h20202020737462 :
    (M_op_br)? 56'h20202020206272 :
    (M_op_ldb)? 56'h202020206c6462 :
    (M_op_cmpgei)? 56'h20636d70676569 :
    (M_op_ldhu)? 56'h2020206c646875 :
    (M_op_andi)? 56'h202020616e6469 :
    (M_op_sth)? 56'h20202020737468 :
    (M_op_bge)? 56'h20202020626765 :
    (M_op_ldh)? 56'h202020206c6468 :
    (M_op_cmplti)? 56'h20636d706c7469 :
    (M_op_initda)? 56'h20696e69746461 :
    (M_op_ori)? 56'h202020206f7269 :
    (M_op_stw)? 56'h20202020737477 :
    (M_op_blt)? 56'h20202020626c74 :
    (M_op_ldw)? 56'h202020206c6477 :
    (M_op_cmpnei)? 56'h20636d706e6569 :
    (M_op_flushda)? 56'h666c7573686461 :
    (M_op_xori)? 56'h202020786f7269 :
    (M_op_bne)? 56'h20202020626e65 :
    (M_op_cmpeqi)? 56'h20636d70657169 :
    (M_op_ldbuio)? 56'h206c646275696f :
    (M_op_muli)? 56'h2020206d756c69 :
    (M_op_stbio)? 56'h2020737462696f :
    (M_op_beq)? 56'h20202020626571 :
    (M_op_ldbio)? 56'h20206c6462696f :
    (M_op_cmpgeui)? 56'h636d7067657569 :
    (M_op_ldhuio)? 56'h206c646875696f :
    (M_op_andhi)? 56'h2020616e646869 :
    (M_op_sthio)? 56'h2020737468696f :
    (M_op_bgeu)? 56'h20202062676575 :
    (M_op_ldhio)? 56'h20206c6468696f :
    (M_op_cmpltui)? 56'h636d706c747569 :
    (M_op_initd)? 56'h2020696e697464 :
    (M_op_orhi)? 56'h2020206f726869 :
    (M_op_stwio)? 56'h2020737477696f :
    (M_op_bltu)? 56'h202020626c7475 :
    (M_op_ldwio)? 56'h20206c6477696f :
    (M_op_flushd)? 56'h20666c75736864 :
    (M_op_xorhi)? 56'h2020786f726869 :
    (M_op_eret)? 56'h20202065726574 :
    (M_op_roli)? 56'h202020726f6c69 :
    (M_op_rol)? 56'h20202020726f6c :
    (M_op_flushp)? 56'h20666c75736870 :
    (M_op_ret)? 56'h20202020726574 :
    (M_op_nor)? 56'h202020206e6f72 :
    (M_op_mulxuu)? 56'h206d756c787575 :
    (M_op_cmpge)? 56'h2020636d706765 :
    (M_op_bret)? 56'h20202062726574 :
    (M_op_ror)? 56'h20202020726f72 :
    (M_op_flushi)? 56'h20666c75736869 :
    (M_op_jmp)? 56'h202020206a6d70 :
    (M_op_and)? 56'h20202020616e64 :
    (M_op_cmplt)? 56'h2020636d706c74 :
    (M_op_slli)? 56'h202020736c6c69 :
    (M_op_sll)? 56'h20202020736c6c :
    (M_op_or)? 56'h20202020206f72 :
    (M_op_mulxsu)? 56'h206d756c787375 :
    (M_op_cmpne)? 56'h2020636d706e65 :
    (M_op_srli)? 56'h20202073726c69 :
    (M_op_srl)? 56'h2020202073726c :
    (M_op_nextpc)? 56'h206e6578747063 :
    (M_op_callr)? 56'h202063616c6c72 :
    (M_op_xor)? 56'h20202020786f72 :
    (M_op_mulxss)? 56'h206d756c787373 :
    (M_op_cmpeq)? 56'h2020636d706571 :
    (M_op_divu)? 56'h20202064697675 :
    (M_op_div)? 56'h20202020646976 :
    (M_op_rdctl)? 56'h2020726463746c :
    (M_op_mul)? 56'h202020206d756c :
    (M_op_cmpgeu)? 56'h20636d70676575 :
    (M_op_initi)? 56'h2020696e697469 :
    (M_op_trap)? 56'h20202074726170 :
    (M_op_wrctl)? 56'h2020777263746c :
    (M_op_cmpltu)? 56'h20636d706c7475 :
    (M_op_add)? 56'h20202020616464 :
    (M_op_break)? 56'h2020627265616b :
    (M_op_hbreak)? 56'h2068627265616b :
    (M_op_sync)? 56'h20202073796e63 :
    (M_op_sub)? 56'h20202020737562 :
    (M_op_srai)? 56'h20202073726169 :
    (M_op_sra)? 56'h20202020737261 :
    (M_op_intr)? 56'h202020696e7472 :
    (M_op_fpu)? 56'h20202020667075 :
    56'h20202020424144;

  assign A_inst = (A_op_call)? 56'h20202063616c6c :
    (A_op_jmpi)? 56'h2020206a6d7069 :
    (A_op_ldbu)? 56'h2020206c646275 :
    (A_op_addi)? 56'h20202061646469 :
    (A_op_stb)? 56'h20202020737462 :
    (A_op_br)? 56'h20202020206272 :
    (A_op_ldb)? 56'h202020206c6462 :
    (A_op_cmpgei)? 56'h20636d70676569 :
    (A_op_ldhu)? 56'h2020206c646875 :
    (A_op_andi)? 56'h202020616e6469 :
    (A_op_sth)? 56'h20202020737468 :
    (A_op_bge)? 56'h20202020626765 :
    (A_op_ldh)? 56'h202020206c6468 :
    (A_op_cmplti)? 56'h20636d706c7469 :
    (A_op_initda)? 56'h20696e69746461 :
    (A_op_ori)? 56'h202020206f7269 :
    (A_op_stw)? 56'h20202020737477 :
    (A_op_blt)? 56'h20202020626c74 :
    (A_op_ldw)? 56'h202020206c6477 :
    (A_op_cmpnei)? 56'h20636d706e6569 :
    (A_op_flushda)? 56'h666c7573686461 :
    (A_op_xori)? 56'h202020786f7269 :
    (A_op_bne)? 56'h20202020626e65 :
    (A_op_cmpeqi)? 56'h20636d70657169 :
    (A_op_ldbuio)? 56'h206c646275696f :
    (A_op_muli)? 56'h2020206d756c69 :
    (A_op_stbio)? 56'h2020737462696f :
    (A_op_beq)? 56'h20202020626571 :
    (A_op_ldbio)? 56'h20206c6462696f :
    (A_op_cmpgeui)? 56'h636d7067657569 :
    (A_op_ldhuio)? 56'h206c646875696f :
    (A_op_andhi)? 56'h2020616e646869 :
    (A_op_sthio)? 56'h2020737468696f :
    (A_op_bgeu)? 56'h20202062676575 :
    (A_op_ldhio)? 56'h20206c6468696f :
    (A_op_cmpltui)? 56'h636d706c747569 :
    (A_op_initd)? 56'h2020696e697464 :
    (A_op_orhi)? 56'h2020206f726869 :
    (A_op_stwio)? 56'h2020737477696f :
    (A_op_bltu)? 56'h202020626c7475 :
    (A_op_ldwio)? 56'h20206c6477696f :
    (A_op_flushd)? 56'h20666c75736864 :
    (A_op_xorhi)? 56'h2020786f726869 :
    (A_op_eret)? 56'h20202065726574 :
    (A_op_roli)? 56'h202020726f6c69 :
    (A_op_rol)? 56'h20202020726f6c :
    (A_op_flushp)? 56'h20666c75736870 :
    (A_op_ret)? 56'h20202020726574 :
    (A_op_nor)? 56'h202020206e6f72 :
    (A_op_mulxuu)? 56'h206d756c787575 :
    (A_op_cmpge)? 56'h2020636d706765 :
    (A_op_bret)? 56'h20202062726574 :
    (A_op_ror)? 56'h20202020726f72 :
    (A_op_flushi)? 56'h20666c75736869 :
    (A_op_jmp)? 56'h202020206a6d70 :
    (A_op_and)? 56'h20202020616e64 :
    (A_op_cmplt)? 56'h2020636d706c74 :
    (A_op_slli)? 56'h202020736c6c69 :
    (A_op_sll)? 56'h20202020736c6c :
    (A_op_or)? 56'h20202020206f72 :
    (A_op_mulxsu)? 56'h206d756c787375 :
    (A_op_cmpne)? 56'h2020636d706e65 :
    (A_op_srli)? 56'h20202073726c69 :
    (A_op_srl)? 56'h2020202073726c :
    (A_op_nextpc)? 56'h206e6578747063 :
    (A_op_callr)? 56'h202063616c6c72 :
    (A_op_xor)? 56'h20202020786f72 :
    (A_op_mulxss)? 56'h206d756c787373 :
    (A_op_cmpeq)? 56'h2020636d706571 :
    (A_op_divu)? 56'h20202064697675 :
    (A_op_div)? 56'h20202020646976 :
    (A_op_rdctl)? 56'h2020726463746c :
    (A_op_mul)? 56'h202020206d756c :
    (A_op_cmpgeu)? 56'h20636d70676575 :
    (A_op_initi)? 56'h2020696e697469 :
    (A_op_trap)? 56'h20202074726170 :
    (A_op_wrctl)? 56'h2020777263746c :
    (A_op_cmpltu)? 56'h20636d706c7475 :
    (A_op_add)? 56'h20202020616464 :
    (A_op_break)? 56'h2020627265616b :
    (A_op_hbreak)? 56'h2068627265616b :
    (A_op_sync)? 56'h20202073796e63 :
    (A_op_sub)? 56'h20202020737562 :
    (A_op_srai)? 56'h20202073726169 :
    (A_op_sra)? 56'h20202020737261 :
    (A_op_intr)? 56'h202020696e7472 :
    (A_op_fpu)? 56'h20202020667075 :
    56'h20202020424144;

  assign W_inst = (W_op_call)? 56'h20202063616c6c :
    (W_op_jmpi)? 56'h2020206a6d7069 :
    (W_op_ldbu)? 56'h2020206c646275 :
    (W_op_addi)? 56'h20202061646469 :
    (W_op_stb)? 56'h20202020737462 :
    (W_op_br)? 56'h20202020206272 :
    (W_op_ldb)? 56'h202020206c6462 :
    (W_op_cmpgei)? 56'h20636d70676569 :
    (W_op_ldhu)? 56'h2020206c646875 :
    (W_op_andi)? 56'h202020616e6469 :
    (W_op_sth)? 56'h20202020737468 :
    (W_op_bge)? 56'h20202020626765 :
    (W_op_ldh)? 56'h202020206c6468 :
    (W_op_cmplti)? 56'h20636d706c7469 :
    (W_op_initda)? 56'h20696e69746461 :
    (W_op_ori)? 56'h202020206f7269 :
    (W_op_stw)? 56'h20202020737477 :
    (W_op_blt)? 56'h20202020626c74 :
    (W_op_ldw)? 56'h202020206c6477 :
    (W_op_cmpnei)? 56'h20636d706e6569 :
    (W_op_flushda)? 56'h666c7573686461 :
    (W_op_xori)? 56'h202020786f7269 :
    (W_op_bne)? 56'h20202020626e65 :
    (W_op_cmpeqi)? 56'h20636d70657169 :
    (W_op_ldbuio)? 56'h206c646275696f :
    (W_op_muli)? 56'h2020206d756c69 :
    (W_op_stbio)? 56'h2020737462696f :
    (W_op_beq)? 56'h20202020626571 :
    (W_op_ldbio)? 56'h20206c6462696f :
    (W_op_cmpgeui)? 56'h636d7067657569 :
    (W_op_ldhuio)? 56'h206c646875696f :
    (W_op_andhi)? 56'h2020616e646869 :
    (W_op_sthio)? 56'h2020737468696f :
    (W_op_bgeu)? 56'h20202062676575 :
    (W_op_ldhio)? 56'h20206c6468696f :
    (W_op_cmpltui)? 56'h636d706c747569 :
    (W_op_initd)? 56'h2020696e697464 :
    (W_op_orhi)? 56'h2020206f726869 :
    (W_op_stwio)? 56'h2020737477696f :
    (W_op_bltu)? 56'h202020626c7475 :
    (W_op_ldwio)? 56'h20206c6477696f :
    (W_op_flushd)? 56'h20666c75736864 :
    (W_op_xorhi)? 56'h2020786f726869 :
    (W_op_eret)? 56'h20202065726574 :
    (W_op_roli)? 56'h202020726f6c69 :
    (W_op_rol)? 56'h20202020726f6c :
    (W_op_flushp)? 56'h20666c75736870 :
    (W_op_ret)? 56'h20202020726574 :
    (W_op_nor)? 56'h202020206e6f72 :
    (W_op_mulxuu)? 56'h206d756c787575 :
    (W_op_cmpge)? 56'h2020636d706765 :
    (W_op_bret)? 56'h20202062726574 :
    (W_op_ror)? 56'h20202020726f72 :
    (W_op_flushi)? 56'h20666c75736869 :
    (W_op_jmp)? 56'h202020206a6d70 :
    (W_op_and)? 56'h20202020616e64 :
    (W_op_cmplt)? 56'h2020636d706c74 :
    (W_op_slli)? 56'h202020736c6c69 :
    (W_op_sll)? 56'h20202020736c6c :
    (W_op_or)? 56'h20202020206f72 :
    (W_op_mulxsu)? 56'h206d756c787375 :
    (W_op_cmpne)? 56'h2020636d706e65 :
    (W_op_srli)? 56'h20202073726c69 :
    (W_op_srl)? 56'h2020202073726c :
    (W_op_nextpc)? 56'h206e6578747063 :
    (W_op_callr)? 56'h202063616c6c72 :
    (W_op_xor)? 56'h20202020786f72 :
    (W_op_mulxss)? 56'h206d756c787373 :
    (W_op_cmpeq)? 56'h2020636d706571 :
    (W_op_divu)? 56'h20202064697675 :
    (W_op_div)? 56'h20202020646976 :
    (W_op_rdctl)? 56'h2020726463746c :
    (W_op_mul)? 56'h202020206d756c :
    (W_op_cmpgeu)? 56'h20636d70676575 :
    (W_op_initi)? 56'h2020696e697469 :
    (W_op_trap)? 56'h20202074726170 :
    (W_op_wrctl)? 56'h2020777263746c :
    (W_op_cmpltu)? 56'h20636d706c7475 :
    (W_op_add)? 56'h20202020616464 :
    (W_op_break)? 56'h2020627265616b :
    (W_op_hbreak)? 56'h2068627265616b :
    (W_op_sync)? 56'h20202073796e63 :
    (W_op_sub)? 56'h20202020737562 :
    (W_op_srai)? 56'h20202073726169 :
    (W_op_sra)? 56'h20202020737261 :
    (W_op_intr)? 56'h202020696e7472 :
    (W_op_fpu)? 56'h20202020667075 :
    56'h20202020424144;

  assign F_vinst = F_iw_valid ? F_inst : {7{8'h2d}};
  assign D_vinst = D_issue ? D_inst : {7{8'h2d}};
  assign E_vinst = E_valid ? E_inst : {7{8'h2d}};
  assign M_vinst = M_valid ? M_inst : {7{8'h2d}};
  assign A_vinst = A_valid ? A_inst : {7{8'h2d}};
  assign W_vinst = W_valid ? W_inst : {7{8'h2d}};
  //Clearing 'X' data bits
  assign D_ic_want_fill_unfiltered_is_x = ^(D_ic_want_fill_unfiltered) === 1'bx;

  assign D_ic_want_fill = D_ic_want_fill_unfiltered_is_x ? 1'b0 : D_ic_want_fill_unfiltered;
  //Clearing 'X' data bits
  assign M_dc_potential_hazard_after_st_unfiltered_is_x = ^(M_dc_potential_hazard_after_st_unfiltered) === 1'bx;

  assign M_dc_potential_hazard_after_st = M_dc_potential_hazard_after_st_unfiltered_is_x ? 1'b0 : M_dc_potential_hazard_after_st_unfiltered;

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign D_ic_want_fill = D_ic_want_fill_unfiltered;
//
//  
//  assign M_dc_potential_hazard_after_st = M_dc_potential_hazard_after_st_unfiltered;
//
//synthesis read_comments_as_HDL off

endmodule

