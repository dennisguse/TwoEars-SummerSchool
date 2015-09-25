function [reached] = TheRobotGo(clientMoving, x, y, angle)
    clientMoving.moveAbsolutePosition('map', x, y, angle)
    
    %pause(5);
    targetDistance = 0.1;
    iterations = 100;
    reached = false;
   
    currentDistance = 42;
    while (currentDistance < targetDistance) 
        position = clientMoving.NavigationState().NavigationState.position;
        currentDistance = sqrt((position.x - x)^2 + (position.y - y)^2);
        
        pause(1);
        
        iterations = iterations - 1;
        if (iterations < 0)
            break;
        end
    end
    reached = true;
end