function [inRoom] = TheRobotSourceInRoom(bass) 
    threshold = 250;

    nfr = 0;
    [block, nfr] = getBlockOfAudio(bass, 24414 * 10, nfr); %Taking 10s of audio

    inRoom = false;
    if (rms(block.left) + rms(block.right) < threshold)
        inRoom = true;
    end
end