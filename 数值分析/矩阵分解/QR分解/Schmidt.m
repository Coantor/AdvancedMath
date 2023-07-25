function [u,r] = Schmidt(v,U) 
%% �����һ���Ǵ�����������,�ڶ������Ѿ������׼����������
if size(v,1) ~= size(U,1) 
    error("�����ʽ��������")
end
n = size(v,1); 
k = size(U,2) ; %�Ѿ������׼����������
u = v; %��ʼ��u
r = zeros(n,1);
r(k+1) = 1;
for i = 1:k
    r(i) = sum(v.*U(:,i))/sum(U(:,i).*U(:,i));
    u = u - ( r(i) * U(:,i) );
end

end

