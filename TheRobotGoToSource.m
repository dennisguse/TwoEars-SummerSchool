function [sourceType] = TheRobotGoToSource(clientMoving, clientAzimuth, clientBass)
    for driveTo = 1:4    
        estimation = TheRobotSampleAzimuth(clientMoving, clientAzimuth);
        TheRobotGo(clientMoving, 0, 0, estimation, false)
    
        TheRobotGo(clientMoving, 0.1, 0, 0.0, true)
    end
    disp 'Found a target; Classifying...'

    nfr = 0;
    [block, nfr] = getBlockOfAudio(clientBass, 24414 * 5, nfr);

    sourceType = TheRobotClassify(block.left, 24414)
end