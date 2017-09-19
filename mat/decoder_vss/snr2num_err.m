code_length = 9144;
snr = 8;
sigma = 10^(-snr/20);
prob = 1-normcdf(1,0,sigma);
err_bit = floor(code_length * prob)