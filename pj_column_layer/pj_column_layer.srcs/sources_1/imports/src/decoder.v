module decoder #(
	parameter	INIT_INFO_WID	= 2		,
	parameter	MSG_WIDTH		= 6		,
	parameter	GF_SIZE_LOG2	= 7		,
	//PCM
	parameter	PCM_ROWN		= 6		,
	parameter	PCM_COLN		= 72	,
	// OTHER
	parameter	MAX_ITER		= 20	,
	parameter	MIN_NUM			= 3		,		// Number of message stored in queue;
	parameter	RW_LATENCY		= 2		

)(
	clk						,
	rst_n					,

	i_strength0				,
	i_strength1				,

	i_init_info				,
	i_init_info_valid		,
	o_init_info_ready		,

	o_decode_end			,
	o_parity_check_satisfied,

	o_decoded_info			,
	o_decoded_info_valid	,
	o_decoded_info_last		
);

// -------------------------v clog2 v-------------------------
function integer clog2;
    input integer value;
    for(clog2 = 0; value > 0; clog2 = clog2 + 1) begin
	    value = value >> 1;
    end
endfunction
// -------------------------^ clog2 ^-------------------------

// -------------------------v parameter assign v--------------
localparam	BLK_SIZE 			= (1 << GF_SIZE_LOG2) - 1;
localparam	COL_CNT_WID			= clog2(PCM_COLN);
localparam	ITER_CNT_WID		= clog2(MAX_ITER);	
localparam	ABS_WID				= MSG_WIDTH - 1;
localparam	MAX_DELAY			= 4;


// cn-s
wire	[ABS_WID*BLK_SIZE*PCM_ROWN-1:0]			w_cns_o_v2c_abs_bus		[0:1]	;
wire	[COL_CNT_WID*BLK_SIZE*PCM_ROWN-1:0]		w_cns_o_v2c_idx_bus				;
wire	[1*BLK_SIZE*PCM_ROWN-1:0]				w_cns_o_v2c_sign_bus			;
wire	[1*BLK_SIZE*PCM_ROWN-1:0]				w_cns_o_v2c_sign_tot_bus		;


// -------------------------^ parameter assign ^--------------

// -------------------------v 端口声明 v-------------------------

input 													clk							;
input 													rst_n						;

input 		[MSG_WIDTH-1:0] 							i_strength0 				;
input 		[MSG_WIDTH-1:0] 							i_strength1 				;

input 		[BLK_SIZE*INIT_INFO_WID-1:0] 				i_init_info 				;
input 													i_init_info_valid 			;
output  reg 										    o_init_info_ready 			;

output 													o_decode_end				;
output  												o_parity_check_satisfied	;

output 		[BLK_SIZE-1:0]								o_decoded_info				;
output 													o_decoded_info_valid 		;	
output 													o_decoded_info_last			;

// -------------------------^ 端口声明 ^-------------------------

genvar i;
genvar j;

// -------------------------v 计数 v-------------------------

reg	[COL_CNT_WID-1:0]		r_decode_cnt;	
reg	[ITER_CNT_WID-1:0]		r_iter_cnt;
reg							r_decoding;
wire 						w_decode_begin;
reg							r_decode_end; 		// 译码结束，输出结果
reg							r_is_first_iter;
reg	[COL_CNT_WID-1:0] 		r_output_cnt;

assign	w_decode_begin = i_init_info_valid && o_init_info_ready && r_decoding == 0;

always@(posedge clk)	begin
	if(~rst_n)												o_init_info_ready <= 1;
	else if(o_decode_end)									o_init_info_ready <= 1;
	// else if(o_decoded_info_valid && o_decoded_info_last)	o_init_info_ready <= 1;
	else if(i_init_info_valid && o_init_info_ready && r_decode_cnt == PCM_COLN-1 && r_iter_cnt == 0)
															o_init_info_ready <= 0;
	else;
end

always@(posedge clk)	begin
	if(~rst_n)												r_decoding <= 0;
	else if(w_decode_begin)									r_decoding <= 1;
	else if(o_decode_end)									r_decoding <= 0;
	else;
end

always@(posedge clk)	begin
	if(~rst_n)												r_is_first_iter <= 0;
	else if(w_decode_begin)									r_is_first_iter <= 1;
	else if(r_decoding && r_decode_cnt == PCM_COLN-1 && r_iter_cnt == 0)
															r_is_first_iter <= 0;
	else;
end

always @(posedge clk) begin
	if(~rst_n)									         	r_decode_cnt <= 0;
    else if(w_decode_begin)									r_decode_cnt <= 0;
	else if(r_decoding)										r_decode_cnt <= r_decode_cnt == PCM_COLN-1 ? 0 : r_decode_cnt + 1;
	else;
end

always@(posedge clk)	begin
	if(~rst_n)												r_iter_cnt <= 0;
	else if(o_decode_end)									r_iter_cnt <= 0;
	else if(r_decoding && r_decode_cnt == PCM_COLN-1)		r_iter_cnt <= (r_iter_cnt == MAX_ITER-1) ? 0 : r_iter_cnt + 1 ;
	else;
end

// 计数延迟
reg	[MAX_DELAY-1:0]		r_decode_begin_delay;
reg	[MAX_DELAY-1:0]		r_decoding_delay;
reg	[MAX_DELAY-1:0]		r_is_first_iter_delay;
reg	[COL_CNT_WID-1:0]	r_decode_cnt_delay	[0:MAX_DELAY-1];

always@(posedge clk)	r_decode_begin_delay 	<= {r_decode_begin_delay[MAX_DELAY-2:0],w_decode_begin};
always@(posedge clk)	r_decoding_delay 		<= {r_decoding_delay[MAX_DELAY-2:0],r_decoding};
always@(posedge clk)	r_is_first_iter_delay 	<= {r_is_first_iter_delay[MAX_DELAY-2:0],r_is_first_iter};
generate
	for ( i=0; i<MAX_DELAY; i=i+1 ) begin: COUNT_DELAY
		always @(posedge clk) begin
			if(~rst_n)										r_decode_cnt_delay[i] <= 0;
    		else if(r_decode_begin_delay[i])				r_decode_cnt_delay[i] <= 0;
			else if(r_decoding_delay[i])					r_decode_cnt_delay[i] <= r_decode_cnt_delay[i] == PCM_COLN-1 ? 0 : r_decode_cnt_delay[i] + 1;
			else;
		end
	end
endgenerate


always@(posedge clk)	begin
	if(~rst_n)												r_output_cnt <= 0;
	else if(o_decode_end)									r_output_cnt <= 0;
	else													r_output_cnt <= r_output_cnt +1;
end

always@(posedge clk)	begin
	if(~rst_n)												r_decode_end <= 0;
	else if(o_decoded_info_valid && o_decoded_info_last)	r_decode_end <= 0;
	else if(o_decode_end)									r_decode_end <= 1;
	else;
end

// -------------------------^ 计数 ^-------------------------

// -------------------------v llr memory v-------------------
	/*	- single port ram
		- width		INIT_INFO_WID * BLK_SIZE
		- depth		PCM_COLN
	*/
wire									llr_mem_wea;
wire	[COL_CNT_WID-1:0]				llr_mem_addr;
wire	[INIT_INFO_WID*BLK_SIZE-1:0]	llr_mem_din;
wire	[INIT_INFO_WID*BLK_SIZE-1:0]	llr_mem_dout;

assign	llr_mem_wea		= r_is_first_iter;
assign	llr_mem_addr	= r_decode_cnt;
assign	llr_mem_din		= i_init_info;

llr_mem inst_llr_mem 	(
  .clka		(clk),    			// input wire clka
  .wea		(llr_mem_wea),      // input wire [0 : 0] wea
  .addra	(llr_mem_addr),  	// input wire [6 : 0] addra
  .dina		(llr_mem_din),    	// input wire [253 : 0] dina
  .douta	(llr_mem_dout)  	// output wire [253 : 0] douta
);
// -------------------------^ llr memory ^-------------------

// -------------------------v V2C sign memory v-------------------
	/*	-simple dual port ram
		- width: BLK_SIZE * PCM_ROWN
		- depth: PCM_COLN
	*/
wire	[1*BLK_SIZE*PCM_ROWN-1:0]	w_memvs_doutb;

mem_v2c_sign inst_mem_v2c_sign (
  .clka		(clk					),    	// input wire clka
  .wea		(r_decoding_delay[3]	),      // input wire [0 : 0] wea
  .addra	(r_decode_cnt_delay[3]	),  	// input wire [6 : 0] addra
  .dina		(w_cns_o_v2c_sign_bus	),    	// input wire [761 : 0] dina
  .clkb		(clk					),    	// input wire clkb
  .addrb	(r_decode_cnt_delay[0]	),  	// input wire [6 : 0] addrb
  .doutb	(w_memvs_doutb			)  		// output wire [761 : 0] doutb
);
// -------------------------v V2C sign memory v-------------------

// -------------------------v rom shift v-------------------------
	/*	- single port rom
		- width: COL_CNT_WID * PCM_ROWN
		- depth: PCM_COLN
		- no primitive output register
	*/
wire	[GF_SIZE_LOG2*PCM_ROWN-1:0]		w_rom_shift_dout;

rom_shift inst_rom_shift (
  .clka		(clk				),		// input wire clka
  .addra	(r_decode_cnt		),  	// input wire [6 : 0] addra
  .douta	(w_rom_shift_dout	) 		// output wire [41 : 0] douta
);
// -------------------------v rom shift v-------------------------

// -------------------------v cn_r	v--------------------------
wire	[MSG_WIDTH*PCM_ROWN*BLK_SIZE-1:0]		w_cnr_o_c2v_bus;

generate
	for(i=0; i<PCM_ROWN; i=i+1) begin: CN_R
		for(j=0; j<BLK_SIZE; j=j+1)	begin: CN_R_unit
			wire 	[ABS_WID-1:0]	w_cnr_i_v2c_abs	[0:1]	;
			wire	[COL_CNT_WID-1:0]	w_cnr_i_idx_0			;
			wire						w_cnr_i_v2c_sign		;
			wire						w_cnr_i_v2c_sign_tot	;
			wire	[MSG_WIDTH-1:0]		w_cnr_o_r				;


			assign	w_cnr_i_v2c_abs[0] = w_cns_o_v2c_abs_bus[0][ABS_WID*(i*BLK_SIZE+j+1)-1:ABS_WID*(i*BLK_SIZE+j)];
			assign	w_cnr_i_v2c_abs[1] = w_cns_o_v2c_abs_bus[1][ABS_WID*(i*BLK_SIZE+j+1)-1:ABS_WID*(i*BLK_SIZE+j)];
			assign	w_cnr_i_idx_0	   = w_cns_o_v2c_idx_bus[COL_CNT_WID*(i*BLK_SIZE+j+1)-1: COL_CNT_WID*(i*BLK_SIZE+j)];
			assign	w_cnr_i_v2c_sign   = w_cns_o_v2c_sign_bus[BLK_SIZE*i+j];
			assign	w_cnr_i_v2c_sign_tot = w_cns_o_v2c_sign_tot_bus[i*BLK_SIZE+j];
			assign	w_cnr_o_c2v_bus[MSG_WIDTH*(i*BLK_SIZE+j+1)-1:MSG_WIDTH*(i*BLK_SIZE+j)] = w_cnr_o_r;
			
			
			cn_r #(
				.MSG_WIDTH			(MSG_WIDTH		),
				.COL_CNT_WID		(COL_CNT_WID	)
			) inst_cn_r(
				.i_clk				(clk						),
				.i_rst_n			(rst_n						),
				.i_v2c_abs_0		(w_cnr_i_v2c_abs[0]			),
				.i_v2c_abs_1		(w_cnr_i_v2c_abs[1]			),
				.i_idx_0			(w_cnr_i_idx_0				),
				.i_v2c_sign			(w_cnr_i_v2c_sign			),
				.i_v2c_sign_tot		(w_cnr_i_v2c_sign_tot		),
				.i_col_cnt			(r_decode_cnt_delay[0]		),
				.i_is_first_iter	(r_is_first_iter_delay[0]	),
				.o_c2v				(w_cnr_o_r					)
			);

		end
	end
endgenerate

// -------------------------^ cn_r ^--------------------------

// -------------------------v barrel shifter v----------------
wire		[MSG_WIDTH*BLK_SIZE*PCM_ROWN-1:0]	w_c2v_shift_bus;

generate
	for(i=0; i<PCM_ROWN; i=i+1)	begin: Barrel_Shifter
		
		wire	[GF_SIZE_LOG2-1:0]				w_bs_shifter_offset	;
		wire	[MSG_WIDTH*BLK_SIZE-1:0]		w_bs_i_data			;
		wire	[MSG_WIDTH*BLK_SIZE-1:0]		w_bs_o_data			;

		assign	w_bs_shifter_offset = w_rom_shift_dout[GF_SIZE_LOG2*(i+1)-1:GF_SIZE_LOG2*i];
		assign	w_bs_i_data = w_cnr_o_c2v_bus[MSG_WIDTH*BLK_SIZE*(i+1)-1:MSG_WIDTH*BLK_SIZE*i];
		assign	w_c2v_shift_bus[MSG_WIDTH*BLK_SIZE*(i+1)-1:MSG_WIDTH*BLK_SIZE*i] = w_bs_o_data;

		barrel_shifter_pblk #(
			.DATA_WIDTH 		(MSG_WIDTH			), 		
			.DATA_NUM			(BLK_SIZE			),			
			.SHIFT_OFFSET_WIDTH (GF_SIZE_LOG2		) 
		) inst_barrel_shifter_pblk(
			.i_blk_ena		(1'b1				),	
			.i_shift_offset	(w_bs_shifter_offset),	
			.i_data			(w_bs_i_data		),	
			.o_shift_data	(w_bs_o_data		)	
		);
	end
endgenerate
// -------------------------^ barrel shifter ^----------------

// -------------------------v vn v ---------------------------

wire	[MSG_WIDTH*BLK_SIZE*PCM_ROWN-1:0]	w_vn_v2c_bus;
wire	[BLK_SIZE-1:0]						w_vn_o_app;
generate
	for(j=0; j<BLK_SIZE; j=j+1)	begin: VN

		wire	[MSG_WIDTH-1:0]				w_vn_llr;
		wire	[MSG_WIDTH*PCM_ROWN-1:0]	w_vn_c2v;
		wire	[MSG_WIDTH*PCM_ROWN-1:0]	w_vn_o_v2c;
		
		assign	w_vn_llr =	llr_mem_dout[INIT_INFO_WID*(j+1)-1:INIT_INFO_WID*j]== 2'b00 ? i_strength0 
								: llr_mem_dout[INIT_INFO_WID*(j+1)-1:INIT_INFO_WID*j]== 2'b01 ? i_strength1
									: llr_mem_dout[INIT_INFO_WID*(j+1)-1:INIT_INFO_WID*j]== 2'b10 ? 1 + ~i_strength0
										: 1 + ~i_strength1;

		for(i=0; i<PCM_ROWN; i=i+1) begin
			assign	w_vn_c2v[MSG_WIDTH*(i+1)-1:MSG_WIDTH*i] = w_c2v_shift_bus[MSG_WIDTH*(BLK_SIZE*i+j+1)-1: MSG_WIDTH*(BLK_SIZE*i+j)];
			assign	w_vn_v2c_bus[MSG_WIDTH*(BLK_SIZE*i+j+1)-1: MSG_WIDTH*(BLK_SIZE*i+j)] = w_vn_o_v2c[MSG_WIDTH*(i+1)-1: MSG_WIDTH*i];
		end
		vn #(
			.MSG_WIDTH	(MSG_WIDTH	),
			.PCM_ROWN	(PCM_ROWN	)
		) inst_vn (
			.i_clk		(clk			),	
			.i_rst_n	(rst_n			),	
			.i_llr		(w_vn_llr		),	
			.i_c2v_bus	(w_vn_c2v		),	
			.o_app		(w_vn_o_app[j]	),	
			.o_v2c_bus	(w_vn_o_v2c		)	
		);


	end
endgenerate


// -------------------------v vn v ---------------------------

// -------------------------v reverse barrel shifter v----------------
wire		[MSG_WIDTH*BLK_SIZE*PCM_ROWN-1:0]	w_c2v_new_shift_bus;
reg			[GF_SIZE_LOG2-1:0]					r_bsr_shifter_offset	[0:PCM_ROWN-1];
generate
	for(i=0; i<PCM_ROWN; i=i+1)	begin: Barrel_Shifter_Rev		
		wire	[MSG_WIDTH*BLK_SIZE-1:0]		w_bsr_i_data			;
		wire	[MSG_WIDTH*BLK_SIZE-1:0]		w_bsr_o_data			;

		assign	w_bsr_i_data = w_vn_v2c_bus[MSG_WIDTH*BLK_SIZE*(i+1)-1:MSG_WIDTH*BLK_SIZE*i];
		assign	w_c2v_new_shift_bus[MSG_WIDTH*BLK_SIZE*(i+1)-1:MSG_WIDTH*BLK_SIZE*i] = w_bsr_o_data;

		always@(posedge clk)	begin
			r_bsr_shifter_offset[i] <= BLK_SIZE - w_rom_shift_dout[GF_SIZE_LOG2*(i+1)-1:GF_SIZE_LOG2*i];
		end

		barrel_shifter_pblk #(
			.DATA_WIDTH 		(MSG_WIDTH			), 		
			.DATA_NUM			(BLK_SIZE			),			
			.SHIFT_OFFSET_WIDTH (GF_SIZE_LOG2		) 
		) inst_barrel_shifter_pblk_rev(
			.i_blk_ena		(1'b1					),	
			.i_shift_offset	(r_bsr_shifter_offset[i]),	
			.i_data			(w_bsr_i_data			),	
			.o_shift_data	(w_bsr_o_data			)	
		);
	end
endgenerate
// -------------------------^ reverse barrel shifter ^----------------

// -------------------------v cn-s v----------------------------------
generate
	for(i=0; i<PCM_ROWN; i=i+1)	begin: CN_S
		for(j=0; j<BLK_SIZE; j=j+1) begin: CN_S_unit

			wire	[MSG_WIDTH-1:0]				w_cns_i_v2c			;
			wire	[BLK_SIZE-1:0]				w_cns_i_v2c_sign_old;
			wire	[ABS_WID*2-1:0]				w_cns_o_v2c_abs		;
			wire	[COL_CNT_WID-1	:0]			w_cns_o_v2c_idx		;
			wire								w_cns_o_v2c_sign	;
			wire								w_cns_o_v2c_sign_tot;

			assign	w_cns_i_v2c = w_c2v_new_shift_bus[(BLK_SIZE*i+j+1)*MSG_WIDTH-1:(BLK_SIZE*i+j)*MSG_WIDTH];
			assign	w_cns_i_v2c_sign_old = w_memvs_doutb[i*BLK_SIZE+j];
			assign	w_cns_o_v2c_abs_bus[0][ABS_WID*(i*BLK_SIZE+j+1)-1: ABS_WID*(i*BLK_SIZE+j)] = w_cns_o_v2c_abs[ABS_WID-1:0];
			assign	w_cns_o_v2c_abs_bus[1][ABS_WID*(i*BLK_SIZE+j+1)-1: ABS_WID*(i*BLK_SIZE+j)] = w_cns_o_v2c_abs[ABS_WID*2-1:ABS_WID];
			assign	w_cns_o_v2c_idx_bus[COL_CNT_WID*(i*BLK_SIZE+j+1)-1: COL_CNT_WID*(i*BLK_SIZE+j)] = w_cns_o_v2c_idx;
			assign	w_cns_o_v2c_sign_bus[i*BLK_SIZE+j] = w_cns_o_v2c_sign;
			assign	w_cns_o_v2c_sign_tot_bus[i*BLK_SIZE+j] = w_cns_o_v2c_sign_tot;
			
			cn_s #(
				.MSG_WIDTH		(MSG_WIDTH		), 
				.MIN_NUM		(MIN_NUM		),		
				.COL_CNT_WID	(COL_CNT_WID	)
			) inst_cn_s (
				.i_clk			(clk					),
				.i_rst_n		(rst_n					),
				.i_vld			(r_decoding_delay[2]	),	
				.i_v2c			(w_cns_i_v2c			),
				.i_col_cnt		(r_decode_cnt_delay[2]	),
				.i_v2c_sign_old	(w_memvs_doutb			),
				.o_v2c_abs		(w_cns_o_v2c_abs		),
				.o_v2c_idx		(w_cns_o_v2c_idx		),
				.o_v2c_sign		(w_cns_o_v2c_sign		),
				.o_v2c_sign_tot	(w_cns_o_v2c_sign_tot	)
			);
		end
	end
endgenerate	
// -------------------------^ cn-s ^----------------------------------

// -------------------------v parity check v-------------------------
wire	[GF_SIZE_LOG2*PCM_ROWN-1:0] 	w_parity_check_offset;
generate
	for(i=0; i<PCM_ROWN; i=i+1)	begin
		assign w_parity_check_offset[GF_SIZE_LOG2*(i+1)-1:GF_SIZE_LOG2*i] = r_bsr_shifter_offset[i];
	end
endgenerate

parity_check #(
	.BLK_SIZE		(BLK_SIZE		),		
	.GF_SIZE_LOG2	(GF_SIZE_LOG2	),	
	.PCM_ROWN		(PCM_ROWN		)		
)	inst_parity_check	(
	.clk				(clk						),			
	.rst_n				(rst_n						),		
	
	.i_decode_begin		(r_decode_begin_delay[2]	),
	.i_decode_end		(o_decode_end				),
	.i_is_first_iter	(r_is_first_iter_delay[2]	),
	.i_is_output_iter	(r_decode_end				),

	.i_app				(w_vn_o_app					),			
	.i_col_cnt			(r_decode_cnt_delay[2]		),		
	.i_col_cnt_mem		(r_decode_cnt_delay[0]		),	
	.i_col_cnt_output	(r_output_cnt				),
	.i_shift_offset		(w_parity_check_offset		),	
	.o_parity_check_ok	(o_parity_check_satisfied	),
	.o_app				(o_decoded_info				)
);

// -------------------------^ parity check ^-------------------------

// -------------------------v Output Assign v-------------------------
assign	o_decode_end = o_parity_check_satisfied || (r_decode_cnt == PCM_COLN-1 && r_iter_cnt == MAX_ITER-1); 
assign	o_decoded_info_valid = r_decode_end && r_output_cnt >= RW_LATENCY && r_output_cnt < PCM_COLN + RW_LATENCY;
assign	o_decoded_info_last = r_decode_end && r_output_cnt == PCM_COLN + RW_LATENCY - 1;
// -------------------------v Output Assign v-------------------------

endmodule