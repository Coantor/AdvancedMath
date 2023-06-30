clc
clear
close all
%% ���ַ���ⷽ�̵ĸ�
f = @(x) x.^4 - x - 2;
% ���ӻ�
fplot(f,[-2,2],"LineWidth",1.7)
hold on
plot([-3,3],[0,0],"r:","LineWidth",1.3)
%% ���Կ�������[-2,0]��[0,2]֮����һ�����
global count;global e;
format long
count = 0;
e = 1e-10;

a = -2; b = 0;
while (b-a)>e
    x = a + (b-a)/2;
    count = count + 1;
    if sign(f(x)) == sign(f(a)) 
        a = x;
    else 
        b = x;
    end
end
x = a+(b-a)/2;
disp(["��������",count]);
disp(x);
%% �ҵڶ������
count = 0;
a = 0; b = 2;
while (b-a)>e
    x = a + (b-a)/2;
    count = count + 1;
    if  abs(f(x)) < e
        break;
    end
    if sign(f(x)) == sign(f(a))
        a = x;
    else 
        b = x;
    end
end
x = a+(b-a)/2;
disp(["��������",count]);
disp(x);





