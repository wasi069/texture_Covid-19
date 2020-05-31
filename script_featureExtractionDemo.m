%
%   Example:
%       option.gridHist = [2,4];
%       options.mode = 'nh';
%       options.t = 11;
%       feaHist = desc_GLTP(img,options)
%
close all
clear all
clc
addpath('descFuncs');
addpath('sideFuncs');
descList = {'BPPC','GDP','GDP2','GLTP','IWBC',...
            'LAP','LBP','LDiP','LDiPv','LDN',...
            'LDTP','LFD','LGBPHS','LGDiP','LGIP',...
            'LGP','LGTrP','LMP','LPQ','LTeP',...
            'LTrP','MBC','MBP','MRELBP','MTP',...
            'mWLD','PHOG'};
options.gridHist = 1;
imList = dir('./images/im*.tif');
Features = struct;
for de =1%1:length(descList)  % 27
    desc = descList{de};
    descFunc = str2func(['desc_' desc]); display(char(descFunc));
    Features.(desc) = [];
    for im = 1 %: length(imList)
        display(char(num2str(im)))
        imName = ['./images/' imList(im).name];
        img = imread(imName);
        [feaIns, imgDesc] = descFunc(double(img),options);
        Features.(desc) = vertcat(Features.(desc),feaIns);
    end
end