%% �˽ű�����һ������������
rng(123);
a = rand(5,5);

%ʹ���Դ�����
inv(a)
% ʹ�ð���������
Inv(a)
% ʹ�ó����б任���
Inv2(a)

%% ���Ʋ�ͬ�����ִ��ʱ��
N = 20; %ִ��N��
t0 = cputime;

t= rand(N,3); %��һ�����Դ�����,�ڶ�����Det,��������Det2

for i = 1:N
    a = rand(7);
    % ��һ��
    t0 = cputime;
    inv(a);
    t1 = cputime;
    t(i,1) = t1 - t0;
    % �ڶ���
    t0 = cputime;
    Inv(a);
    t1 = cputime;
    t(i,2) = t1 - t0;
    % ������
    t0 = cputime;
    Inv2(a);
    t1 = cputime;
    t(i,3) = t1 - t0;
    
end
plot(t);

