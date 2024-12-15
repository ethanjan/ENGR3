%clear everything
clc;clear all; clf; close all;
%load the file
load('devil_data-1.mat')
%define the global variables
global kbirth kmature Dj Ds Dover Iinfected Idiseased Tincubation Tprogression De Di Dd
kbirth = 0.055;
kmature =  0.04;
Dj = 0.007;
Ds = 0.02335;
Dover = 2.3e-7;
Iinfected = 1.0e-5;
Idiseased = 3.84e-5;
Tincubation = 0.0976;
Tprogression = 0.0931;
De = 0.02335;
Di = 0.022609;
Dd = 0.29017;

%define the initial conditions
initial = [16165; 18450; 0; 0; 1];

%since the global variables are in terms of months, we have to convert
%the number of years to months
numMonths = (2020 - 1985)*12;

[tout, xout] = ode45(@DiseaseODE_model, [0 numMonths], initial);
%we have to correct the units again because they are suppoed to be in years
tout = tout/12 + 1985;


%plot J, S, E, I, D, Total, and Observed
plot(tout,xout(:,1),tout,xout(:,2),tout,xout(:,3),tout,xout(:,4),tout,xout(:,5),tout,xout(:,1)+xout(:,2)+xout(:,3)+xout(:,4)+xout(:,5),devil_data(:,1),devil_data(:,2),'.')


%label the x axis.
xlabel('Year')

%label the y axis
ylabel('Population')

%make title
title('Disease ODE Model')

%change font size
set(gca, 'FontSize', 12)

%change y axis to not display scientific notation
set(gca,'YTickLabel', get(gca,'YTick'))

%make the legend
legend('J','S','E','I','D','Total','Observed')

%set grid to be on
grid on