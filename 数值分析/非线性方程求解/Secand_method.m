clc
clear
close all
%% ���߷�(����ţ�ٷ��ĸĽ�)
% ����ţ�ٷ���Ҫ���㵼��
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

fprintf("��Ҫ%d��,��ʱx = %f,f(x) = %f\n",k,x(k),f(x(k)));
% ���߷������˵����ļ���,�Ҿ��г����Ե�����,������Ҫ������ʼֵ
