clc
clear
x=1:204;
%y=1145140./x;
y=xlsread('���Թ滮.xlsx','Sheet2','B1:B204')';
plot(x,y);