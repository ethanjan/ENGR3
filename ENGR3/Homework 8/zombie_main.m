clear; clf; clc
global mu delta beta gamma
%starting time is 0
t0 = 0;
%ending time is 28
tmax = 28;
%start with 1000 people and 50 zombies
x0 = [1000;50];
%set rate at which people are born
mu = 0.010;
%set rate at which people die
delta = 0.001;
%set rate at which people become zombies
beta = 0.002;
%set rate at which people kill zombies
gamma = 0.0015;

%solve the ODEs
[time, x_out] = ode45(@zombie,[t0, tmax], x0);

%find the human population vector
P = x_out(:,1);
%find the zombie population vector
Z = x_out(:,2);

%plot the number of humans as magenta
%and the number of zombies as black
plot(time,P,"m",time,Z,"k");
%legend
legend('Humans', 'Zombies')
%title the graph
title('Zombie Apocalypse')
%label the x axis
xlabel('days')
%label the y axis
ylabel('population')



%do it all again but set gamma = 0.0019
figure(2);
%set rate at which people kill zombies
gamma = 0.0019;

%solve the ODEs
[time, x_out] = ode45(@zombie,[t0, tmax], x0);

%find the human population vector
P = x_out(:,1);
%find the zombie population vector
Z = x_out(:,2);

%plot the number of humans as magenta
%and the number of zombies as black
plot(time,P,"m",time,Z,"k");
%legend
legend('Humans', 'Zombies')
%title the graph
title('Zombie Apocalypse')
%label the x axis
xlabel('days')
%label the y axis
ylabel('population')

%do it all again but set gamma = 0.0022
figure(3);
%set rate at which people kill zombies
gamma = 0.0022;

%solve the ODEs
[time, x_out] = ode45(@zombie,[t0, tmax], x0);

%find the human population vector
P = x_out(:,1);
%find the zombie population vector
Z = x_out(:,2);

%plot the number of humans as magenta
%and the number of zombies as black
plot(time,P,"m",time,Z,"k");
%legend
legend('Humans', 'Zombies')
%title the graph
title('Zombie Apocalypse')
%label the x axis
xlabel('days')
%label the y axis
ylabel('population')