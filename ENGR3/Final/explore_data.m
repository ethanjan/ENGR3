clear all; clf; clc; close all;
%load the data file
load('devil_data-1.mat')

%plot the data.
%make sure to use dots instead of lines
plot(devil_data(:,1),devil_data(:,2),'r.')

%label the x axis.
xlabel('Year')

%label the y axis
ylabel('Population')

%make title
title('Population of Tasmanian Devils')

%change font size
set(gca, 'FontSize', 12)

%change y axis to not display scientific notation
set(gca,'YTickLabel', get(gca,'YTick'))

%turn on the grid
grid on

%make legend
legend('Observed')