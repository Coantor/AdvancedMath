%% �˴�������ʵ��QR�ֽ�
%% step 1 ���� m * n �ľ���A ������������
A = rand(6,4);  %�������������ȵ�
Q = eye(size(A,1)); %������������
R = A;
m = size(A,1);
n = size(A,2);

%% ����Q��������
for i = 1:n
    x = R(i:m,i);
    y = zeros(size(x,1),1);
    y(1) = norm(x);
    Qn = householder(x - y); %���Ĵ���
    R = [R(1:(i-1),:);Qn * R(i:m,:)];
    Qm = [eye(i-1),zeros(i-1,m-i+1);zeros(m-i+1,i-1),Qn];
    Q = Qm * Q; %����Q����
end
Q = Q';
%% �ԱȽ��
disp("ԭʼ����A:")
disp(A);
% disp("QR�ֽ���, Q:")
% disp(Q');
% disp("R");
% disp(R);
disp("Q*R")
disp(Q *R);
