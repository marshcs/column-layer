	clc
    clearvars
	load('base_matrix.mat');


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


	llr = zeros(blk_size,pcm_coln);
    for row = 1:blk_size
        for col = 1:pcm_coln
        if  mod(col*blk_size+row,196) == 4
            
            llr(row,col) = 1;
        end
        end
    end
    llr_1_idx = find(llr);
    fprintf('num of error bit: %d\n',size(llr_1_idx,1))
    
    clear col row 
    save('ldpc.mat');
	
	v = decoder_vss(llr,base_matrix,PARA);
    find(v);
    num_of_1 = length(find(v))
    
    