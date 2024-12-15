%Loop through the hours
for hour = 0:11
    %Loop through the minutes
    for minute = 0:59
        %clear the previous figure
        clf;
        %draw the clock
        plotTime(hour+minute/60,minute)
        %pause
        pause(0.05)
        
    end
end