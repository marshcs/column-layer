function [decode_bit,decode_success] = decoder_vss_pip(llr,base_matrix,PARA)
    % clearvars
    % load('ldpc.mat');
 
    pipe_stage = 3;
    do_break = 1;
    do_print = 0;
    max_iter = PARA.max_iter;
	max_abs = PARA.max_abs;
	pcm_rown = PARA.pcm_size(1);
	pcm_coln = PARA.pcm_size(2);
	blk_size = PARA.blk_size;
	min_num = PARA.min_num;
	strength = PARA.strength;
	max_col_cnt = 2 ^ 7 - 1;
    inv_base_matrix = 127-base_matrix;

    c2v_gen_shift = zeros(blk_size,pcm_rown);
    v2c_shift = zeros(blk_size,pcm_rown);

	fid1 = fopen('v2c_clip.txt','w');
	fid2 = fopen('c2v.txt','w');
	fid3 = fopen('v2c_shift.txt','w');
	fid4 = fopen('mem_c2v.txt','w');
	
	for iter = 1:max_iter

		if(iter == 1)
			% all memory initianlization
			pip_mem_c2v = cell(1);
			pip_mem_app = cell(1);
			mem_llr = (0.5-llr)*2*strength;
			mem_c2v = struct(	'min', max_abs * ones(blk_size,pcm_rown,min_num),		...
								'idx', max_col_cnt * ones(blk_size, pcm_rown,min_num),	...
								'global_sign', zeros(blk_size,pcm_rown)					...
				);
			mem_v2c_sign 	= zeros(blk_size,pcm_rown, pcm_coln,'logical');
			mem_app			= zeros(blk_size,pcm_coln,'logical');

			for i = 1:pipe_stage
				pip_mem_c2v{i} = mem_c2v;
				pip_mem_v2c_sign{i} = mem_v2c_sign;
				pip_mem_app{i} = mem_app;
			end

			c2v_gen 		= zeros(blk_size,pcm_rown);
			check_sum		= zeros(blk_size,pcm_rown,'logical');
			app_diff_shift	= zeros(blk_size,pcm_rown);
		end

		for col = 1:pcm_coln

			%% cnr
			if(iter ~= 1)
				logical_idx = (pip_mem_c2v{1}.idx == col);
				c2v_abs_gen = pip_mem_c2v{1}.min(:,:,2).*(logical_idx(:,:,1)) + pip_mem_c2v{1}.min(:,:,1).*(~logical_idx(:,:,1));
				c2v_abs_gen = floor(c2v_abs_gen*3/4);
				c2v_gen = c2v_abs_gen.*~mod(pip_mem_c2v{1}.global_sign + pip_mem_v2c_sign{1}(:,:,col),2) ...
						- c2v_abs_gen.* mod(pip_mem_c2v{1}.global_sign + pip_mem_v2c_sign{1}(:,:,col),2);
				% c2v_gen = c2v_abs_gen.*~mod(mem_c2v.global_sign + pip_mem_v2c_sign{1}(:,:,col),2) ...
				% 		- c2v_abs_gen.* mod(mem_c2v.global_sign + pip_mem_v2c_sign{1}(:,:,col),2);

			end

			%% shifter
			% new = old - shift_offset
			for row = 1:pcm_rown
				c2v_gen_shift(1:end-base_matrix(row,col),row) = c2v_gen(base_matrix(row,col)+1:end,row);
				c2v_gen_shift(end-base_matrix(row,col)+1:end,row) = c2v_gen(1:base_matrix(row,col),row);
			end

			%% vnu
			app_value = sum([mem_llr(:,col),c2v_gen_shift],2);
			v2c = app_value - c2v_gen_shift;
			v2c_clip = max_abs*(v2c >= max_abs) + (-max_abs)*(v2c <= -max_abs) + v2c.*(v2c < max_abs & v2c > (-max_abs));
			app = (app_value < 0);

			%% parity_check
			old_app = mem_app(:,col);
			mem_app(:,col) = app;
			app_diff = xor(app,old_app);
			for row = 1:pcm_rown
				app_diff_shift(1:end-inv_base_matrix(row,col),row)		= app_diff(inv_base_matrix(row,col)+1:end);
				app_diff_shift(end-inv_base_matrix(row,col)+1:end,row)	= app_diff(1:inv_base_matrix(row,col));
			end
			check_sum = xor(check_sum,app_diff_shift);
			decode_success = (~any(check_sum(:)) & iter ~=1);
			
			%% output 
			if(decode_success && do_break)
                break;
            end

			%% reverse_shifter
			for row = 1:pcm_rown
				v2c_shift(1:end-inv_base_matrix(row,col),row)		= v2c_clip(inv_base_matrix(row,col)+1:end,row);
				v2c_shift(end-inv_base_matrix(row,col)+1:end,row)	= v2c_clip(1:inv_base_matrix(row,col),row);
			end
			
			% cns
			v2c_sign_new = (v2c_shift < 0);
			v2c_sign_old = mem_v2c_sign(:,:,col);
			mem_v2c_sign(:,:,col) = v2c_sign_new;
			mem_c2v.global_sign = mod(v2c_sign_new + v2c_sign_old + mem_c2v.global_sign , 2);
			is_same_col = (mem_c2v.idx == col);
			mem_c2v.min = max_abs*is_same_col + mem_c2v.min.*(~is_same_col);
			queue_abs = cat(3,mem_c2v.min,abs(v2c_shift));
			queue_idx = cat(3,mem_c2v.idx,col*ones(blk_size,pcm_rown,1));
			[queue_abs_sorted,queue_abs_sorted_idx] = sort(queue_abs,3);
			mem_c2v.min = queue_abs_sorted(:,:,1:min_num);
			for i = 1:min_num
				for row = 1:pcm_rown
					for blk = 1:blk_size
						mem_c2v.idx(blk,row,i) = queue_idx(blk,row,queue_abs_sorted_idx(blk,row,i));
					end
				end
			end

			% pipeline operation
            for i = 1:pipe_stage-1
				pip_mem_c2v{i} = pip_mem_c2v{i+1};
				pip_mem_app{i} = pip_mem_app{i+1};
				pip_mem_v2c_sign{i} = pip_mem_v2c_sign{i+1}; 
			end
			pip_mem_c2v{pipe_stage}			= mem_c2v;
			pip_mem_app{pipe_stage}			= mem_app;
			pip_mem_v2c_sign{pipe_stage}	= mem_v2c_sign;

			
			%% data print
            if do_print
                fprintf(fid1,'iter = %d, pcm_col = %d\n',iter,col);
                fprintf(fid2,'iter = %d, pcm_col = %d\n',iter,col);
                fprintf(fid3,'iter = %d, pcm_col = %d\n',iter,col);
                fprintf(fid4,'iter = %d, pcm_col = %d\n',iter,col);
                for row = 1:pcm_rown
                	for blk = 1:blk_size
            			fprintf(fid1,'%3d',v2c_clip(blk,row));
            			fprintf(fid2,'%3d',c2v_gen(blk,row));
            			fprintf(fid3,'%3d',v2c_shift(blk,row));
                		fprintf(fid4,'%3d/%3d/%3d  ',mem_c2v.min(blk,row,1),mem_c2v.min(blk,row,2),mem_c2v.min(blk,row,3));
                    end
                	fprintf(fid1,'\n');
                	fprintf(fid2,'\n');
                	fprintf(fid3,'\n');
                    fprintf(fid4,'\n');
                end
            else
                
            end

		end

        if(decode_success && do_break)
            break;
        end
	end


	if(~decode_success)
		decode_bit = reshape(mem_app,1,blk_size*pcm_coln);
		fprintf('decode fail\n');
    else
        decode_bit = reshape(mem_app,1,blk_size*pcm_coln);
        fprintf('decode succeed\niter = %d,col = %d\nAny 1 = %d\n',iter,col,any(decode_bit()));
	end
	fclose(fid1);
	fclose(fid2);
	fclose(fid3);
	fclose(fid4);
end




