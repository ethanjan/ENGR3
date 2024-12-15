%Clear everything
clear all; close all; clc;

%Set the size of the grid to be 100
n = 100;

%Set the probability of trees growing
ptree = 0.005;

%Set the probability of fire starting
pfire = 0.00005;

%Set the probability of fire spreading
pspread = 0.5;

%Set the number of timesteps to be 1000
timesteps = 1000;

%Set the values of the red, green, and blue matrices
G = zeros(n,n);

R = zeros(n,n);

B = zeros(n,n);

%Again, we will need a matrix for all the old r values (so that we know
%which fires to extinguish after one time step)
oldR = zeros(n,n);


%Define the number of trees and the number of fires
numTrees = 0;
numFires = 0;

%Define the vectors that will be used to draw the graphs of the number of
%trees and the number of fires
treeVector = zeros(1,timesteps+1);
fireVector = zeros(1,timesteps+1);


%Fill the first entry in these two vectors with 0
treeVector(1) = numTrees;
fireVector(1) = numFires;

%We will draw the picture once outside of the loop for convenience
%Creates the images
RGB_img = cat(3,R,G,B);
image(RGB_img)

%Now, we finally start the loop. As before, we start with i = 2 for
%convenience.
for i = 2:timesteps+1
    %Set the value of oldR to be R
    oldR = R;
    %Reset the number of trees and fires
    numFires = 0;
    numTrees = 0;
    %We loop through the rows minus the edges
    for row = 2:n-1
        %We loop through the columns minus the edges
        for col = 2:n-1
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
            %Place trees on empty cells
            if G(row,col) == 0 && R(row,col) == 0
                %Check to see if a tree should grow on this cell
                if rand < ptree
                    G(row,col) = 255;
                end
            end

           
        end
    end

    %Count the number of trees
    numTrees = sum(G,'all')/255;
    %Count the number of fires
    numFires = sum(R,'all')/255;

    %Add this information to the vectors
    treeVector(i) = numTrees;
    fireVector(i) = numFires;

    %Creates the images
    RGB_img = cat(3,R,G,B);
    image(RGB_img)
    pause(0.005)
end

%Create another figure so that the plot doesn't replace the animation
figure(2)
%Here we create the plot
%Create the vector for the timesteps. Again we go from t = 0 to t =
%timesteps
tvals = 0:timesteps;
%Create the plot itself
plot(tvals,treeVector,'g',tvals,fireVector,'r')

%Create the label for the x axis
xlabel('time')
%Create the label for the y axis
ylabel('Area')
%Create the title
title('Time Evolution of Trees and Fires')

%Create the legend
legend('Trees','Fire')