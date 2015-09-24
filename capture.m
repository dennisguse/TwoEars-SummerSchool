%%OUR constants!
FRAME_SIZE = 5000; %Number of audio samples that needs to be there for computation; NOTE time depends on sampling rate
SAMPLING_RATE = 24414;


%% Connect to audio device
client = genomix.client('turtlebot3-wifi:8080')
bass = client.load('bass')
bass.Acquire('-a', SAMPLING_RATE, 2048, 20)


%%Demo for audio aquisition
p = bass.Audio()
soundsc(cell2mat(p.Audio.right), p.Audio.sampleRate)


%%Audio processing loop - basically a ringbuffer
%Contains continuous samples for the left and right channel.
dataLeft = {}; 
dataRight = {};

%Keep track of the samples provided by bass
lastFrameIndex = 0;

while(true) %Endless ><
    audio = bass.Audio();
    audio = audio.Audio();
    
    newSampleIndex = audio.lastFrameIndex - lastFrameIndex;
    if (newSampleIndex > length(audio.left)) %Assume left and right channel are equally long
        %To avoid some awesome errors, old data is deleted.
        %disp 'Take them all!!!! And replace!' 
        dataLeft = audio.left;
        dataRight = audio.right;
    else %We got continuous stuff; just append
        dataLeft = [dataLeft, audio.left{newSampleIndex:length(audio.left)}];
        dataRight = [dataRight, audio.left{newSampleIndex:length(audio.right)}];
    end
    
    if (length(dataLeft) > FRAME_SIZE) %Do some processing?
        dataToProcessLeft = dataLeft{1:FRAME_SIZE};
        dataToProcessRight = dataRight{1:FRAME_SIZE};
        
        %%%%%Do some fancy shit here ^^
        soundsc(cell2mat(dataToProcessLeft), audio.sampleRate)

        %Remove data.
        dataLeft(1:FRAME_SIZE) = [];
        dataRight(1:FRAME_SIZE) = [];
    else %Nope then wait
        pause(0.1)
    end
    
    lastFrameIndex = audio.lastFrameIndex;
end