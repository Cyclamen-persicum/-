clear
clc
%��ʱ����
a = [-6.780 -0.064 -0.083 -0.00000001 -0.004 -0.13 -0.045 -0.025 0.014 0.008 0.004 -0.178 -0.011 -0.056 -0.025 0.043 -0.479 0.06 -0.076 0.004 0.023];
%Ŀ�꺯��
c = -a;
%Լ������
A = [a];
%��������
b = [-28.302];
Aeq = [];
beq = [];
vlb = [2.25, 20, 350, 150000, 50, 35, 3, 100, 50, 20, 450, 0, 0, 0, 3, -2.5, -2, 400, 0.2, 90, 40];
vub = [2.55, 55, 400, 55000000, 400, 55, 35, 150, 100, 80, 550, 3.5, 40, 16, 80, 1.0, 0, 420, 2.2, 550, 145];
[x, fval] = linprog(c, A, b, Aeq, beq, vlb, vub);
fval = -fval + 117.702
