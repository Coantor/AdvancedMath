%% 此代码用于实现QR分解
%% step 1 生成 m * n 的矩阵A ，并且列满秩
A = rand(6,4);  %几乎都是列满秩的
Q = eye(size(A,1)); %保存正交矩阵
R = A;
m = size(A,1);
n = size(A,2);

%% 进行Q矩阵的求解
for i = 1:n
    x = R(i:m,i);
    y = zeros(size(x,1),1);
    y(1) = norm(x);
    Qn = householder(x - y); %核心代码
    R = [R(1:(i-1),:);Qn * R(i:m,:)];
    Qm = [eye(i-1),zeros(i-1,m-i+1);zeros(m-i+1,i-1),Qn];
    Q = Qm * Q; %保存Q矩阵
end
Q = Q';
%% 对比结果
disp("原始矩阵A:")
disp(A);
% disp("QR分解结果, Q:")
% disp(Q');
% disp("R");
% disp(R);
disp("Q*R")
disp(Q *R);
