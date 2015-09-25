function [reached] = TheRobotGo(clientMoving, x, y, angle, relative)
    navState = clientMoving.NavigationState();
    position = navState.NavigationState.position;    
    if (relative)
        x = position.x + x;
        y = position.y + y;
        angle = mod(position.angle + angle, 360);
    end
    
   
    %pause(5);
    targetDistance = 0.1;
    targetAngle = 5;
    
    iterations = 100;
    reached = false;
   
    currentAngle = mod(angle + 180, 360)
    currentDistance = 42;

    clientMoving.moveAbsolutePosition('map', x, y, angle)
    
    while (currentDistance > targetDistance && currentAngle > targetAngle) 
        navState = clientMoving.NavigationState();
        position = navState.NavigationState.position;
        
        currentDistance = sqrt((position.x - x)^2 + (position.y - y)^2)
        currentAngle = abs(angle - position.angle);
        
        disp ['currentDistance', currentDistance, iterations]
        
        pause(1);
        
        iterations = iterations - 1;
        if (iterations < 0)
            break;
        end
    end
    reached = true;
end