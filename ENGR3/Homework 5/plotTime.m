function plotTime(hour, minute)
    

    %define the t values for the parametrization
    t = linspace(0,2*pi,100);
    %define the x values of the parametrization
    x = cos(t);
    %define the y values of the parametrization
    y = sin(t);
    
    %plot the blue circle that forms the clock
    plot(x,y,'b')

    %correct the aspect ratio
    axis equal
    
    %do not create a second plot
    hold on

    %set the value of w (the width)
    w = 0.05;
    
    %set the value of L (the length)
    L = 0.9;

    %set the initial position of the minute hand
    minuteHand = [-w/2 w/2 w/2 -w/2 -w/2; 0 0 L L 0];
    
    %define the rotation matrix
    rotationMatrix = [cos(minute*pi/30) sin(minute*pi/30); -sin(minute*pi/30) cos(minute*pi/30)];

    %find the position of the rotated minute hand
    rotatedMinuteHand = rotationMatrix*minuteHand;

    %Plot the position of the rotated minute hand
    plot(rotatedMinuteHand(1,:),rotatedMinuteHand(2,:),'g');

    %Plot the position of the rotated hour hand
    hourHand = [-w/2 w/2 w/2 -w/2 -w/2; 0 0 L/2 L/2 0];
    
    
    %define the rotation matrix
    rotationMatrix = [cos(hour*pi/6) sin(hour*pi/6); -sin(hour*pi/6) cos(hour*pi/6)];

    %find the position of the rotated hour hand
    rotatedHourHand = rotationMatrix * hourHand;

    %Plot the position of the rotated hour hand
    plot(rotatedHourHand(1,:),rotatedHourHand(2,:),'r');
end