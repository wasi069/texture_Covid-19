clear all
clc
close all
%AUC Calclulation
TP =33;
TN=29;
FP=3;
FN=7;
TPR= TP/(TP+FN);
FPR = FP/(FP+TN);
X = [0;TPR;1];
Y = [0;FPR;1];
AUC = trapz(Y,X) 
%DUMMY PLOTING
X = [0:0.01:1];
Y = [0;FPR;1]

plot(Y,X)