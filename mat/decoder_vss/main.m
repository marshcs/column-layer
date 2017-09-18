	clc
    clearvars
	load('base_matrix.mat');
    num_of_err = 35;

	base_matrix = base_matrix(:,1:72);
	PARA = struct();
	PARA.max_iter 	= 20;
	PARA.max_abs	= 31;
	PARA.pcm_size	= [6,72];
	PARA.blk_size	= 127;
	PARA.min_num	= 3;
	PARA.strength	= 6;

	blk_size = PARA.blk_size;
    pcm_coln = 72;
    code_length = blk_size*pcm_coln;

    err_frame = 0;
    tot_frame = 0;

    while err_frame < 100
    	llr = zeros(blk_size,pcm_coln);
        ran_err = ceil(rand(num_of_err,1)*code_length);
        llr(ran_err) = 1;
        % fprintf('num of error bit: %d\n',size(llr_err_idx,1))
        % save('ldpc.mat');
	    [v,decoded] = decoder_vss(llr,base_matrix,PARA);
        tot_frame = tot_frame + 1;
        if ~decoded
            err_frame = err_frame + 1;
        end
    end

    FER = err_frame/tot_frame;

