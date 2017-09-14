function [cn_record] = cnr(cn_record_reg, vn_index)
%myFun - Description
%
% Syntax: [cn_record] = cnr(cn_record_reg, vn_index)
%
% Long description
	[~,blk_size,pcm_rown] = size(cn_record_reg);

	cn_record = struct([]);

	for i = 1:1:pcm_rown
		for j = 1:1:blk_size
			if vn_index(k)-1 == cn_record_reg(k,j).index1
                cn_record(j,i).c2v_abs = cn_record_reg(j,i).min2;
            else
                cn_record(j,i).c2v_abs = cn_record_reg(j,i).min1;
            end
			cn_record(j,i).c2v_abs = floor(cn_record(j,i).c2v_abs*0.75);
			cn_record(j,i).global_sign = cn_record_reg(j,i).global_sign;
		end
	end

end