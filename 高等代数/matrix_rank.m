%% �˽ű����ڼ���������,�������������
a = rand(3,4);
a = [a,ones(3,3),2 * ones(3,2)];
a = [a;ones(2,9)];

rank(a)
[mat,r ] = Calc_rank(a);