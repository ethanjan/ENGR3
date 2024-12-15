clear; clf; clc
global sigma rho beta
%starting time is 0
t0 = 0;
%ending time is 100
tmax = 100;
%start with the vector [1,1,1]
x0 = [1;1;1];
%set sigma to be 10
sigma = 10;
%set rho to be 25
rho = 25;
%set beta to be 2.6
beta = 2.6;

%solve the ODEs
[time, x_out] = ode45(@mylorenz,[t0, tmax], x0);

%extract x
x = x_out(:,1);
%extract y
y = x_out(:,2);
%extract z
z = x_out(:,3);

%plot x vs z
plot(x,z,'r')

%title
title('x vs z')
%label x axis
xlabel('x')
%label z axis
ylabel('z')

%3d plot
figure(2)
%plot the lorenz attractor
plot3(x,y,z);
%title
title('Lorenz Attractor')
%label x axis
xlabel('x')
%label y axis
ylabel('y')
%label z axis
zlabel('z')