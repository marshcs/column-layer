module vn #(
	parameter	MSG_WIDTH 	= 6,
	parameter	COL_NUM		= 6		// # column blocks
) (
	input									i_clk		,
	input									i_rst_n		,
	
	input	[MSG_WIDTH-1:0]					i_llr		,
	input	[MSG_WIDTH*COL_NUM-1:0]			i_c2v_bus	,
	
	output									o_app		,			
	output	reg	[MSG_WIDTH*COL_NUM-1:0]		o_v2c_bus	
);

//------------>> Input register >>---------------
reg	signed	[MSG_WIDTH-1:0]	r_llr;
reg	signed	[MSG_WIDTH-1:0]	r_r 		[0:COL_NUM-1];
reg	signed	[MSG_WIDTH-1:0]	r_r_delay 	[0:COL_NUM-1];

always@(posedge i_clk)	begin
	if(~i_rst_n)		r_llr <='d0;
	else				r_llr <= i_llr;
end

genvar i;
generate
	for(i=0; i<COL_NUM; i=i+1)	begin: Input_Reg
		always@(posedge i_clk)	begin
			if(~i_rst_n)	r_r[i] <= 'd0	;
			else			r_r[i] <= i_c2v_bus[MSG_WIDTH*(i+1)-1 : MSG_WIDTH*i];
		end
		always@(posedge i_clk)	r_r_delay[i] <= r_r[i];
	end
endgenerate
//------------<< Input register <<---------------

//------------>> Add-up >>-----------------------
localparam	POS_MAX = (1 << MSG_WIDTH-1)-1	;
localparam	NEG_MAX = - POS_MAX				;

reg signed	[MSG_WIDTH+2:0]		r_r_sum_0;
reg	signed	[MSG_WIDTH+5:0]		r_r_sum_1;

always@(posedge i_clk)	r_r_sum_0 <= r_llr + r_r[0] + r_r[1] + r_r[2];
always@(posedge i_clk)	r_r_sum_1 <= r_r_sum_0 + r_r_delay[3] + r_r_delay[4] + r_r_delay[5];
assign	o_app = r_r_sum_1[MSG_WIDTH+5];
 
wire signed	[MSG_WIDTH+6:0]		w_diff		[0:COL_NUM-1];
wire signed	[MSG_WIDTH-1:0]		w_diff_squ	[0:COL_NUM-1];
generate
	for(i=0; i<COL_NUM; i=i+1)	begin: Substrac
		assign	w_diff[i] = r_r_sum_1 - r_r_delay[i];
		assign	w_diff_squ[i] = w_diff[i] > POS_MAX ? POS_MAX : w_diff[i] < NEG_MAX ? NEG_MAX : w_diff[i];
	end
endgenerate
//------------<< Add-up <<----------------------

//------------>> T_to_S >>----------------------
wire	[MSG_WIDTH-1:0]		w_q		[0:COL_NUM-1];
generate
	for(i=0; i<COL_NUM; i=i+1) begin: T_to_S
		assign	w_q[i] = w_diff_squ[i][MSG_WIDTH-1] 
							? {w_diff_squ[i][MSG_WIDTH-1], ~w_diff_squ[i][MSG_WIDTH-2:0]+1} 
							: w_diff_squ[i];
	
		always@(posedge i_clk)	begin
			if(~i_rst_n)	o_v2c_bus[(i+1)*MSG_WIDTH-1:i*MSG_WIDTH] <= 'd0	;
			else 			o_v2c_bus[(i+1)*MSG_WIDTH-1:i*MSG_WIDTH] <= w_q[i];
		end
	end
endgenerate
//------------<< T_to_S <<----------------------

endmodule