clc
clear
close all
%% 初始化
f = @(x)1./(1+x.^2);          % 定义函数句柄
df = @(x)-2*x./(1+x.^2).^2;
figure(1)
fplot(f,"LineWidth",1.4);
grid on
title("被插值函数图像[-5,5]");

x1 = linspace(-5,5,20);
xx = linspace(-5+0.01,5-0.01,100);

%% 插值结果

% 拉格朗日插值
mod1 = Lagrange_Interp(x1,f(x1));
mod1.plot(xx,f(xx),2);
% 线性插值
mod2 = Linear_Interp(x1,f(x1));
mod2.plot(xx,f(xx),3);
% 牛顿插值
mod3 = Newton_Interp(x1,f(x1));
mod3.plot(xx,f(xx),4);
% 三次样条插值
mod4 = Spline_Interp(x1,f(x1));
mod4.plot(xx,f(xx),5);
% Hermite插值
mod5 = Hermite_Interp(x1,f(x1),df(x1));
mod5.plot(xx,f(xx),6);

s = spline(x1,f(x1));