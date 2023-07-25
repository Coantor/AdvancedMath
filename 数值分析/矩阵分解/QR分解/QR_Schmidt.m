%% �˴�������ʵ��QR�ֽ�
%% step 1 ���� m * n �ľ���A ������������
A = rand(5,3);  %�������������ȵ�
Q = zeros(size(A,1)); %���ڱ����������������
R = zeros(size(A)); %���ڱ��������������е�ϵ��
m = size(A,1);
n = size(A,2);


%% ����ʩ�����������Ĺ���
norm_u = norm(A(:,1));
R(1,1) = norm_u;
Q(:,1) = A(:,1)/norm_u;
%������
for i = 2 : n
    [Q(:,i),R(:,i)] = Schmidt(A(:,i),Q(:,1:(i-1)));
end
%��һ��
for i = 2:n
    norm_q = norm(Q(:,i));
    Q(:,i) = Q(:,i)/norm_q;
    R(i,:) = R(i,:) * norm_q;
end

disp("ԭʼ����A")
disp(A)
disp("�任��ľ��� Q * R")
disp(Q*R)
