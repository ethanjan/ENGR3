%function that returns an estimate for the value of pi
%the input is the number of points to be used for the Monte Carlo method
function approx = estimate(npts)
    %initialize count
    count = 0;
    %iterate through all of the points
    for i = 1:npts
        %choose (x,y) to be in the interval [0,1] x [0,1]
        x = rand;
        y = rand;
        %if (x,y) is in the unit circle
        if x^2 + y^2 < 1
            %increment the count by one
            count = count + 1;
        end
    end
    %we have to multiply by 4 to make sure we get pi instead of pi/4
    approx = (count / npts)*4;
end