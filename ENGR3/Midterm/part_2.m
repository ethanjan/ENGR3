%Clean everything up
clear all; close all; clc;

%Set the size of the grid
n = 50;
%Set the probability of fire starting
pfire = 0.004;
%Set the number of steps in the animation to 600
timesteps = 600;

%Create the matrix for red pixels
R = zeros(n,n);
%Create the matrix for green pixels. Since this is task 2, we set every
%entry in this matrix to 255
G(1:n,1:n) = 255;
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
%n*n because the grid is filled with trees
numTrees = n^2;
%We set the number of trees for the first time step
treeVector(1) = numTrees;

%This counts the number of fires at each timestep. We set it to start at 0
%because there are no fires at the beginning 
numFires = 0;

%We set the number of fires for the first time step
fireVector(1) = numFires;



%Creates the images
RGB_img = cat(3,R,G,B);
image(RGB_img)
    
%Make sure to pause so that the animation can actually be seen
pause(0.01)


%This loop will do the rest of the animation. We start at i = 2 because we have
%already done i = 1
for i = 2:timesteps+1
    %Here we loop through the matrix of green and red values
    for row = 1:n
        for col = 1:n
            %Checks to see if a fire should start on this cell
            if rand < pfire
                %Removes the tree on this cell
                G(row,col) = 0;
                %Starts a fire on this cell
                R(row,col) = 255;
            end
           
        end
    end
   
    %Calculates the number of trees
    numTrees = sum(G,'all')/255;
    %Calculates the number of fires
    numFires = sum(R,'all')/255;

    %Fill up the treeVector with the appropriate number of trees
    treeVector(i) = numTrees;
    %Reset the number of trees to n^2
    numTrees = n^2;
    
    %Fill up the fireVector with the appropriate number of fires
    fireVector(i) = numFires;
    %Reset the number of fires to 0
    numFires = 0;


   %Creates the images
    RGB_img = cat(3,R,G,B);
    image(RGB_img)
    
    %Make sure to pause so that the animation can actually be seen
    pause(0.01)
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
ylabel('Number of Trees')
%Create the title
title('Time Evolution of Fire without Spread')

%Create the legend
legend('Trees','Fire')