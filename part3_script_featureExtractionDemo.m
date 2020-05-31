 %clear all
 clc
 close all
test_normal=load('normal_MBC_testing.mat');
test_covid=load('Covid_MBC_testing.mat');
combine_normal=test_normal.Features.MBC;
combine_covid=test_covid.Features.MBC;
[r,c]=size(combine_normal);
k=1;
true_positive=0;
false_positve=0;
while(k<=r)%testing normal
    test_image=combine_normal(k,:);
    
    yfit = trainedModel.predictFcn(test_image);
    if yfit==1 % means normal
       
       true_positive=true_positive+1;
   else 
       false_positve=false_positve+1;
    end
   k=k+1;
end
k=1;
true_negative=0;
false_negative=0;
while(k<=r)%testing normal
    test_image=combine_covid(k,:);
    
    yfit = trainedModel.predictFcn(test_image);
    if yfit==2 % means normal
       
       true_negative=true_negative+1;
   else 
      false_negative=false_negative+1;
    end
   k=k+1;
end

% formula to calcute statictial results
accuracy=((true_positive+true_negative)/(true_positive+true_negative+false_negative+false_positve))
%Sensitivity=TP/(TP+FN)
Sensitivity=true_positive/(true_positive+false_negative);
%Specificity=TN/(TN+FP)
Specificity=true_negative/(true_negative+false_positve);
% kappa caclualtion
%Po = (TP + TN) / (TP + TN + FP + FN),
%Pe = ((TP + FN) * (TP + FP) + (FP + TN) * (FN + TN)) / (TP + TN + FP + FN)^2
%Kappa = (Po - Pe) / (1 - Pe)
po=((true_positive+true_negative)/(true_positive+true_negative+false_negative+false_positve));
pe=((true_positive+false_negative)*(true_positive+false_positve)+(false_positve+true_negative)*(false_negative+true_negative))/(true_positive+true_negative+false_negative+false_positve)^2;
kappa=(po-pe)/(1-pe);
