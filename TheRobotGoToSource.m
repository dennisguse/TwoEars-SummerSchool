function [found] = TheRobotGoToSource(clientMoving, clientAzimuth)
    for driveTo = 1:4    
        estimation = TheRobotSampleAzimuth(clientMoving, clientAzimuth);
        TheRobotGo(clientMoving, 0, 0, estimation, true)
    
        TheRobotGo(clientMoving, 0.2, 0, 0.0, true)
    end
end