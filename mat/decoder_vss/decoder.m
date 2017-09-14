function [decision] = decoder(init_llr,PCM)
%myFun - Description
%
% Syntax: v = decoder(init_llr,base_matrix)
%
% Long description

% all memory are aranged with 
% 	dim1:1-pcm_rown / dim2:1-blk_size / dim3 pcm_coln

% parameter
msg_width = 6;
abs_width = msg_width-1;
max_abs = 2^abs_width-1;	
max_iter = 20;
col_cnt_width = 7;

pcm_rown	= PCM.arg.pcm_rown;
pcm_coln	= PCM.arg.pcm_coln;
blk_size	= PCM.arg.blk_size;

% llr_mem init
init_llr_mem = reshape(init_llr,blk_size,1,pcm_coln);

% vn_record_mem
vn_record_mem = struct([]);

for i = 1:pcm_coln
	for j = 1:blk_size
		vn_record_mem(1,j,i).v2c_sign = zeros(pcm_rown,1);
		vn_record_mem(1,j,i).vn_dcs = 0;
	end
end

% cn_record_reg
cn_record_reg = struct([]);
for i = 1:pcm_coln
	for j = 1:blk_size
		for k= 1:pcm_rown
			cn_record_reg(i,j,k).min1 = max_abs;
			cn_record_reg(i,j,k).min2 = max_abs;
			cn_record_reg(i,j,k).index1 = 2^col_cnt_width-1;
			cn_record_reg(i,j,k).index2 = 2^col_cnt_width-1;
			cn_record_reg(i,j,k).global_sign = 0;
		end
	end
end

% decoding
stop = 0;
vn_dcs = zeros(1,blk_size,pcm_coln);

for i = 1:1:max_iter
	for j = 1:1:pcm_coln
		if ~stop
			clc;
            fprintf('每次解码需 %d 次迭代，每次迭代需 %d 个周期\n',iter_num,pcm_coln/pcm_pro_coln);
            fprintf('正在进行第 %d 次迭代的第 %d 个周期\n',i,j);

			pcm_pro = pcm(:,j);
			vn_record = vn_record_mem(:,:,j);

