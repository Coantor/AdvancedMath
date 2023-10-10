function [mat,r] = Calc_rank(mat)
n = size(mat,1); %记录矩阵的规格
m = size(mat,2);
if m < n
    mat = mat';
    n = min(n,m);
end
%% 使用初等变换,求矩阵的列秩
for i = 1:n 
    if mat(i,i) == 0 %使用第一类初等行变换
        for j = (i+1):n 
            if(mat(j,i) ~= 0) 
                temp = mat(j,i:2*n);
                mat(j,i:2*n) = mat(i,1:2*n);
                mat(i,1:2*n) = temp;
                break;
            end
        end        
    end
    
    
    if mat(i,i) ~= 0
        mat(i,:) = mat(i,:)/mat(i,i);
        for j = (i+1):n
                mat(j,:) = mat(j,:) - mat(j,i)*mat(i,:);
        end
    end
        
end

%计算阶梯矩阵的秩
r = 0;
for k = 1:n
    if( any(mat(k,:) ~=0 ) )
        r = r + 1;
    end
end


end

