%reset everything
clf; clear all; clc; close all;
%load file
load('devil_data-1.mat')
%define the global variables
global kbirth kmature Dj Ds Dover
kbirth = 0.055;
kmature =  0.04;
Dj = 0.007;
Ds = 0.02335;
Dover = 2.3e-7;

%define the initial conditions
initial = [16165; 18450];

%since the global variables are in terms of months, we have to convert
%the number of years to months
numMonths = (2020-1985)*12;

%solve the differential equation
[tout, xout] = ode45(@DiseaseFreeODE_model, [0 numMonths], initial);
%we have to correct the units again because they are supposed to be in years
tout = tout/12 + 1985;


%plot J, S, Total, and Observed
plot(tout,xout(:,1),tout,xout(:,2),tout,xout(:,1)+xout(:,2),devil_data(:,1),devil_data(:,2),'.')


%label the x axis.
xlabel('Year')

%label the y axis
ylabel('Population')

%make title
title('Disease Free ODE Model')

%change font size
set(gca, 'FontSize', 12)

%change y axis to not display scientific notation
set(gca,'YTickLabel', get(gca,'YTick'))

%make the legend
legend('J','S','Total','Observed')

%turn grid on
grid on