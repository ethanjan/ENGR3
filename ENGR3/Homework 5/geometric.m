%Here we define the function geometric that will modify the ellipse.
function [x1,y1] = geometric(x,y,option)
    %The first option is a translation.
    %We translate 2 to the right and 3 down
    if option == 1
        x1 = x+2;
        y1 = y-3;
    %The second option is scaling.
    %We scale by 1/2 in the x direction
    %We scale by 2 in the y direction
    elseif option == 2
        %We assign the results of the matrix multiplication to v
        v = [0.5 0; 0 2] * [x;y];
        %We assign the coordinates of v to x1 and y1
        x1 = v(1,:);
        y1 = v(2,:);
    %The third option is rotating by 45 degrees clockwise
    elseif option == 3
        %We assign the results of the matrix muliplication to v
        v = [cos(-pi/4) -sin(-pi/4); sin(-pi/4) cos(-pi/4)] * [x;y];
        %We assign the coordinates of v to x1 and y1
        x1 = v(1,:);
        y1 = v(2,:);
    %The last option is reflecting across the line y = x
    elseif option == 4
        %We assign the results of the matrix multiplication to v
        v = [0 1; 1 0] * [x;y];
        %We assign the coordinates of v to x1 and y1
        x1 = v(1,:);
        y1 = v(2,:);
    end

end
