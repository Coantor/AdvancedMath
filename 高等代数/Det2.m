function [det0] = Det2(mat)
%% 使用初等行变换,转化为对角矩阵
det0 = 1;
n = size(mat,1);
for i = 1:n
    %如果第i行第一个元素为0,则使用第一类初等行变换
    if ( mat(i,i) == 0 ) 
        %找到不为0的元素,交换两行
        for j = (i+1):n 
            if(mat(j,i) ~= 0) 
                temp = mat(j,i:n);
                mat(j,i:n) = mat(i,1:n);
                mat(i,1:n) = temp;
                det0 = (-1)* det0 ;
                break;
            end
        end 
        
    end
    
    % 发现不为0,继续执行,否则跳入下一列进行计算
    if mat(i,i) ~= 0
        % 使用第二类初等行变换
        det0 = det0 * mat(i,i);
        mat(i,i:n) = mat(i,i:n)/mat(i,i); %对第i行进行归一化

        % 如果不为0,则使用第三类初等变换，不改变矩阵的行列式

        for j = (i+1):n
            mat(j,i:n) = mat(j,i:n) - mat(j,i) * mat(i,i:n); %第三类初等变换
        end
    end
    
    
end
    det0 = det0 * prod(diag(mat)); %关键一步
end

