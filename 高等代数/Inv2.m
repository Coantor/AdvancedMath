function [inv_mat] = Inv2(mat)
%ʹ�ó����б任��������
%   �˴���ʾ��ϸ˵��
n = size(mat,1); %��¼����Ĺ��
M = [mat,eye(n)];  % ��¼��Ҫ���г��ȱ任�ľ���

for i = 1:n
     if ( M(i,i) == 0 ) 
        %�ҵ���Ϊ0��Ԫ��,��������
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
        % ʹ�õڶ�������б任
        M(i,i:2*n) = M(i,i:2*n)/M(i,i); 

        % �����Ϊ0,��ʹ�õ�������ȱ任
        for j = (i+1):n
            M(j,i:2*n) = M(j,i:2*n) - M(j,i) * M(i,i:2*n); %��������ȱ任
        end
    
    end
end
    %% ��ʱ�õ��Խ����϶���1�������Ǿ���
    if  prod(diag(M))== 0
        error("���󲻿���");
    end
    
    %k��ʾ�� k ����Ϊ��Ԫ��, j��ʾ��Ҫ����Ԫ����,j<k
    for k = n:-1:2
        for j = (k-1):-1:1
            M(j,:) = M(j,:) - M(j,k) * M(k,:);
        end
        
    end
    
inv_mat = M(:,(n+1):2*n); %���������

end

