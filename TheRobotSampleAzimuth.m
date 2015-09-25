function [azimuth] = TheRobotSampleAzimuth(clientMoving, clientAzimuth) 
    azimuthEstimation = []; %x, y, absoluteEstimation

    for measurement=1:5
        pause(3);
        %Get and save Azimuth
        navState = clientMoving.NavigationState();
        position = navState.NavigationState.position;
        
        disp mod(radtodeg(clientAzimuth.Azimuths()) + position.angle, 360);
        azimuthEstimation = [azimuthEstimation, mod(radtodeg(clientAzimuth.Azimuths()) + position.angle, 360)];
            %{position.x, position.y, mod(radtodeg(clientAzimuth.Azimuths()) + position.angle, 360)}];
        
        TheRobotGo(clientMoving, 0, 0, 30, true);
        
        %[block, nfr] = getBlockOfAudio(bass,SAMPLING_RATE * 10,nfr);
        %Do some fancy shit here!
    end
        
    azimuth = avg(azimuthEstimation);
end
