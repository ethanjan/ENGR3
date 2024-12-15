%Clean everything up
clear all; close all; clc;

%Set the size of the grid
n = 50;
%Set the probability of trees growing
ptree = 0.003;
%Set the number of steps in the animation to 600
timesteps = 600;

%Create the matrix for red pixels
R = zeros(n,n);
%Create the matrix for green pixels
G = zeros(n,n);
%Create the matrix for blue pixels
B = zeros(n,n);

%Create the vector that will tell us how many trees there are at each
%timestep
treeVector = zeros(1,timesteps+1); 
%Notice that we end at timesteps+1. This is because we are going from t = 0
%to t = timesteps which includes timesteps+1 values 
%This counts the number of trees at each timestep. We set it to start at 0
%because there are no trees to begin with
numTrees = 0;
%We set the number of trees to be zero for the first time step
treeVector(1) = numTrees;
%Creates the images. We do this outside of the loop for t=0 because it
%greatly simplifies the rest of the code
RGB_img = cat(3,R,G,B);
image(RGB_img)
    
%Make sure to pause so that the animation can actually be seen
pause(0.01)


%This loop will do the rest of animation. We start at i = 2 because we have
%already done i = 1
for i = 2:timesteps+1
    %Here we loop through the matrix of green values
    for row = 1:n
        for col = 1:n
            %Checks to see if a tree should grow on this cell
            if rand < ptree
                %Actually grows the tree on this cell
                G(row,col) = 255;
            end
            
        end
    end

    %Count the number of tree cells
    numTrees = sum(G,"all")/255;

    %Fill up the treeVector with the appropriate number of trees
    treeVector(i) = numTrees;
    %Reset the number of trees to 0
    numTrees = 0;
    
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
plot(tvals,treeVector,'g')

%Create the label for the x axis
xlabel('time')
%Create the label for the y axis
ylabel('Number of Trees')
%Create the title
title('Time Evolution of Tree Growth without Fire')

%Create the legend
legend('Trees')