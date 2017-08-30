// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
// Date        : Mon Aug 28 11:14:25 2017
// Host        : DESKTOP-LAB running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/project/LDPCflsash/column-layer/pro_column_layer/pro_column_layer.srcs/sources_1/ip/mem_v2c_sign/mem_v2c_sign_stub.v
// Design      : mem_v2c_sign
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2015.1" *)
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
