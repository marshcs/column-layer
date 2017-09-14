function new_cn_record = cns(v2c,cn_record,col_idx,v2c_sign_old)

	[blk_size,pcm_rown] = size(v2c);

	new_cn_record = struct([]);

	for d1 = 1:blk_size
		for d2 = 1:pcm_rown
			candidate = [abs(v2c(d1,d2)), cn_record(d1,d2).min];
			candidate_idx = [col_idx, cn_record(d1,d2).idx]
			min_idx = cn_record(d1,d2).idx;
			if(min_idx(1) = col_idx)
				candidate(end-1) = max_abs;
			end
			if(min_idx(2) = col_idx)
				candidate(end) = max_abs;
			end

			[min,index] = sort(candidate);
			new_cn_record(d1,d2).min = min(1:3);
			new_cn_record(d1,d2).idx = candidate_idx(index(1:3));
			new_cn_record(d1,d2).global_sign = cn_record(d1,d2).global_sign + sign(v2c(d1,d2)) + v2c_sign_old;
		end
	end
end