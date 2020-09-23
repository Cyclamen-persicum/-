clc
clear
x=1:204;
%y=1145140./x;
y=xlsread('线性规划.xlsx','Sheet2','B1:B204')';
plot(x,y);