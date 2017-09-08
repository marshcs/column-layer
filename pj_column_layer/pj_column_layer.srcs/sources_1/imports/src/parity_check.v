module parity_check #(
	parameter	BLK_SIZE		=	0	,
	parameter	COL_CNT_WID		=	7	,
	parameter	GF_SIZE_LOG2	=	0	,
	parameter	PCM_ROWN		=	0
) (
	input										clk					,
	input										rst_n				,

	input										i_decode_begin		,
	input										i_decode_end		,
	input										i_is_first_iter		,
	input										i_is_output_iter	,

	input	[BLK_SIZE-1:0]						i_app				,
	input	[COL_CNT_WID-1:0]					i_col_cnt			,
	input	[COL_CNT_WID-1:0]					i_col_cnt_mem		,			// col_cnt for memory
	input	[COL_CNT_WID-1:0]					i_col_cnt_output	,
	input	[GF_SIZE_LOG2*PCM_ROWN-1:0]			i_shift_offset		,

	output										o_parity_check_ok	,
	output	[BLK_SIZE-1:0]						o_app				
);

// ------------------v param & decalre v------------------------------------
genvar	i;
// count
reg 	r_decoding;
// app memory
wire [COL_CNT_WID-1:0]	w_addrb_read;
wire [BLK_SIZE-1:0]		w_old_app;
// ------------------^ param & decalre ^------------------------------------ 

// ---------------------v Count v--------------------------------------------
always@(posedge	clk)	begin
  if(~rst_n)						r_decoding <= 0;
  else if(i_decode_begin)			r_decoding <= 1;
  else if(i_decode_end)				r_decoding <= 0;
  else;
end
// ---------------------v Count v--------------------------------------------

// ---------------------v app memroy v----------------------------------------
	/*	simple dual port mem
		- read first
		- width: BLK_SIZE
		- depth: PCM_COLN
	*/

assign	w_addrb_read = i_is_output_iter ? i_col_cnt_output : i_col_cnt_mem;

mem_app inst_mem_app (
  .clka		(clk			),		// input wire clka
  .wea		(r_decoding		),		// input wire [0 : 0] wea
  .addra	(i_col_cnt		),		// input wire [6 : 0] addra
  .dina		(i_app			),		// input wire [126 : 0] dina
  .clkb		(clk			),		// input wire clkb
  .addrb	(w_addrb_read	),		// input wire [6 : 0] addrb
  .doutb	(w_old_app		)		// output wire [126 : 0] doutb
);
// ---------------------^ app memory ^----------------------------------------

// ---------------------v checksum update v-----------------------------------
	// checksum update
	wire	[BLK_SIZE-1:0]				w_app_diff							;
	reg		[BLK_SIZE-1:0]				r_checksum 			[0:PCM_ROWN-1]	;
	wire	[PCM_ROWN-1:0]				w_parity_check_ok					;
	wire	[GF_SIZE_LOG2-1:0]			w_shift_offset		[0:PCM_ROWN-1]	;
	wire	[BLK_SIZE-1:0]				w_app_diff_shift	[0:PCM_ROWN-1]	;
	
	assign		w_app_diff = i_is_first_iter ? i_app : w_old_app ^ i_app;
	assign		o_parity_check_ok = (& w_parity_check_ok) && (~i_is_first_iter) && r_decoding;
	generate
		for(i=0; i< PCM_ROWN; i=i+1)	begin: CHECKSUM_UPDATE
			always@(posedge clk)	begin
				if(~rst_n)					r_checksum[i] <= 0;
				// else if(i_decode_end)	r_checksum[i] <= 0;
				else if(i_decode_begin)		r_checksum[i] <= 0;
				else if(r_decoding)			r_checksum[i] <= w_app_diff_shift[i] ^ r_checksum[i];
				else;
			end
			assign	w_parity_check_ok[i] = !(|r_checksum[i]);
		end
	endgenerate

// ---------------------^ checksum update ^-----------------------------------

// ---------------------v barrel shifter v------------------------------------


generate
	for(i=0; i< PCM_ROWN; i=i+1)	begin: Barrel_Shifter_Ter

		assign		w_shift_offset[i] = i_shift_offset[GF_SIZE_LOG2*(i+1)-1: GF_SIZE_LOG2*i];

		barrel_shifter_pblk #(
			.DATA_WIDTH 		(1					), 		
			.DATA_NUM			(BLK_SIZE			),			
			.SHIFT_OFFSET_WIDTH (GF_SIZE_LOG2		) 
		) inst_barrel_shifter_pblk_rev(
			.i_blk_ena			(1'b1					),	
			.i_shift_offset		(w_shift_offset[i]		),	
			.i_data				(w_app_diff				),	
			.o_shift_data		(w_app_diff_shift[i]	)	
		);
	end
endgenerate
// ---------------------^ barrel shifter ^------------------------------------

// ---------------------v output v--------------------------------------------
assign	o_app = w_old_app;

// ---------------------v output v--------------------------------------------

endmodule