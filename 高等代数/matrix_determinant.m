%% �˽ű�ʵ������ʽ����ֵ����
rng(212);
a = rand(9,9);


det(a) % ʹ���Դ��ĺ���
Det(a) % ʹ�õݹ鶨�����
Det2(a) %ʹ�ó��ȱ任���

%% ���Ʋ�ͬ�����ִ��ʱ��
N = 20; %ִ��N��
t0 = cputime;

t= rand(N,3); %��һ�����Դ�����,�ڶ�����Det,��������Det2

for i = 1:N
    a = rand(9,9);
    % ��һ��
    t0 = cputime;
    det(a);
    t1 = cputime;
    t(i,1) = t1 - t0;
    % �ڶ���
    t0 = cputime;
    Det(a);
    t1 = cputime;
    t(i,2) = t1 - t0;
    % ������
    t0 = cputime;
    Det2(a);
    t1 = cputime;
    t(i,3) = t1 - t0;
    
end
plot(t);

