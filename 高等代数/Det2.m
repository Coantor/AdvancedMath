function [det0] = Det2(mat)
%% ʹ�ó����б任,ת��Ϊ�ԽǾ���
det0 = 1;
n = size(mat,1);
for i = 1:n
    %�����i�е�һ��Ԫ��Ϊ0,��ʹ�õ�һ������б任
    if ( mat(i,i) == 0 ) 
        %�ҵ���Ϊ0��Ԫ��,��������
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
    
    % ���ֲ�Ϊ0,����ִ��,����������һ�н��м���
    if mat(i,i) ~= 0
        % ʹ�õڶ�������б任
        det0 = det0 * mat(i,i);
        mat(i,i:n) = mat(i,i:n)/mat(i,i); %�Ե�i�н��й�һ��

        % �����Ϊ0,��ʹ�õ�������ȱ任�����ı���������ʽ

        for j = (i+1):n
            mat(j,i:n) = mat(j,i:n) - mat(j,i) * mat(i,i:n); %��������ȱ任
        end
    end
    
    
end
    det0 = det0 * prod(diag(mat)); %�ؼ�һ��
end

