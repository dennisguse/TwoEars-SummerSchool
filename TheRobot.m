%%OUR constants!
SAMPLING_RATE = 24414;
FRAME_SIZE = 4096;

addpath('~/openrobots/lib/matlab')
addpath('~/twoears/TwoEars-SummerSchool')


%%Connect to robot and get audio and drive services
client = genomix.client('turtlebot3-wifi:8080')

bass = client.load('bass')
bass.Acquire('-a', SAMPLING_RATE, FRAME_SIZE, 20)
clientMoving = client.load('sendPosition')


binauloc = client.load('binauloc')
binauloc.connect_port('Audio', 'bass/Audio')
binauloc.Setup('/home/turtlebot/genom3/activeloc/data/setup', ... % just a file to write parameters in (please do not change)
    24414, ... % the sample rate
    5000, ... % the maximum frequency
    1024, ... % the number of samples per frame (here a frame is a block of audio)
    512, ... % the overlap between two frames
    '::localization::HANNING', ... % the window function
    10, ... % contributes to the smoothing of the pseudo-likelihood
    '/home/turtlebot/genom3/activeloc/data/projector', ... % another file to write data in  (please do not change)
    '/home/turtlebot/genom3/activeloc/data/noise') % yet another file to write data in  (please do not change)

%%
disp 'Learning Noise - press key to continue'
w = waitforbuttonpress;
binauloc.LearnNoise(2) % 2 seconds
binauloc.PretabProj('/home/turtlebot/genom3/activeloc/steerVecs/steerVecS72')
binauloc.LocalizeSources('-a', 1, 1, 4)

%%
rooms  = {[1.665, -2.114], [3.247, -0.752], [3.9, 1.14]}; %Center of each room: [x, y]

%% Driving algorithm
for currentRoomIndex=1:length(rooms)
    %Go to room
    TheRobotGo(clientMoving, rooms{currentRoomIndex}(1), rooms{currentRoomIndex}(2), 0.0, false)    
    
    %%Sample signal
    
    estimation = TheRobotSampleAzimuth(clientMoving, binauloc);
    
    TheRobot
end
disp 'MUIHAHAHAAHAHAH'