function [det0] = Det(mat)
%% ʹ������ʽ�Ķ���,���յ�һ��չ��,��������ʽ
det0 = 0;
if ( all( size(mat) == [2,2]) ) %���׾�������
    det0 = mat(1,1)*mat(2,2) - mat(1,2)*mat(2,1);
elseif ( all (size(mat) == [1,1]) ) % һ�׾�������
        det0 = mat(1,1); 
else %���ڵ������׵����
  
    for i = 1:size(mat,1)
        mat_copy = mat(:,2:size(mat,2)); % ����һ������
        mat_copy(i,:) = []; % ɾ��ĳһ��
        k = (-1)^(i + 1)*mat(i,1) * Det(mat_copy);
        det0 = det0 + k;
    end
    
end
end

