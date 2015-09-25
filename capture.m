%%OUR constants!
SAMPLING_RATE = 24414;
addpath('~/openrobots/lib/matlab')
addpath('~/twoears/TwoEars-SummerSchool')


%% Connect to audio device
client = genomix.client('turtlebot3-wifi:8080')
bass = client.load('bass')
bass.Acquire('-a', SAMPLING_RATE, 4096, 20)


pause(2);

%% Demo for audio aquisition
nfr = 0;
%while(true) %Endless ><
%for i = 0:1
%audio = bass.Audio();
[block, nfr] = getBlockOfAudio(bass,SAMPLING_RATE * 10,nfr);

   % [n, loss, l, r, nfr] = getAudioData(4096, audio.Audio(),nfr);
    
    %%%%%Do some fancy shit here ^^
    %soundsc(block.left, SAMPLING_RATE)
    data = [block.left, block.right];
    %maxi = max(max(data)) + 0.01;
    %audiowrite('test-test.wav',data ./ maxi ,SAMPLING_RATE)

    %Remove data.
    %pause(0.1)ersion 1.11.8
%end

%% test
disp "test"

clientMoving = client.load('sendPosition')

clientMoving.moveRelativePosition('map', 0.5, 0.0, 0.0)

