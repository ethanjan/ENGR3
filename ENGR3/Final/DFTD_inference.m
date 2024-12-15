clear all; clc; clf; close all;
%define the array for the times at which we compute the error
DFTD_start = (5:1:180);
%load devil data
load('devil_data-1.mat')
%define the error array
error = zeros(1,176);
%iterate through all the values in the error array




for i = 1:1:176
   %find error
    [t,y,err] = CompleteSim_fun(i+4);
   %add error to error array
    error(i) = err;
    %pause 
   pause(0.005)
   
end

%find minimum index
[m,k] = min(error);

%adjust by 4
k = k+4;

%create another figure
figure(2)
%plot error vs start time
plot(DFTD_start,error)
%put grid on
grid on
%make title
title('Error Analysis (Complete ODE Model vs Data)')
%label x axis
xlabel('DFTD Start Time (months)')
%label y axis
ylabel('Error')
%set font size
set(gca,'FontSize',12)

%force axes to be correct
axis([0 200 0 5e10])
%change x ticks
xticks([0 50 100 150 200])
%change y ticks
yticks([0 1e10 2e10 3e10 4e10 5e10])

%make second figure
figure(3)
%use the best approximation with DFTD_start = 106
%We know that 106 is the best to use from observing the error plot
[t,y,err] = CompleteSim_fun(k);
%change months to years
t = 1985 + t/12;
%plot all the lines
plot(t,y(:,1),t,y(:,2),t,y(:,3),t,y(:,4),t,y(:,5),t,y(:,1)+y(:,2)+y(:,3)+y(:,4)+y(:,5),t,devil_data(:,2))
%make the title
title('ODE Model for Population of Tasmanian Devils')
%label the x axis
xlabel('Year')
%label the y axis
ylabel('Population')
%grid on
grid on
%change font size
set(gca,'FontSize',12)
%change from scientific notation to normal
set(gca,'YTickLabel',get(gca,'YTick'))
%set the position of the x line
xline(1985+k/12,'--')

%make the legend
legend('J','S','E','I','Dis','Total','Observed Data','DFTD Start Time')