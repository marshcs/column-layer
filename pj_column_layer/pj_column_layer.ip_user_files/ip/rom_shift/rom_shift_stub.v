// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Wed Sep 06 11:16:51 2017
// Host        : DESKTOP-GADFO2S running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/cs/column-layer/pj_column_layer/pj_column_layer.srcs/sources_1/ip/rom_shift/rom_shift_stub.v
// Design      : rom_shift
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_5,Vivado 2016.4" *)
module rom_shift(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[6:0],douta[41:0]" */;
  input clka;
  input [6:0]addra;
  output [41:0]douta;
endmodule
