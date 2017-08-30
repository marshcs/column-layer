-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
-- Date        : Wed Aug 30 13:18:48 2017
-- Host        : DESKTOP-LAB running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/project/LDPCflsash/column-layer/pro_column_layer/pro_column_layer.srcs/sources_1/ip/rom_shift/rom_shift_stub.vhdl
-- Design      : rom_shift
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1157-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rom_shift is
  Port ( 
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 6 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 41 downto 0 )
  );

end rom_shift;

architecture stub of rom_shift is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,ena,addra[6:0],douta[41:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_2,Vivado 2015.1";
begin
end;
