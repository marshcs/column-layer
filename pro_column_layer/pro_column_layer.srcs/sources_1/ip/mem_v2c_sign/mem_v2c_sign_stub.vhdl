-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
-- Date        : Mon Aug 28 11:14:25 2017
-- Host        : DESKTOP-LAB running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/project/LDPCflsash/column-layer/pro_column_layer/pro_column_layer.srcs/sources_1/ip/mem_v2c_sign/mem_v2c_sign_stub.vhdl
-- Design      : mem_v2c_sign
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1157-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mem_v2c_sign is
  Port ( 
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 761 downto 0 );
    clkb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 6 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 761 downto 0 )
  );

end mem_v2c_sign;

architecture stub of mem_v2c_sign is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,wea[0:0],addra[6:0],dina[761:0],clkb,addrb[6:0],doutb[761:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_2,Vivado 2015.1";
begin
end;
