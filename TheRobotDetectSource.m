function [found] = TheRobotDetectSource() 
    nfr = 0;
    found = false;
    azimuthEstimation = [];
    for measurement=1:6
        %Get and save Azimuth
        %azimuthEstimation = [azimuthEstimation, 0];
        
        [block, nfr] = getBlockOfAudio(bass,SAMPLING_RATE * 10,nfr);
        %Do some fancy shit here!
    end
    
    found = true; %%%AAHHH
end
