clc
clear
close all
%% Cholesky�ֽ�(������������) A = L'*L,LΪ�����Ǿ���
global m; 
m = 3;
A = [5,-1,-1;-1,3,-1;-1,-1,5];
L = A;
disp("��������:");
disp(A);
%% ���Ĵ���
for j = 1:m
    for k = 1:j-1
        L(j,j) = L(j,j) - L(j,k)^2;
    end
    L(j,j) = sqrt(L(j,j));
    
    for i = j+1:m
        for k = 1:j-1
            L(i,j) = L(i,j)-L(i,k)*L(j,k);
        end
        L(i,j) = L(i,j)/L(j,j);
    end
    
end
L = tril(L);
disp("�ֽ��ľ���, L");
disp(L);

