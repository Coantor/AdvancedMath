function [inv_mat] = Inv(mat)
% 使用伴随矩阵求矩阵的逆矩阵
n = size(mat,1); 
inv_mat = zeros(n,n);
det_mat = Det2(mat);
if  abs(det_mat ) < 1e-10
     error("矩阵可能不可逆");
end

for i = 1:n
    for j = 1:n
        % 计算代数余子式,并做了转置
        inv_mat(j,i) = (-1)^(i+j)*Det2(mat(setdiff(1:n,i),setdiff(1:n,j)));
    end
end

inv_mat = inv_mat/det_mat; %除以行列式

end

