clc
clear
close all
%% 高斯消元法

% 简要介绍一下,高斯消元法,是求解线性方程组的基本方法,各种方法
% 基本上此方法的变形,或者针对特殊矩阵进行的改进,这里假设矩阵奇异
global m;
m = 10;              %用来条件矩阵的大小
A = rand(m,m);
B = rand(m,1);
n = size(A,1);
for k = 1:n-1
    if A(k,k) == 0
        continue;
    end
    for i = k+1:n
        c = -A(i,k)/A(k,k);
        for j = 1:n
            A(i,j) = A(i,j) + c*A(k,j);
        end %j循环
        B(i) = B(i) + c*B(k);
    end % i循环
end%k循环
% disp(A)
% disp(B)

%% 通过上三角矩阵计算 Ux = B
x = zeros(n,1);
for k = n:-1:1
    if A(k,k) == 0
        continue;
    end
    if k == n
        x(k) = B(k)/A(k,k);
    else
        s = 0;
        for i = k+1:n
            s = s + A(k,i)*x(i);
        end
        x(k) = (B(k)-s)/A(k,k);
    end
end
disp("数值计算的值:")
disp(x)
disp("matlab的求解")
disp(A\B);
