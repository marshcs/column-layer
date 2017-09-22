onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group TB /decoder_tb/clk
add wave -noupdate -group TB /decoder_tb/rst_n
add wave -noupdate -group TB /decoder_tb/i_init_info
add wave -noupdate -group TB /decoder_tb/i_init_info_valid
add wave -noupdate -group TB -radix unsigned /decoder_tb/cnt
add wave -noupdate -group TB /decoder_tb/o_decoded_info
add wave -noupdate -group TB /decoder_tb/o_decoded_info_valid
add wave -noupdate -group TB /decoder_tb/o_decoded_info_last
add wave -noupdate -group TB /decoder_tb/o_init_info_ready
add wave -noupdate -group TB /decoder_tb/o_parity_check_satisfied
add wave -noupdate -group TB /decoder_tb/clk
add wave -noupdate -group TB /decoder_tb/rst_n
add wave -noupdate -group TB /decoder_tb/i_init_info
add wave -noupdate -group TB /decoder_tb/i_init_info_valid
add wave -noupdate -group TB -radix unsigned /decoder_tb/cnt
add wave -noupdate -group TB /decoder_tb/o_decoded_info
add wave -noupdate -group TB /decoder_tb/o_decoded_info_valid
add wave -noupdate -group TB /decoder_tb/o_decoded_info_last
add wave -noupdate -group TB /decoder_tb/o_init_info_ready
add wave -noupdate -group TB /decoder_tb/o_parity_check_satisfied
add wave -noupdate -group TB /decoder_tb/r_init_info
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/clk
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/rst_n
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/i_strength0
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/i_strength1
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/i_init_info
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/i_init_info_valid
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/o_init_info_ready
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/o_decode_end
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/o_parity_check_satisfied
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/o_decoded_info
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/o_decoded_info_valid
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/o_decoded_info_last
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/r_decoding
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/r_decoding_delay
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/w_decode_begin
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/r_decode_begin_delay
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/r_iter_cnt
add wave -noupdate -expand -group TOP -expand -group CONTROL -radix unsigned /decoder_tb/tb_inst_decoder/r_decode_cnt
add wave -noupdate -expand -group TOP -expand -group CONTROL -radix unsigned -childformat {{{/decoder_tb/tb_inst_decoder/r_decode_cnt_delay[0]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/r_decode_cnt_delay[1]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/r_decode_cnt_delay[2]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/r_decode_cnt_delay[3]} -radix unsigned}} -expand -subitemconfig {{/decoder_tb/tb_inst_decoder/r_decode_cnt_delay[0]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/r_decode_cnt_delay[1]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/r_decode_cnt_delay[2]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/r_decode_cnt_delay[3]} {-height 15 -radix unsigned}} /decoder_tb/tb_inst_decoder/r_decode_cnt_delay
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/r_decode_end
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/r_is_first_iter
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/r_output_cnt
add wave -noupdate -expand -group TOP -expand -group CONTROL /decoder_tb/tb_inst_decoder/r_is_first_iter_delay
add wave -noupdate -expand -group TOP -group MEM_LLR /decoder_tb/tb_inst_decoder/llr_mem_wea
add wave -noupdate -expand -group TOP -group MEM_LLR -radix unsigned /decoder_tb/tb_inst_decoder/llr_mem_addr
add wave -noupdate -expand -group TOP -group MEM_LLR /decoder_tb/tb_inst_decoder/llr_mem_din
add wave -noupdate -expand -group TOP -group MEM_LLR /decoder_tb/tb_inst_decoder/llr_mem_dout
add wave -noupdate -expand -group TOP -group mem_v2c_sign -radix unsigned {/decoder_tb/tb_inst_decoder/r_decode_cnt_delay[0]}
add wave -noupdate -expand -group TOP -group mem_v2c_sign -radix unsigned /decoder_tb/tb_inst_decoder/w_memvs_doutb
add wave -noupdate -expand -group TOP -group mem_v2c_sign {/decoder_tb/tb_inst_decoder/r_decoding_delay[3]}
add wave -noupdate -expand -group TOP -group mem_v2c_sign {/decoder_tb/tb_inst_decoder/r_decode_cnt_delay[3]}
add wave -noupdate -expand -group TOP -group mem_v2c_sign -radix hexadecimal /decoder_tb/tb_inst_decoder/w_cns_o_v2c_sign_bus
add wave -noupdate -expand -group TOP -expand -group rom_shift /decoder_tb/tb_inst_decoder/w_rom_shift_dout
add wave -noupdate -expand -group TOP -group {SHIFTER[0]} {/decoder_tb/tb_inst_decoder/Barrel_Shifter[0]/w_bs_shifter_offset}
add wave -noupdate -expand -group TOP -group {SHIFTER[0]} {/decoder_tb/tb_inst_decoder/Barrel_Shifter[0]/w_bs_i_data}
add wave -noupdate -expand -group TOP -group {SHIFTER[0]} {/decoder_tb/tb_inst_decoder/Barrel_Shifter[0]/w_bs_o_data}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/i_clk}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/i_rst_n}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/i_is_first_iter}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) -radix unsigned {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/i_v2c_abs_0}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) -radix unsigned {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/i_v2c_abs_1}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) -radix unsigned {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/i_idx_0}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/i_v2c_sign}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/i_v2c_sign_tot}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/w_c2v_sign}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) -radix unsigned {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/i_col_cnt}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) -radix decimal {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/o_c2v}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) -radix unsigned {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/w_v2c_abs}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) -radix unsigned {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/w_offset_c2v_tmp}
add wave -noupdate -expand -group TOP -group CN_R -group cn_r_unit(0,126) -radix unsigned {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[126]/inst_cn_r/w_offset_c2v}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/i_clk}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/i_rst_n}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/i_v2c_abs_0}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/i_v2c_abs_1}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/i_idx_0}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/i_v2c_sign}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/i_v2c_sign_tot}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) -radix unsigned {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/i_col_cnt}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/i_is_first_iter}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) -radix decimal {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/o_c2v}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/w_v2c_abs}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/w_offset_c2v_tmp}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/w_offset_c2v}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/w_c2v_sign}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[6]/inst_cn_r/w_c2v}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R(0,0) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[0]/w_cnr_i_v2c_abs}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R(0,0) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[0]/w_cnr_i_idx_0}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R(0,0) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[0]/w_cnr_i_v2c_sign}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R(0,0) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[0]/w_cnr_i_v2c_sign_tot}
add wave -noupdate -expand -group TOP -group CN_R -expand -group CN_R(0,0) {/decoder_tb/tb_inst_decoder/CN_R[0]/CN_R_unit[0]/w_cnr_o_r}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/i_clk}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/i_rst_n}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 -radix decimal {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/i_llr}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/i_c2v_bus}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/o_app}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/o_v2c_bus}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 -radix decimal -childformat {{{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[0]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[1]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[2]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[3]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[4]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[5]} -radix decimal}} -expand -subitemconfig {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[0]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[1]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[2]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[3]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[4]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v[5]} {-height 15 -radix decimal}} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_c2v}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_i_llr}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_sum}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c_pre}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 -radix decimal -childformat {{{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[0]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[1]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[2]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[3]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[4]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[5]} -radix decimal}} -expand -subitemconfig {{/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[0]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[1]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[2]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[3]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[4]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c[5]} {-height 15 -radix decimal}} {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c}
add wave -noupdate -expand -group TOP -expand -group VN -group VN_UNIT_0 -expand {/decoder_tb/tb_inst_decoder/VN[0]/inst_vn/w_v2c_sign_mag}
add wave -noupdate -expand -group TOP -expand -group VN -group vn_unit_126 {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/i_clk}
add wave -noupdate -expand -group TOP -expand -group VN -group vn_unit_126 {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/i_rst_n}
add wave -noupdate -expand -group TOP -expand -group VN -group vn_unit_126 -radix decimal {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/i_llr}
add wave -noupdate -expand -group TOP -expand -group VN -group vn_unit_126 {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/i_c2v_bus}
add wave -noupdate -expand -group TOP -expand -group VN -group vn_unit_126 {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/o_app}
add wave -noupdate -expand -group TOP -expand -group VN -group vn_unit_126 {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/o_v2c_bus}
add wave -noupdate -expand -group TOP -expand -group VN -group vn_unit_126 {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_c2v}
add wave -noupdate -expand -group TOP -expand -group VN -group vn_unit_126 -radix decimal -childformat {{{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[11]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[10]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[9]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[8]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[7]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[6]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[5]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[4]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[3]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[2]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[1]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[0]} -radix decimal}} -subitemconfig {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[11]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[10]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[9]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[8]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[7]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[6]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[5]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[4]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[3]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[2]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[1]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum[0]} {-height 15 -radix decimal}} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_sum}
add wave -noupdate -expand -group TOP -expand -group VN -group vn_unit_126 -radix decimal -childformat {{{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[0]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[1]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[2]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[3]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[4]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[5]} -radix decimal}} -subitemconfig {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[0]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[1]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[2]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[3]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[4]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre[5]} {-height 15 -radix decimal}} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_pre}
add wave -noupdate -expand -group TOP -expand -group VN -group vn_unit_126 -radix decimal -childformat {{{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[0]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[1]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[2]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[3]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[4]} -radix decimal} {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[5]} -radix decimal}} -expand -subitemconfig {{/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[0]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[1]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[2]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[3]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[4]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c[5]} {-height 15 -radix decimal}} {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c}
add wave -noupdate -expand -group TOP -expand -group VN -group vn_unit_126 {/decoder_tb/tb_inst_decoder/VN[126]/inst_vn/w_v2c_sign_mag}
add wave -noupdate -expand -group TOP -expand -group VN /decoder_tb/tb_inst_decoder/w_c2v_shift_bus
add wave -noupdate -expand -group TOP -expand -group VN /decoder_tb/tb_inst_decoder/w_vn_o_app
add wave -noupdate -expand -group TOP -expand -group VN /decoder_tb/tb_inst_decoder/w_vn_v2c_bus
add wave -noupdate -expand -group TOP -expand -group VN /decoder_tb/tb_inst_decoder/w_vn_llr
add wave -noupdate -expand -group TOP /decoder_tb/tb_inst_decoder/r_bsr_shifter_offset
add wave -noupdate -expand -group TOP -radix unsigned {/decoder_tb/tb_inst_decoder/r_bsr_shifter_offset[0]}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_clk}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_rst_n}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_vld}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) -radix decimal -childformat {{{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[5]} -radix decimal} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[4]} -radix decimal} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[3]} -radix decimal} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[2]} -radix decimal} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[1]} -radix decimal} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[0]} -radix decimal}} -subitemconfig {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[5]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[4]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[3]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[2]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[1]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c[0]} {-height 15 -radix decimal}} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_v2c}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) -radix unsigned {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/i_col_cnt}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/o_v2c_abs}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/o_v2c_idx}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/o_v2c_sign}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/o_v2c_sign_tot}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/w_v2c_sorted}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/w_v2c_idx_sort}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/w_v2c_idx_sorted}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/w_v2c_abs}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/w_v2c_idx}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/w_is_replace}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/w_v2c_abs_bus}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_sign_tot}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) -radix unsigned -childformat {{{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_queue[0]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_queue[1]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_queue[2]} -radix unsigned}} -expand -subitemconfig {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_queue[0]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_queue[1]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_queue[2]} {-height 15 -radix unsigned}} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_queue}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,126) -radix unsigned -childformat {{{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_idx_queue[0]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_idx_queue[1]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_idx_queue[2]} -radix unsigned}} -subitemconfig {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_idx_queue[0]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_idx_queue[1]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_idx_queue[2]} {-height 15 -radix unsigned}} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[126]/inst_cn_s/r_v2c_idx_queue}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_clk}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_rst_n}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_vld}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) -radix decimal -childformat {{{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[5]} -radix decimal} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[4]} -radix decimal} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[3]} -radix decimal} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[2]} -radix decimal} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[1]} -radix decimal} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[0]} -radix decimal}} -subitemconfig {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[5]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[4]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[3]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[2]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[1]} {-height 15 -radix decimal} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c[0]} {-height 15 -radix decimal}} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) -radix unsigned -childformat {{{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[6]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[5]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[4]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[3]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[2]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[1]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[0]} -radix unsigned}} -subitemconfig {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[6]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[5]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[4]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[3]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[2]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[1]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt[0]} {-height 15 -radix unsigned}} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_col_cnt}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/i_v2c_sign_old}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) -radix unsigned -childformat {{{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/r_v2c_queue[0]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/r_v2c_queue[1]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/r_v2c_queue[2]} -radix unsigned}} -expand -subitemconfig {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/r_v2c_queue[0]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/r_v2c_queue[1]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/r_v2c_queue[2]} {-height 15 -radix unsigned}} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/r_v2c_queue}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/r_v2c_idx_queue}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/o_v2c_abs}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/o_v2c_idx}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/o_v2c_sign}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/o_v2c_sign_tot}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/w_v2c_sorted}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/w_v2c_idx_sort}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/w_v2c_idx_sorted}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) -expand {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/w_v2c_abs}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/w_v2c_idx}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/w_is_replace}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/w_v2c_abs_bus}
add wave -noupdate -expand -group TOP -expand -group CN_S -group CN_S_UNIT(0,6) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[6]/inst_cn_s/r_sign_tot}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/i_clk}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/i_rst_n}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/i_vld}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/i_v2c}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/i_col_cnt}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/i_v2c_sign_old}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/o_v2c_abs}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/o_v2c_idx}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/o_v2c_sign}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/o_v2c_sign_tot}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/w_v2c_sorted}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/w_v2c_idx_sort}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/w_v2c_idx_sorted}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/w_v2c_abs}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/w_v2c_idx}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/w_is_replace}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/w_v2c_abs_bus}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/r_sign_tot}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) -radix unsigned -childformat {{{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/r_v2c_queue[0]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/r_v2c_queue[1]} -radix unsigned} {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/r_v2c_queue[2]} -radix unsigned}} -expand -subitemconfig {{/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/r_v2c_queue[0]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/r_v2c_queue[1]} {-height 15 -radix unsigned} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/r_v2c_queue[2]} {-height 15 -radix unsigned}} {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/r_v2c_queue}
add wave -noupdate -expand -group TOP -expand -group CN_S -expand -group CN_S(0,0) {/decoder_tb/tb_inst_decoder/CN_S[0]/CN_S_unit[0]/inst_cn_s/r_v2c_idx_queue}
add wave -noupdate -expand -group TOP -expand -group CN_S /decoder_tb/tb_inst_decoder/w_cns_o_v2c_abs_bus
add wave -noupdate -expand -group TOP -expand -group CN_S /decoder_tb/tb_inst_decoder/w_c2v_new_shift_bus
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/clk
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/rst_n
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/i_decode_begin
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/i_decode_end
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/i_is_first_iter
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/i_is_output_iter
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/i_app
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/i_col_cnt
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/i_col_cnt_mem
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/i_col_cnt_output
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/w_addrb_read
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/i_shift_offset
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/o_parity_check_ok
add wave -noupdate -expand -group TOP -group PARITY_CHECK -expand /decoder_tb/tb_inst_decoder/inst_parity_check/r_checksum
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/o_app
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/r_decoding
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/w_old_app
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/w_app_diff
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/w_parity_check_ok
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/w_shift_offset
add wave -noupdate -expand -group TOP -group PARITY_CHECK /decoder_tb/tb_inst_decoder/inst_parity_check/w_app_diff_shift
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5346958 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 272
configure wave -valuecolwidth 280
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {3897530 ps} {7558658 ps}
