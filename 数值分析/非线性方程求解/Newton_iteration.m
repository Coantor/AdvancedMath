clc
clear 
close all
%% ţ�ٵ�����
f = @(x) x.^4 - x - 2;
df = @(x) 4*x.^3 -1;
e = 1e-10;
x = zeros(1,30);
k = 1; x(1) =0;
while abs(f(x(k))) > e

    x(k+1) = x(k) - f(x(k))/df(x(k));
    k = k + 1;
    
end
figure (1)
plot(x(1:k),"*:","LineWidth",1.5);
disp(f(x(k)));

fprintf("��Ҫ%d��,��ʱx = %f,f(x) = %f\n",k,x(k),f(x(k)));

%% ţ�ٵ����������ٶȼ���
g = @(x) x.^2 - 2;
dg = @(x) 2*x;
y = zeros(1,30); k = 1;
y(1) = 100;
while abs(g(y(k))) > e
    y(k+1) =  y(k) - g(y(k))/dg(y(k));
    k = k + 1;
end    

figure (2)
plot(y(1:k),"*:","LineWidth",1.5);
disp(g(y(k)));  
fprintf("��Ҫ%d��,��ʱx = %f,f(x) = %f\n",k,y(k),g(y(k)));