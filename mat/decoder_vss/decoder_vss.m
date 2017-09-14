function [decode_bit] = decoder_vss(llr,base_matrix,PARA)
	
	max_iter = PARA.max_iter;
	max_abs = PARA.max_abs;
	[pcm_rown,pcm_coln] = PARA.pcm_size;
	blk_size = PARA.blk_size;
	min_num = PARA.min_num;
	strength = PARA.strength;
	max_col_cnt = 2 ^ 7 - 1;


	llr = reshape(strength*llr,blk_size, pcm_coln);

	% memories
	

	for iter = 1:max_iter

		if(iter == 1)
			mem_c2v = struct(	'min', max_abs * ones(blk_size,pcm_rown,min_num)		...
								'idx', max_col_cnt * ones(blk_size, pcm_rown,min_num)	...
								'global_sign', zeros(blk_size,pcm_rown)					...
			);
			mem_v2c_sign 	= zeros(blk_size, pcm_rown, pcm_coln,'logical');
			mem_app			= zeros(blk_size,pcm_coln,'logical');
			check_sum 		= zeros(blk_size,pcm_rown,'logical');
			c2v_gen 		= zeros(blk_size,pcm_rown);
		end

		for col = 1:pcm_coln

			% cnr
			logical_idx = (mem_c2v.idx == col);
			c2v_abs_gen = mem_c2v.min(:,:,2).*(logical_idx(:,:,1)) + mem_c2v.min(:,:,1).*(~logical_idx(:,:,1));
			c2v_abs_gen = floor(c2v_abs_gen*3/4);
			c2v_gen = c2v_abs_gen.*~mod(mem_c2v.global_sign + mem_v2c_sign(:,:,col),2) ...
					- c2v_abs_gen.*mod(mem_c2v.global_sign + mem_v2c_sign(:,:,col),2);
			
			% shifter
			for row = 1:pcm_rown
				c2v_gen_shift(1:base_matrix(row,col),row) = c2v_gen(end-base_matrix(row,col):end, row);
				c2v_gen_shift(base_matrix(row,col):end,row) = c2v_gen(1:end-base_matrix(row,col,row));
			end

			% vnu
			app = sum([llr(:,col),c2v_gen_shift],2);
			v2c = app - c2v_gen_shift;
		
			% reverse_shifter
			for row = 1:pcm_rown
				v2c_shift(1:base_matrix(row,col),row) 	= v2c(end-base_matrix(row,col):end, row);
				v2c_shift(base_matrix(row,col):end,row) = v2c(1:end-base_matrix(row,col,row));
				app_shift(1:base_matrix(row,col),row)	= app(end-base_matrix(row,col):end);
				app_shift(base_matrix(row,col):end,row) = app(1:end-base_matrix(row,col));
			end

			% parity_check
			old_app = mem_app(:,col);
			mem_app(:,col) = (app < 0);
			check_sum = xor(mem_app(:,col),xor(check_sum,old_app));
			parity_check_ok = (~any(check_sum(:)) & iter ~=1) | (iter == max_iter & col == pcm_coln);
			
			% cns
			v2c_sign_new = (v2c_shift < 0);
			mem_v2c_sign(:,:,col) = v2c_sign_new;
			v2c_sign_old = mem_v2c_sign(:,:,col);
			mem_c2v.global_sign = mod(v2c_sign_new + v2c_sign_old + mem_c2v.global_sign , 2);
			[x,y,z] = find(logical_idx);
			queue_abs = cat(3,mem_c2v.min,abs(v2c_shift));
			queue_idx = cat(3,mem_c2v.idx,col*ones(blk_size,pcm_rown,1));
			[queue_abs_sorted,queue_abs_sorted_idx] = sort(queue_abs,3);
			mem_c2v.min = queue_abs_sorted(:,:,1:min_num);
			for i = 1:min_num
				for row = 1:pcm_rown
					for blk = 1:blk_size
						mem_c2v.idx[blk,row,i] = queue_idx[blk,row,queue_idx(blk,row,i)];
					end
				end
			end

			% output 
			if(parity_check_ok)
				decode_bit = reshape(mem_app,1,blk_size*pcm_coln);
			end
		end
	end
end