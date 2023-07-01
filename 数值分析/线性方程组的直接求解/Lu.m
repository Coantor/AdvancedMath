clc
clear
close all
%% LU�ֽ�-- ���ø�˹��ȥ���������

A = [1,2,2;4,4,2;4,6,4];
n = size(A,1);
L = eye(n);
U = A;
%% ����U����
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
disp("�����Ǿ���,L");
disp(L);
disp("�����Ǿ���,U");
disp(U);





