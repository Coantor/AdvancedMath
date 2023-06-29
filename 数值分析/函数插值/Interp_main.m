clc
clear
close all
%% ��ʼ��
f = @(x)1./(1+x.^2);          % ���庯�����
df = @(x)-2*x./(1+x.^2).^2;
figure(1)
fplot(f,"LineWidth",1.4);
grid on
title("����ֵ����ͼ��[-5,5]");

x1 = linspace(-5,5,20);
xx = linspace(-5+0.01,5-0.01,100);

%% ��ֵ���

% �������ղ�ֵ
mod1 = Lagrange_Interp(x1,f(x1));
mod1.plot(xx,f(xx),2);
% ���Բ�ֵ
mod2 = Linear_Interp(x1,f(x1));
mod2.plot(xx,f(xx),3);
% ţ�ٲ�ֵ
mod3 = Newton_Interp(x1,f(x1));
mod3.plot(xx,f(xx),4);
% ����������ֵ
mod4 = Spline_Interp(x1,f(x1));
mod4.plot(xx,f(xx),5);
% Hermite��ֵ
mod5 = Hermite_Interp(x1,f(x1),df(x1));
mod5.plot(xx,f(xx),6);

s = spline(x1,f(x1));