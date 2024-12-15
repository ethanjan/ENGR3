clear all; close all; clc;
%First we define the matrix A, which contains the coefficients of the
%matrix that will be used in the least squares approximation
A = [1 0; 1 1; 1 2; 1 3; 1 4];
%Next we define the column vector b to hold all the values of the b_i
b = [0.1 7.8 13.2 8.7 12.4]'; %Add the apostrophe to turn it into a column vector
%We use A and b to compute the solution x = [C D]
x = A\b;
%Make sure to display the solution
%First we display C
disp('C')
disp(x(1))
%Next we display D
disp('D')
disp(x(2))

%Now, we plot the line
%We choose the range of x values so that the plot will contain all of the
%points in the problem statement
xvals = [-1, 5];
%We calculate the y values using the x values and the slope and y intercept
%that were computed in the first half of this code
yvals = x(1) + xvals*x(2);

%Now we actually plot the line of best fit.
plot(xvals,yvals)

%Make sure not to create another plot
hold on

%Next, we plot the points that the line of best fit was attempting to
%approximate
plot(A(:,2),b,'o')

xlabel('x values')

ylabel('y values')

title('Least Squares Regression')

legend('best fit', 'data points')
