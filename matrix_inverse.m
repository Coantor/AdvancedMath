%% 此脚本计算一个矩阵的逆矩阵
rng(123);
a = rand(5,5);

%使用自带函数
inv(a)
% 使用伴随矩阵求解
Inv(a)
% 使用初等行变换求解
Inv2(a)

%% 绘制不同代码的执行时间
N = 20; %执行N次
t0 = cputime;

t= rand(N,3); %第一列是自带函数,第二列是Det,第三列是Det2

for i = 1:N
    a = rand(7);
    % 第一组
    t0 = cputime;
    inv(a);
    t1 = cputime;
    t(i,1) = t1 - t0;
    % 第二组
    t0 = cputime;
    Inv(a);
    t1 = cputime;
    t(i,2) = t1 - t0;
    % 第三组
    t0 = cputime;
    Inv2(a);
    t1 = cputime;
    t(i,3) = t1 - t0;
    
end
plot(t);

