`timescale 1ns / 1ps

module decoder_tb(

);

	parameter	INIT_INFO_WID	= 2		;
	parameter	MSG_WIDTH		= 6		;
	parameter	GF_SIZE_LOG2	= 7		;
	//PCM
	parameter	PCM_ROWN		= 6		;
	parameter	PCM_COLN		= 72	;
	// OTHER
	parameter	MAX_ITER		= 20	;
	parameter	MIN_NUM			= 3		;		// Number of message stored in queue;
	parameter	RW_LATENCY		= 2		;

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
localparam	ABS_WID				= MSG_WIDTH-1;

// -------------------------^ parameter assign ^--------------

reg		clk;
reg		rst_n;

reg		[BLK_SIZE*INIT_INFO_WID-1:0]	i_init_info;
reg		i_init_info_valid = 0;

reg		[31:0]	cnt;

wire 	[BLK_SIZE-1:0]		o_decoded_info;
wire	o_decoded_info_valid;
wire	o_decoded_info_last;
wire	o_init_info_ready;
wire	o_decode_end;
wire	o_parity_check_satisfied;

decoder #(
.INIT_INFO_WID	(INIT_INFO_WID	),
.MSG_WIDTH		(MSG_WIDTH		),
.GF_SIZE_LOG2	(GF_SIZE_LOG2	),
.PCM_ROWN		(PCM_ROWN		),
.PCM_COLN		(PCM_COLN		),
.MAX_ITER		(MAX_ITER		),
.MIN_NUM		(MIN_NUM		),	
.RW_LATENCY		(RW_LATENCY		)	
)	tb_inst_decoder (
.clk						(clk					),
.rst_n						(rst_n					),
.i_strength0				(6'd4					),
.i_strength1				(6'd12					),
.i_init_info				(i_init_info			),
.i_init_info_valid			(i_init_info_valid		),
.o_init_info_ready			(o_init_info_ready		),
.o_decode_end				(o_decode_end			),
.o_parity_check_satisfied	(o_parity_check_satisfied),
.o_decoded_info				(o_decoded_info			),
.o_decoded_info_valid		(o_decoded_info_valid	),
.o_decoded_info_last		(o_decoded_info_last	)	
);

always	# 5 clk = ~clk;

initial	begin
	clk		= 1'b1;
	rst_n	= 1'b1;
	# 1000
	rst_n	= 1'b0;
	# 1000 
	rst_n	= 1'b1;
end

always @(posedge	clk)	begin
	if(~rst_n)							cnt <= 0;
	else								cnt <= cnt+1;
end

reg		[BLK_SIZE*INIT_INFO_WID-1:0]	r_init_info		[0:PCM_COLN-1];

initial	$readmemb("D:/cs/column-layer/mat/decoder_vss/llr.txt", r_init_info);

always@(posedge clk)	begin
	if(~rst_n)							i_init_info_valid <= 0;
	else if(cnt >= 300 && cnt < 372)	i_init_info_valid <= 1;
	else								i_init_info_valid <= 0;
end

always@(posedge clk)	begin
	if(~rst_n)							i_init_info <= 0;
	else if(cnt >=301 && cnt < 373)		i_init_info <= r_init_info[cnt-301];
	else								i_init_info <= 0;
end

endmodule