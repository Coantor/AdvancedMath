clc
clear
close all
%% 割线法(对于牛顿法的改进)
% 由于牛顿法需要计算导数
f = @(x) x.^4 - x - 2;

x = zeros(1,30); 
x(1) =0.4;
x(2) = 10;
e = 1e-10;
k = 2;
while abs(f(x(k))) > e
    x(k+1) = x(k) - f(x(k))/(f(x(k)) - f(x(k-1))) *(x(k) - x(k-1));
    k = k+1;
end
figure (1)
plot(x(1:k),"*:","LineWidth",1.5);
disp(f(x(k)));

fprintf("需要%d次,此时x = %f,f(x) = %f\n",k,x(k),f(x(k)));
% 割线法避免了导数的计算,且具有超线性的性质,但是需要两个初始值
