	clc
    clearvars

    % parameter
	load('base_matrix.mat');
    is_pipeline     = 1;
    num_of_err      = 35;
    max_err_frame   = 20;
    is_one_frame    = 0;
    case_noice      = 1;            % case: 0--load;    1--random noice;   2--custom noice

	base_matrix = base_matrix(:,1:72);
	PARA = struct();
	PARA.max_iter 	= 30;
	PARA.max_abs	= 31;
	PARA.pcm_size	= [6,72];
	PARA.blk_size	= 127;
	PARA.min_num	= 3;
	PARA.strength	= 4;

	blk_size = PARA.blk_size;
    pcm_coln = 72;
    code_length = blk_size*pcm_coln;

    err_frame = 0;
    tot_frame = 0;

    while err_frame < max_err_frame
    	llr = zeros(blk_size,pcm_coln,'logical');

        % add noise
        switch case_noice
        case 0
            load('err_idx.mat');
        case 1
            err_idx = ceil(rand(num_of_err,1)*code_length);
        case 2
            err_idx = [1:10];
        end
        llr(err_idx) = 1;
        
        % print llr
        if is_one_frame
            fid = fopen('llr.txt','w');
            for col = 1:pcm_coln
                for blk = blk_size:-1:1
                    fprintf(fid,'%02d',10*llr(blk,col));
                end
                fprintf(fid,'\n');
            end
            fclose(fid);
            save('err_idx.mat','err_idx');
        end
        % decode
        if  is_pipeline
            [v,decoded] = decoder_vss_pip(llr,base_matrix,PARA);
        else
            [v,decoded] = decoder_vss(llr,base_matrix,PARA);
        end
        tot_frame = tot_frame + 1;
        if ~decoded
            err_frame = err_frame + 1;
        end
        fprintf('err_frame = %d tot_frame = %d\n',err_frame,tot_frame);
        if is_one_frame  
            break;  
        end
    end

    FER = err_frame/tot_frame;

