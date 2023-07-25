function [u,r] = Schmidt(v,U) 
%% 输入第一个是待正交的向量,第二个是已经做完标准化的向量组
if size(v,1) ~= size(U,1) 
    error("矩阵格式输入有误")
end
n = size(v,1); 
k = size(U,2) ; %已经做完标准化的向量组
u = v; %初始化u
r = zeros(n,1);
r(k+1) = 1;
for i = 1:k
    r(i) = sum(v.*U(:,i))/sum(U(:,i).*U(:,i));
    u = u - ( r(i) * U(:,i) );
end

end

