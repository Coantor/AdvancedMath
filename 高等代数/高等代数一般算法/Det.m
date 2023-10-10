function [det0] = Det(mat)
%% 使用行列式的定义,按照第一列展开,计算余子式
det0 = 0;
if ( all( size(mat) == [2,2]) ) %二阶矩阵的情况
    det0 = mat(1,1)*mat(2,2) - mat(1,2)*mat(2,1);
elseif ( all (size(mat) == [1,1]) ) % 一阶矩阵的情况
        det0 = mat(1,1); 
else %大于等于三阶的情况
  
    for i = 1:size(mat,1)
        mat_copy = mat(:,2:size(mat,2)); % 拷贝一份数据
        mat_copy(i,:) = []; % 删除某一行
        k = (-1)^(i + 1)*mat(i,1) * Det(mat_copy);
        det0 = det0 + k;
    end
    
end
end

