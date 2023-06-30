clc
clear
close all
%% 二分法求解方程的根
f = @(x) x.^4 - x - 2;
% 可视化
fplot(f,[-2,2],"LineWidth",1.7)
hold on
plot([-3,3],[0,0],"r:","LineWidth",1.3)
%% 可以看到根在[-2,0]与[0,2]之间有一个零点
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
disp(["迭代次数",count]);
disp(x);
%% 找第二个零点
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
disp(["迭代次数",count]);
disp(x);





