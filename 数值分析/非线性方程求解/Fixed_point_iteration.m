clc
clear 
close all
%% �����������
f = @(x) x.^4 -x - 2;
figure (1)
fplot(f,[0.3,1.6],"LineWidth",2);
hold on
plot([0,2],[0,0],"r:","LineWidth",1.5)
x =zeros(1,30);
x(1) = 1.5;
k = 1;
while abs(f(x)) > 1e-10
    k = k +1;
    x(k) = (x(k-1)+2)^(1/4);
end
figure (2)
plot(x(1:k),"*:","LineWidth",1.5);
xx = fzero(f,1);
hold on
plot(1:k,ones(1,k)*xx,"r:","LineWidth",1.5)
%% ȫ������������ 1) a<f(x)<b; 2) L = [0,1]
% ����ȫ����������̫ǿ��,����ʹ�þֲ���������




