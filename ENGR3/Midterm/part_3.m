%Clean everything up
clear all; close all; clc;

%Set the size of the grid
n = 50;
%Set the probability of fire spreading
pspread = 0.8;
%Set the number of steps in the animation to 150
timesteps = 150;

%Create the matrix for red pixels
R = zeros(n,n);

%For this task, we will have to create a matrix containing all of the old
%red pixels
oldR = zeros(n,n);

%Set the middle value to be 255
R(floor(n/2),floor(n/2)) = 255;

%Create the matrix for green pixels. Since this is task 3, we set every
%entry (besides the middle one and the edges) in this matrix to be 255
G(1:n,1:n) = 0;
G(2:n-1,2:n-1) = 255;
%Make sure to correct the middle pixel
G(floor(n/2),floor(n/2)) = 0;

%Create the matrix for blue pixels
B = zeros(n,n);

%Create the vector that will tell us how many trees there are at each
%timestep
treeVector = zeros(1,timesteps+1); 

%Create the vector that will tell us how many fires there are at each
%timestep
fireVector = zeros(1,timesteps+1);

%Notice that we end at timesteps+1. This is because we are going from t = 0
%to t = timesteps which includes timesteps+1 values 
%This counts the number of trees at each timestep. We set it to start at
%(n-2)*(n-2)-1 because the grid is filled with trees (besides the middle cell)
numTrees = (n-2)^2-1;
%We set the number of trees for the first time step
treeVector(1) = numTrees;

%This counts the number of fires at each timestep. We set it to start at 1
%because there is one fire at the beginning (it is in the middle)
numFires = 1;

%We set the number of fires for the first time step
fireVector(1) = numFires;


%Creates the images
RGB_img = cat(3,R,G,B);
image(RGB_img)
    
%Make sure to pause so that the animation can actually be seen
pause(0.01)

%Start doing the animation. Notice that we start at 2 because we have
%already used 1
for i = 2:timesteps+1
    %Reset the number of trees and the number of fires
    numTrees = 0;
    numFires = 0;
    
    %Set oldR to be equal to R
    oldR = R;
    %Here we loop through 2 to n-1 to avoid the egdes, which makes the
    %coding significantly easier
    for row = 2:n-1
        %Again we loop through 2 to n-1 to avoid the edges
        for col = 2:n-1
            %if we are on a tree
            if G(row,col) == 255
                %Check to see if there is any fire next to it
                if oldR(row-1,col) == 255 || oldR(row,col-1) == 255 || oldR(row+1,col) == 255 || oldR(row,col+1) == 255
                    %Check to see if the fire should spread
                    if rand < pspread
                        G(row,col) = 0;
                        R(row,col) = 255;
                    end
                end
            end
            %checks to see if there is already fire on this cell
            if oldR(row,col) == 255
                %removes the fire on this cell
                R(row,col) = 0;
            end
            
        end
    end
    
    %count the number of trees
    numTrees = sum(G,'all')/255;
    %count the number of fires
    numFires = sum(R,'all')/255;

    %Add this information to the vectors
    treeVector(i) = numTrees;
    fireVector(i) = numFires;

    %Creates the images
    RGB_img = cat(3,R,G,B);
    image(RGB_img)
    %Make sure to pause so that it is an animation
    pause(0.05)
end

%Create another figure so that the plot doesn't replace the animation
figure(2)
%Here we create the plot
%Create the vector for the timesteps. Again we go from t = 0 to t =
%timesteps
tvals = 0:timesteps;
%Create the plot
plot(tvals,treeVector,'g',tvals,fireVector,'r')

%Create the label for the x axis
xlabel('time')
%Create the label for the y axis
ylabel('Number of Trees')
%Create the title
title('Time Evolution of Fire Propogation')

%Create the legend
legend('Trees','Fire')