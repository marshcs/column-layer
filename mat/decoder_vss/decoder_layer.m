%function [v,llr,times]=BP_decoder(y,base_matrix,maxiter)
function v=BP_decoder(y,base_matrix,maxiter)
%简化的BP min-sum算法
% H=[1 1 1 0 0 0 0 0;0 0 0 1 1 1 0 0;1 0 0 1 0 0 1 0;0 1 0 0 1 0 0 1];
% y=[0.2 0.2 -0.9 0.6 0.5 -1.1 -0.4 -1.2];
% sigma_2=0.5;
% maxiter=50;
MAX_ABS=31;
blk_size = 306;
s = 0.75;            %min-sum算法修正因子
[a,b] = size(base_matrix);% 6 * 60
n = length(y); % 18360
success = 0;k = 0;                           
llr = 7*ones(1,n);     %初始化信息节点的信息LLR
llr(y==10) = -7;     %初始化信息节点的信息LLR
c2v = zeros(a*blk_size,b);

v = zeros(1,n); % 译码结果


while((success==0)&&(k<maxiter))        %c*h'~=0或k(迭代次数)未达到最大迭代次数maxiter,继续进行迭代译码.
    for cn_blk=1:a % 6
        for idx=1:blk_size
            cn_idx = (cn_blk-1) * blk_size + idx;
            min1 = MAX_ABS;
            min2 = MAX_ABS;
            min_index = 0;
            globe_sign = 1;
            for vn_blk=1:b % 60 
                vn_index = blk_size*(vn_blk-1) + 1 + mod((idx-1) + base_matrix(cn_blk,vn_blk),blk_size);
                v2c_val = llr(vn_index) - c2v(cn_idx,vn_blk);
                if v2c_val<-MAX_ABS
                    v2c_val = -MAX_ABS;
                elseif v2c_val>MAX_ABS
                    v2c_val = MAX_ABS;
                else
                end
                llr(vn_index) = v2c_val;
                
                if v2c_val<0
                    v2c_val = -v2c_val;
                    globe_sign = -globe_sign;
                end
                if v2c_val<=min1
                    min2 = min1;
                    min1 = v2c_val;
                    min_index = vn_blk;
                elseif v2c_val<=min2
                    min2  = v2c_val;
                else
                end
            end
            
            for vn_blk=1:b % 60 
                vn_index = blk_size*(vn_blk-1) + 1 + mod((idx-1) + base_matrix(cn_blk,vn_blk),blk_size);
                if vn_blk==min_index
                    c2v_val = min2;
                else
                    c2v_val = min1;
                end
                c2v_val = floor(s*c2v_val);
                if ((llr(vn_index)<0) ~= (globe_sign<0))
                    c2v_val = -c2v_val;
                end
                c2v(cn_idx,vn_blk) = c2v_val;
                llr(vn_index) = llr(vn_index) + c2v_val;
                if llr(vn_index)<-MAX_ABS
                    llr(vn_index) = -MAX_ABS;
                elseif llr(vn_index)>MAX_ABS
                    llr(vn_index) = MAX_ABS;
                else
                end

            end
        end
        v = zeros(1,n);
        v(llr<0)=1;
        if rank(v)==0
            success=1;
        end
        
  
    end
    k = k+1;
end
