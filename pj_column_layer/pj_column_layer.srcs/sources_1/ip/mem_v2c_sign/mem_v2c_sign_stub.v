// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Mon Sep 18 17:30:01 2017
// Host        : DESKTOP-PDSMUE7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/CS/column-layer/pj_column_layer/pj_column_layer.srcs/sources_1/ip/mem_v2c_sign/mem_v2c_sign_stub.v
// Design      : mem_v2c_sign
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu440-flga2892-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *)
module mem_v2c_sign(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[6:0],dina[761:0],clkb,addrb[6:0],doutb[761:0]" */;
  input clka;
  input [0:0]wea;
  input [6:0]addra;
  input [761:0]dina;
  input clkb;
  input [6:0]addrb;
  output [761:0]doutb;
endmodule
