 clear all
 clc
 close all
normal=load('normal_MBC_patch_database.mat');%
covid=load('covid_MBC_patch_database.mat');%

combine_normal=normal.Features.MBC;
[r,c]=size(combine_normal);
one=ones(r,1);%adding annotation to non-covid
combine_normal=[one,combine_normal];
combine_covid=covid.Features.MBC;
[r1,c1]=size(combine_covid);
two=2*ones(r1,1);
combine_covid=[two,combine_covid];
train=[combine_normal;combine_covid];
classificationLearner