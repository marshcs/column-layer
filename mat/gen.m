load('base_matrix.mat');
base_matrix_inv = base_matrix(6:-1:1,:);
base_matrix_2 = dec2bin(base_matrix_inv);
fid = fopen('matrix.coe','w+');
fprintf(fid,'memory_initialization_radix = 2;\nmemory_initialization_vector = \n');
for i=1:72*6
    fprintf(fid, '%s', base_matrix_2(i,:));
    if(mod(i,6)==0)
        fprintf(fid, '\n');
    end
end
fclose(fid);
