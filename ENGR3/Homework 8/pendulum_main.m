clear;clc;clf
%set initial position of pendulum
theta0 = pi/4;
%set initial speed of pendulum
thetadot0 = 0;
%set the time
tmax = 20;

%solve the ODE
[time, x_out] = ode45(@pendulum,[0, tmax], [theta0,thetadot0]);

%do the animation
animate(time,x_out(:,1))