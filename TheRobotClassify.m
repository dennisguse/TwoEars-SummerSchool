function [result] = TheRobotClassify(earSignal, fsHz)
%Input mono recorded signal and sampling rate
%
load('features.mat');

% FeaturesTrumpet=FeaturesTrumpet;
% FeaturesFemale= FeaturesFemale;
% Featuresmale=Featuresmale;

dObj = dataObject(earSignal,fsHz);
requests = {'spectralFeatures'};

% Parameters of Gammatone processor
fb_nChannels  = 64;  
fb_lowFreqHz  = 200;
fb_highFreqHz = 8000;

% Parameters of innerhaircell processor
ihc_method    = 'dau';

% Parameters of ratemap processor
rm_wSizeSec  = 0.02;
rm_hSizeSec  = 0.01;
rm_scaling   = 'power';
rm_decaySec  = 8E-3;
rm_wname     = 'hann';



% Parameters 
par = genParStruct('fb_lowFreqHz',fb_lowFreqHz,'fb_highFreqHz',fb_highFreqHz,...
                   'fb_nChannels',fb_nChannels,'ihc_method',ihc_method,...
                   'ac_wSizeSec',rm_wSizeSec,'ac_hSizeSec',rm_hSizeSec,...
                   'rm_scaling',rm_scaling,'rm_decaySec',rm_decaySec,...
                   'ac_wname',rm_wname); 

               
%% PERFORM PROCESSING
% 
%                
% Create a manager
mObj = manager(dObj,requests,par);
mObj.processSignal();

FeaturesSrc=median(dObj.spectralFeatures{1,1}.Data(1:end,:));







distTrumpet = sqrt(sum((FeaturesSrc-FeaturesTrumpet).^2));

distMale = sqrt(sum((FeaturesSrc-Featuresmale).^2));

distFemale= sqrt(sum((FeaturesSrc-FeaturesFemale).^2));


if distTrumpet <= distMale && distTrumpet <=distFemale
    result=  'Trumpet';
    
else if distFemale <= distMale && distFemale <= distTrumpet
    result =  'Female';
else
   result = 'Male'  ;
end  




end

