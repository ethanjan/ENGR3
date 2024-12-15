%Clear everything
clear all; close all; clc;

%First we load the map data for the Santa Barbara area
load('SB_map.mat')
%Assign the size of the matrix B0 to rows and cols
[rows,cols] = size(B0);

%We have to increase the number of rows and cols by 2 so that we can create
%an edge around the animation
rows = rows + 2;
cols = cols + 2;

%Create the matrix of red pixels
R = zeros(rows,cols);

%Create the matrix of old red pixels
oldR = zeros(rows,cols);

%Create the matrix of green pixels
G = zeros(rows,cols);

%Create the matrix of blue pixels
B = zeros(rows,cols);

%Set the middle pixels (minus the edges) to the values in the B0 variable
B(2:rows-1,2:cols-1) = B0;

%Change the values from 1 to 255
for row = 2:rows-1
    for col = 2:cols-1
        if B(row,col) == 1
            B(row,col) = 255;
        end
    end
end

%set the number of timesteps to be 1000
timesteps = 1000;

%Set the probability of trees growing
ptree = 0.005;

%Set the probability of fire starting
pfire = 0.00005;

%Set the probability of fire spreading
pspread = 0.5;

%Set the number of timesteps to be 1000
timesteps = 1000;

%We will draw the picture once outside of the loop for convenience
%Creates the images
RGB_img = cat(3,R,G,B);
image(RGB_img)

%Now, we finally start the loop. This time, we start with i = 1 for
%convenience.
for i = 1:timesteps
    %Set the value of oldR to R
    oldR = R;
    %We loop through the rows minus the edges
    for row = 2:rows-1
        %We loop through the columns minus the edges
        for col = 2:cols-1
            %Check to see if this cell has a tree
            if G(row,col) == 255
                %Check to see if there are fires on adjacent cells
                if oldR(row-1,col) == 255 || oldR(row,col-1) == 255 || oldR(row+1,col) == 255 || oldR(row,col+1) == 255
                    %Check to see if the fire should spread
                    if rand < pspread
                        %Change the cell from tree to fire
                        G(row,col) = 0;
                        R(row,col) = 255;
                    end
                end
            end
            %Remove the fires from the previous timestep
            if oldR(row,col) == 255
                R(row,col) = 0;
            end
            %Start fires on green cells
            if G(row,col) == 255
                %Check to see if a fire should start
                if rand < pfire
                    %Start the fire
                    G(row,col) = 0;
                    R(row,col) = 255;
                end
            end
            %Place trees on empty cells. Make sure that the cell is not
            %blue (ocean)
            if G(row,col) == 0 && R(row,col) == 0 && B(row,col) == 0
                %Check to see if a tree should grow on this cell
                if rand < ptree
                    G(row,col) = 255;
                end
            end
        end
    end

    %Creates the images
    RGB_img = cat(3,R,G,B);
    image(RGB_img)
    %Make sure to pause so that there is an animation
    pause(0.005)
end