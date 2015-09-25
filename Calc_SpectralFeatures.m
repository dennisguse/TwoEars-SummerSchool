clear;
close all
clc

startAuditoryFrontEnd()

%% LOAD SIGNAL
% 
% 
% Load a signal
[earSignals, fsHz] = audioread('trumpet.wav');

% Create a data object based on parts of the right ear signal
dObj = dataObject(earSignals(1:round(length(earSignals)/4)),fsHz);


%% PLACE REQUEST AND CONTROL PARAMETERS
% 
% 
% Request spectral feature processor
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

sf_requests = {'centroid', 'rolloff'};

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

% Request processing
mObj.processSignal();


%% PLOT RESULTS
% 
% 
% Plot time domain signal
dObj.time{1}.plot

% Handle to the ratemap for plot overlay
rmap = dObj.ratemap{1};   

% Plot spectral features
dObj.spectralFeatures{1}.plot([],[],'overlay',rmap,'noSubPlots',1);
FeaturesTrumpet=median(dObj.spectralFeatures{1,1}.Data(1:end,:));
close all;

[earSignals, fsHz] = audioread('male.wav');

% Create a data object based on parts of the right ear signal
dObj = dataObject(earSignals(1:round(length(earSignals)/4)),fsHz);


%% PLACE REQUEST AND CONTROL PARAMETERS
% 
% 
% Request spectral feature processor


               
%% PERFORM PROCESSING
% 
%                
% Create a manager
mObj = manager(dObj,requests,par);

% Request processing
mObj.processSignal();


%% PLOT RESULTS
% 
% 
% Plot time domain signal
dObj.time{1}.plot

% Handle to the ratemap for plot overlay
rmap = dObj.ratemap{1};   

% Plot spectral features
dObj.spectralFeatures{1}.plot([],[],'overlay',rmap,'noSubPlots',1);
Featuresmale=median(dObj.spectralFeatures{1,1}.Data(1:end,:));

close all;
[earSignals, fsHz] = audioread('female.wav');

% Create a data object based on parts of the right ear signal
dObj = dataObject(earSignals(1:round(length(earSignals)/4)),fsHz);


%% PLACE REQUEST AND CONTROL PARAMETERS
% 
% 
% Request spectral feature processor
requests = {'spectralFeatures'};



               
%% PERFORM PROCESSING
% 
%                
% Create a manager
mObj = manager(dObj,requests,par);

% Request processing
mObj.processSignal();


%% PLOT RESULTS
% 
% 
% Plot time domain signal
dObj.time{1}.plot

% Handle to the ratemap for plot overlay
rmap = dObj.ratemap{1};   

% Plot spectral features
dObj.spectralFeatures{1}.plot([],[],'overlay',rmap,'noSubPlots',1);
FeaturesFemale=median(dObj.spectralFeatures{1,1}.Data(1:end,:));

save('Features.mat','FeaturesFemale','Featuresmale','FeaturesTrumpet');
