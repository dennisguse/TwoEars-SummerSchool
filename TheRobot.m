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

rooms  = {[1.665, -2.114], [3.247, -0.752], [3.9, 1.14]}; %Center of each room: [x, y]

%% Driving algorithm
for currentRoomIndex=1:length(rooms)
    clientMoving.moveAbsolutePosition('map', rooms{currentRoomIndex}(1), rooms{currentRoomIndex}(2), 0.0);
    
    clientMoving.moveRelativePosition('map', 0.0, 0.0, 90);
    clientMoving.moveRelativePosition('map', 0.0, 0.0, 90);
    clientMoving.moveRelativePosition('map', 0.0, 0.0, 90);
    
    %%
    
end
disp 'MUIHAHAHAAHAHAH'