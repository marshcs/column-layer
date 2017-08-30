// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
// Date        : Wed Aug 30 13:18:48 2017
// Host        : DESKTOP-LAB running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/project/LDPCflsash/column-layer/pro_column_layer/pro_column_layer.srcs/sources_1/ip/rom_shift/rom_shift_stub.v
// Design      : rom_shift
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2015.1" *)
module rom_shift(clka, ena, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,addra[6:0],douta[41:0]" */;
  input clka;
  input ena;
  input [6:0]addra;
  output [41:0]douta;
endmodule
