-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
-- Date        : Sun Aug 27 16:05:36 2017
-- Host        : DESKTOP-LAB running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               E:/project/LDPCflsash/column-layer/pro_column_layer/pro_column_layer.srcs/sources_1/ip/llr_mem/llr_mem_stub.vhdl
-- Design      : llr_mem
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1157-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity llr_mem is
  Port ( 
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 253 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 253 downto 0 )
  );

end llr_mem;

architecture stub of llr_mem is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,wea[0:0],addra[6:0],dina[253:0],douta[253:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_2,Vivado 2015.1";
begin
end;
