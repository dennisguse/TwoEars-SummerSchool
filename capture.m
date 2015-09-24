
%%
client = genomix.client('turtlebot3-wifi:8080')
bass = client.load('bass')
%%
r = bass.Acquire('-a', 24414, 2048, 20)
%%
p = bass.Audio()
soundsc(cell2mat(p.Audio.right), p.Audio.sampleRate)

%%
lastFrameIndex = 0;

data = {};
while(true)
    audio = bass.Audio();
    audio = audio.Audio();
    
    numberOfSamples = audio.lastFrameIndex - lastFrameIndex
    if (numberOfSamples >= length(audio.left))
        disp('Take them all')
    else
        disp('Take ' )
    end
    pause(0.01)
    lastFrameIndex = audio.lastFrameIndex;
end