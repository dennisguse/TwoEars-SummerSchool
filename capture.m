%%OUR constants!
SAMPLING_RATE = 24414;


%% Connect to audio device
client = genomix.client('turtlebot3-wifi:8080')
bass = client.load('bass')
bass.Acquire('-a', SAMPLING_RATE, 4096, 20)


%%Demo for audio aquisition
while(true) %Endless ><
    audio = bass.Audio();
    audio = audio.Audio();
    
    %%%%%Do some fancy shit here ^^
    soundsc(cell2mat(audio.left), audio.sampleRate)

    %Remove data.
    pause(0.1)
end