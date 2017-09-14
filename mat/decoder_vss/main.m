	
	load('base_matrix.mat');

	PARA = struct();
	PARA.max_iter 	= 20;
	PARA.max_abs	= 31;
	PARA.pcm_size	= [6,72];
	[pcm_rown,pcm_coln] = PARA.pcm_size;
	PARA.blk_size	= 127;
	PARA.min_num	= 3;
	PARA.strength	= 6;

	llr = zeros(blk_size,pcm_coln)
	decoder_vss