function TheRobotDance()
disp 'Doing the robot dance'
for i=1:5
    TheRobotGo(clientMoving, 0, 0, 30, true)
    TheRobotGo(clientMoving, 0, 0, -60, true)
    TheRobotGo(clientMoving, 0, 0, 30, true)
end
end