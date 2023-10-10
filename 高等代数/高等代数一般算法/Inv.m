function [inv_mat] = Inv(mat)
% ʹ�ð�����������������
n = size(mat,1); 
inv_mat = zeros(n,n);
det_mat = Det2(mat);
if  abs(det_mat ) < 1e-10
     error("������ܲ�����");
end

for i = 1:n
    for j = 1:n
        % �����������ʽ,������ת��
        inv_mat(j,i) = (-1)^(i+j)*Det2(mat(setdiff(1:n,i),setdiff(1:n,j)));
    end
end

inv_mat = inv_mat/det_mat; %��������ʽ

end

