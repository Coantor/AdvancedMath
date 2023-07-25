%% 此代码用于实现QR分解
%% step 1 生成 m * n 的矩阵A ，并且列满秩
A = rand(5,3);  %几乎都是列满秩的
Q = zeros(size(A,1)); %用于保存正交化后的向量
R = zeros(size(A)); %用于保存正交化过程中的系数
m = size(A,1);
n = size(A,2);


%% 进行施密特正交化的过程
norm_u = norm(A(:,1));
R(1,1) = norm_u;
Q(:,1) = A(:,1)/norm_u;
%正交化
for i = 2 : n
    [Q(:,i),R(:,i)] = Schmidt(A(:,i),Q(:,1:(i-1)));
end
%归一化
for i = 2:n
    norm_q = norm(Q(:,i));
    Q(:,i) = Q(:,i)/norm_q;
    R(i,:) = R(i,:) * norm_q;
end

disp("原始矩阵A")
disp(A)
disp("变换后的矩阵 Q * R")
disp(Q*R)
