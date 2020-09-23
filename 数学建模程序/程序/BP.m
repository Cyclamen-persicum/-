clear
clc
%导入原始数据
RONres = xlsread('主要变量.xlsx', 'Sheet1', 'A3:A300')';
RON = xlsread('主要变量.xlsx', 'Sheet1', 'B3:B300')';
Swt = xlsread('主要变量.xlsx', 'Sheet1', 'C3:C300')';
ZORB2101 = xlsread('主要变量.xlsx', 'Sheet1', 'D3:D300')';
ZORB2501 = xlsread('主要变量.xlsx', 'Sheet1', 'E3:E300')';
ZORB1001 = xlsread('主要变量.xlsx', 'Sheet1', 'F3:F300')';
ZORB1601 = xlsread('主要变量.xlsx', 'Sheet1', 'G3:G300')';
ZORB9402 = xlsread('主要变量.xlsx', 'Sheet1', 'H3:H300')';
ZORB1104 = xlsread('主要变量.xlsx', 'Sheet1', 'I3:I300')';
ZORB1203 = xlsread('主要变量.xlsx', 'Sheet1', 'J3:J300')';
ZORB2502 = xlsread('主要变量.xlsx', 'Sheet1', 'K3:K300')';
ZORB5006 = xlsread('主要变量.xlsx', 'Sheet1', 'L3:L300')';
ZORB5003 = xlsread('主要变量.xlsx', 'Sheet1', 'M3:M300')';
ZORB5101 = xlsread('主要变量.xlsx', 'Sheet1', 'N3:N300')';
ZORB2604 = xlsread('主要变量.xlsx', 'Sheet1', 'O3:O300')';
ZORB7510 = xlsread('主要变量.xlsx', 'Sheet1', 'P3:P300')';
ZORB7506 = xlsread('主要变量.xlsx', 'Sheet1', 'Q3:Q300')';
ZORB7505 = xlsread('主要变量.xlsx', 'Sheet1', 'R3:R300')';
ZORB7106 = xlsread('主要变量.xlsx', 'Sheet1', 'S3:S300')';
ZORB2703 = xlsread('主要变量.xlsx', 'Sheet1', 'T3:T300')';
ZORB6005 = xlsread('主要变量.xlsx', 'Sheet1', 'U3:U300')';
ZORB1602 = xlsread('主要变量.xlsx', 'Sheet1', 'V3:V300')';
ZORB0012 = xlsread('主要变量.xlsx', 'Sheet1', 'W3:W300')';
% 输入数据矩阵
p = [RON; Swt; ZORB2101; ZORB2501; ZORB1001; ZORB1601; ZORB9402; ZORB1104; ZORB1203; ZORB2502; ZORB5006; ZORB5003; ZORB5101; ZORB2604;
    ZORB7510; ZORB7506; ZORB7505; ZORB7106; ZORB2703; ZORB6005; ZORB1602; ZORB0012; ];
% 目标数据矩阵
t = [RONres];
% 利用mapminmax函数对数据进行归一化
[pn, input_str] = mapminmax(p);
[tn, output_str] = mapminmax(t);

% 建立BP神经网络，相对旧一点的MATLAB版本，新版本 newff 函数使用更简洁一些
% 但是本质和性能没有区别
net = newff(pn, tn, [22 10], {'purelin', 'logsig', 'purelin'});
% 10轮回显示一次结果
net.trainParam.show = 10;
% 学习速度为0.05
net.trainParam.lr = 0.05;
% 最大训练次数为5000次
net.trainParam.epochs = 5000;
% 均方误差
net.trainParam.goal = 0.56 * 10^(-3);
% 网络误差如果连续6次迭代都没有变化，训练将会自动终止（系统默认的）
% 为了让程序继续运行，用以下命令取消这条设置
net.divideFcn = '';
% 开始训练，其中pn,tn分别为输入输出样本
net = train(net, pn, tn);
% 利用训练好的网络，基于原始数据对BP网络仿真
an = sim(net, pn);

% 利用函数mapminmax把仿真得到的数据还原为原始的数量级
% 新版本推荐训练样本归一化和反归一化都使用 mapminmax 函数
a = mapminmax('reverse', an, output_str);
%导入新数据，便于预测
RONloss = xlsread('主要变量.xlsx', 'Sheet1', 'A301:A327')';
RONnew = xlsread('主要变量.xlsx', 'Sheet1', 'B301:B327')';
Swtnew = xlsread('主要变量.xlsx', 'Sheet1', 'C301:C327')';
ZORB2101new = xlsread('主要变量.xlsx', 'Sheet1', 'D301:D327')';
ZORB2501new = xlsread('主要变量.xlsx', 'Sheet1', 'E301:E327')';
ZORB1001new = xlsread('主要变量.xlsx', 'Sheet1', 'F301:F327')';
ZORB1601new = xlsread('主要变量.xlsx', 'Sheet1', 'G301:G327')';
ZORB9402new = xlsread('主要变量.xlsx', 'Sheet1', 'H301:H327')';
ZORB1104new = xlsread('主要变量.xlsx', 'Sheet1', 'I301:I327')';
ZORB1203new = xlsread('主要变量.xlsx', 'Sheet1', 'J301:J327')';
ZORB2502new = xlsread('主要变量.xlsx', 'Sheet1', 'K301:K327')';
ZORB5006new = xlsread('主要变量.xlsx', 'Sheet1', 'L301:L327')';
ZORB5003new = xlsread('主要变量.xlsx', 'Sheet1', 'M301:M327')';
ZORB5101new = xlsread('主要变量.xlsx', 'Sheet1', 'N301:N327')';
ZORB2604new = xlsread('主要变量.xlsx', 'Sheet1', 'O301:O327')';
ZORB7510new = xlsread('主要变量.xlsx', 'Sheet1', 'P301:P327')';
ZORB7506new = xlsread('主要变量.xlsx', 'Sheet1', 'Q301:Q327')';
ZORB7505new = xlsread('主要变量.xlsx', 'Sheet1', 'R301:R327')';
ZORB7106new = xlsread('主要变量.xlsx', 'Sheet1', 'S301:S327')';
ZORB2703new = xlsread('主要变量.xlsx', 'Sheet1', 'T301:T327')';
ZORB6005new = xlsread('主要变量.xlsx', 'Sheet1', 'U301:U327')';
ZORB1602new = xlsread('主要变量.xlsx', 'Sheet1', 'V301:V327')';
ZORB0012new = xlsread('主要变量.xlsx', 'Sheet1', 'W301:W327')';
pnew = [RONnew; Swtnew; ZORB2101new; ZORB2501new; ZORB1001new; ZORB1601new; ZORB9402new; ZORB1104new; ZORB1203new; ZORB2502new; ZORB5006new; ZORB5003new; ZORB5101new; ZORB2604new;
    ZORB7510new; ZORB7506new; ZORB7505new; ZORB7106new; ZORB2703new; ZORB6005new; ZORB1602new; ZORB0012new; ];
% 利用原始输入数据的归一化参数对新数据进行归一化
pnewn = mapminmax('apply', pnew, input_str);
% 利用归一化后的数据进行仿真
anewn = sim(net, pnewn);
% 把仿真得到的数据还原为原始的数量级
anew = mapminmax('reverse', anewn, output_str);
%转置适应excel
anewp = [anew', RONloss'];
%绘制误差图
plot(anewp, 'DisplayName', 'anewp');
