clc
clear
close all
%% ��˹��Ԫ��

% ��Ҫ����һ��,��˹��Ԫ��,��������Է�����Ļ�������,���ַ���
% �����ϴ˷����ı���,����������������еĸĽ�,��������������
global m;
m = 10;              %������������Ĵ�С
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
        end %jѭ��
        B(i) = B(i) + c*B(k);
    end % iѭ��
end%kѭ��
% disp(A)
% disp(B)

%% ͨ�������Ǿ������ Ux = B
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
disp("��ֵ�����ֵ:")
disp(x)
disp("matlab�����")
disp(A\B);
