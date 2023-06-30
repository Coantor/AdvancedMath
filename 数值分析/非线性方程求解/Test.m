clc
clear
close all
%% ���庯��
f = @(x) x.^2 - 3*x + 2 - exp(x);

% ��������ͼ��
figure(1)
fplot(f,[-2,2],"LineWidth",2); hold on;
plot([-2,2],[0,0],"r--","LineWidth",2);hold off

%% ���ַ�
a =  -2;b = 2;
k = 0;
c = (a+b)/2;
while b-a > 1e-10
    k = k + 1;
    c = (a+b)/2;
    if f(c)*f(a) < 0
        b  =c;
    elseif f(c)*f(b) < 0
        a = c;
    else 
        break;
    end
end
fprintf("���ַ�����%d�Σ�x   = %f , y = %f\n",k,c,f(c));
%% �����������
g = @(x) (x.^2 + 2 - exp(x))*1/3;
x0 =1;
k = 0;
while abs(f(x0)) > 1e-10
    if x0*x0 - 3*x0 + 2 < 0
        break;
    end
    x0  = g(x0);
    k = k + 1;
     if (k > 100)
        break;
    end
end
fprintf("�����㷨����%d��,x=%d ,y =%d\n",k,x0,f(x0));

%% ţ�ٵ�����
df = @(x)  2*x - 3 - exp(x);
x0 = rand();
k = 0;
while abs(f(x0)) > 1e-10
    x0  = x0 - f(x0)/df(x0);
    k = k + 1;
     if (k > 100)
        break;
    end
end
fprintf("ţ�ٷ�����%d�Σ�x   = %f , y = %f\n",k,x0,f(x0));
