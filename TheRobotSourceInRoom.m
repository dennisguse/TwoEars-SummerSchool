function [inRoom] = TheRobotSourceInRoom(bass) 
    threshold = 1000;

    nfr = 0;
    [block, nfr] = getBlockOfAudio(bass, 24414 * 10, nfr); %Taking 10s of audio

    inRoom = false;
    
    r = rms(block.left) + rms(block.right)
    if (r < threshold)
        inRoom = true;
    end
end