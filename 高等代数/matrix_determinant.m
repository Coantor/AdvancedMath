%% 此脚本实现行列式的求值功能
rng(212);
a = rand(9,9);


det(a) % 使用自带的函数
Det(a) % 使用递归定义求解
Det2(a) %使用初等变换求解

%% 绘制不同代码的执行时间
N = 20; %执行N次
t0 = cputime;

t= rand(N,3); %第一列是自带函数,第二列是Det,第三列是Det2

for i = 1:N
    a = rand(9,9);
    % 第一组
    t0 = cputime;
    det(a);
    t1 = cputime;
    t(i,1) = t1 - t0;
    % 第二组
    t0 = cputime;
    Det(a);
    t1 = cputime;
    t(i,2) = t1 - t0;
    % 第三组
    t0 = cputime;
    Det2(a);
    t1 = cputime;
    t(i,3) = t1 - t0;
    
end
plot(t);

