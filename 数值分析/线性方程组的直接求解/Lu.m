clc
clear
close all
%% LU分解-- 利用高斯消去法进行求解

A = [1,2,2;4,4,2;4,6,4];
n = size(A,1);
L = eye(n);
U = A;
%% 先求U矩阵
for k = 1:n-1
    if U(k,k) ==0 
        break;
    end
    for i = k+1:n
        c = -U(i,k)/U(k,k);
        L(i,k) = -c;
        for j = 1:n
            U(i,j) = U(i,j) + c*U(k,j);
        end
    end
end
disp("上三角矩阵,L");
disp(L);
disp("下三角矩阵,U");
disp(U);





