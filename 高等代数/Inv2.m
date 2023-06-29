function [inv_mat] = Inv2(mat)
%使用初等行变换求矩阵的逆
%   此处显示详细说明
n = size(mat,1); %记录矩阵的规格
M = [mat,eye(n)];  % 记录需要进行初等变换的矩阵

for i = 1:n
     if ( M(i,i) == 0 ) 
        %找到不为0的元素,交换两行
        for j = (i+1):n 
            if(M(j,i) ~= 0) 
                temp = M(j,i:2*n);
                M(j,i:2*n) = M(i,1:2*n);
                M(i,1:2*n) = temp;
                break;
            end
        end        
     end
     
    if M(i,i) ~= 0
        % 使用第二类初等行变换
        M(i,i:2*n) = M(i,i:2*n)/M(i,i); 

        % 如果不为0,则使用第三类初等变换
        for j = (i+1):n
            M(j,i:2*n) = M(j,i:2*n) - M(j,i) * M(i,i:2*n); %第三类初等变换
        end
    
    end
end
    %% 此时得到对角线上都是1的上三角矩阵
    if  prod(diag(M))== 0
        error("矩阵不可逆");
    end
    
    %k表示第 k 行做为消元行, j表示需要被消元的行,j<k
    for k = n:-1:2
        for j = (k-1):-1:1
            M(j,:) = M(j,:) - M(j,k) * M(k,:);
        end
        
    end
    
inv_mat = M(:,(n+1):2*n); %返回逆矩阵

end

