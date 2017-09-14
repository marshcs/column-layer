function [v2c,decision,new_vn_record] = vnu(c2v,init_llr,max_abs)
%myFun - Description
%
% Syntax: [v2c,decision,new_vn_record,v2c_sign_diff_flag] = myFun(input)
% llr: 127 * 1
% c2v: 127 * 6
%
% Long description
	[blk_size,pcm_rown] = size(c2v);
	app_llr = sum([c2v,init_llr]);			% 127 * 1
	v2c = repmat(app_llr,1,pcm_rown) - c2v;
	v2c(v2c > max_abs) = max_abs;
	v2c(v2c < max_abs) = -max_abs;

	hard_decision = zeros(size(app_llr));
	hard_decision(app_llr < 0) = 1;

	v2c_sign = zeros(size(v2c));
	v2c_sign(v2c < 0) = 1;

	new_vn_record = struct([]);

	for d1 = 1:1:blk_size
		new_vn_record(d1).v2c_sign = v2c_sign(d1,:);
		new_vn_record(d1).vn_dcs = hard_decision(d1);
	end
end

