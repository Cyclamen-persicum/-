clear
clc
%����ԭʼ����
RONres = xlsread('��Ҫ����.xlsx', 'Sheet1', 'A3:A300')';
RON = xlsread('��Ҫ����.xlsx', 'Sheet1', 'B3:B300')';
Swt = xlsread('��Ҫ����.xlsx', 'Sheet1', 'C3:C300')';
ZORB2101 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'D3:D300')';
ZORB2501 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'E3:E300')';
ZORB1001 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'F3:F300')';
ZORB1601 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'G3:G300')';
ZORB9402 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'H3:H300')';
ZORB1104 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'I3:I300')';
ZORB1203 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'J3:J300')';
ZORB2502 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'K3:K300')';
ZORB5006 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'L3:L300')';
ZORB5003 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'M3:M300')';
ZORB5101 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'N3:N300')';
ZORB2604 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'O3:O300')';
ZORB7510 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'P3:P300')';
ZORB7506 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'Q3:Q300')';
ZORB7505 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'R3:R300')';
ZORB7106 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'S3:S300')';
ZORB2703 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'T3:T300')';
ZORB6005 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'U3:U300')';
ZORB1602 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'V3:V300')';
ZORB0012 = xlsread('��Ҫ����.xlsx', 'Sheet1', 'W3:W300')';
% �������ݾ���
p = [RON; Swt; ZORB2101; ZORB2501; ZORB1001; ZORB1601; ZORB9402; ZORB1104; ZORB1203; ZORB2502; ZORB5006; ZORB5003; ZORB5101; ZORB2604;
    ZORB7510; ZORB7506; ZORB7505; ZORB7106; ZORB2703; ZORB6005; ZORB1602; ZORB0012; ];
% Ŀ�����ݾ���
t = [RONres];
% ����mapminmax���������ݽ��й�һ��
[pn, input_str] = mapminmax(p);
[tn, output_str] = mapminmax(t);

% ����BP�����磬��Ծ�һ���MATLAB�汾���°汾 newff ����ʹ�ø����һЩ
% ���Ǳ��ʺ�����û������
net = newff(pn, tn, [22 10], {'purelin', 'logsig', 'purelin'});
% 10�ֻ���ʾһ�ν��
net.trainParam.show = 10;
% ѧϰ�ٶ�Ϊ0.05
net.trainParam.lr = 0.05;
% ���ѵ������Ϊ5000��
net.trainParam.epochs = 5000;
% �������
net.trainParam.goal = 0.56 * 10^(-3);
% ��������������6�ε�����û�б仯��ѵ�������Զ���ֹ��ϵͳĬ�ϵģ�
% Ϊ���ó���������У�����������ȡ����������
net.divideFcn = '';
% ��ʼѵ��������pn,tn�ֱ�Ϊ�����������
net = train(net, pn, tn);
% ����ѵ���õ����磬����ԭʼ���ݶ�BP�������
an = sim(net, pn);

% ���ú���mapminmax�ѷ���õ������ݻ�ԭΪԭʼ��������
% �°汾�Ƽ�ѵ��������һ���ͷ���һ����ʹ�� mapminmax ����
a = mapminmax('reverse', an, output_str);
%���������ݣ�����Ԥ��
RONloss = xlsread('��Ҫ����.xlsx', 'Sheet1', 'A301:A327')';
RONnew = xlsread('��Ҫ����.xlsx', 'Sheet1', 'B301:B327')';
Swtnew = xlsread('��Ҫ����.xlsx', 'Sheet1', 'C301:C327')';
ZORB2101new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'D301:D327')';
ZORB2501new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'E301:E327')';
ZORB1001new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'F301:F327')';
ZORB1601new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'G301:G327')';
ZORB9402new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'H301:H327')';
ZORB1104new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'I301:I327')';
ZORB1203new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'J301:J327')';
ZORB2502new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'K301:K327')';
ZORB5006new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'L301:L327')';
ZORB5003new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'M301:M327')';
ZORB5101new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'N301:N327')';
ZORB2604new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'O301:O327')';
ZORB7510new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'P301:P327')';
ZORB7506new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'Q301:Q327')';
ZORB7505new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'R301:R327')';
ZORB7106new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'S301:S327')';
ZORB2703new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'T301:T327')';
ZORB6005new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'U301:U327')';
ZORB1602new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'V301:V327')';
ZORB0012new = xlsread('��Ҫ����.xlsx', 'Sheet1', 'W301:W327')';
pnew = [RONnew; Swtnew; ZORB2101new; ZORB2501new; ZORB1001new; ZORB1601new; ZORB9402new; ZORB1104new; ZORB1203new; ZORB2502new; ZORB5006new; ZORB5003new; ZORB5101new; ZORB2604new;
    ZORB7510new; ZORB7506new; ZORB7505new; ZORB7106new; ZORB2703new; ZORB6005new; ZORB1602new; ZORB0012new; ];
% ����ԭʼ�������ݵĹ�һ�������������ݽ��й�һ��
pnewn = mapminmax('apply', pnew, input_str);
% ���ù�һ��������ݽ��з���
anewn = sim(net, pnewn);
% �ѷ���õ������ݻ�ԭΪԭʼ��������
anew = mapminmax('reverse', anewn, output_str);
%ת����Ӧexcel
anewp = [anew', RONloss'];
%�������ͼ
plot(anewp, 'DisplayName', 'anewp');
