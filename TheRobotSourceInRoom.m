function [inRoom] = TheRobotSourceInRoom(bass) 
    threshold = 0.4;
   

    nfr = 0;
    [block, nfr] = getBlockOfAudio(bass, 24414 * 10, nfr);

    inRoom = false;
    if (rms(block.left) + rms(block.right) < threshold)
        inRoom = true;
    end
end