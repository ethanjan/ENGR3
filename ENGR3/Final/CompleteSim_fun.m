%this takes DFTD_start as input and outputs
%t, y, and the error
function [t,y,error] = CompleteSim_fun(DFTD_start)
    clf;
    %load the file
    load('devil_data-1.mat')
    %define the global variables
    %We must define all the global variables to avoid receiving an error
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
    %set up first t interval (before DFTD_start)
    tint1 = 0:1:DFTD_start;
    %set up second t interval (after DFTD_start)
    tint2 = DFTD_start:1:409;
    %solve the ODE before DFTD
    [tout1,yout1] = ode45(@DiseaseODE_model, tint1, [16165;18450;0;0;0]);
    %solve the ODE after DFTD
    [tout2,yout2] = ode45(@DiseaseODE_model, tint2, [yout1(DFTD_start+1,1);yout1(DFTD_start+1,2);0;0;1]);
    
    %concatenate the t arrays
    t = cat(1,tout1(1:DFTD_start),tout2);
    %set up temp y arrays
    tempy1 = yout1(1:DFTD_start,:);
    tempy2 = yout2;
    %concatenate the y arrays
    y = cat(1,tempy1,tempy2);
    %find the total number of tasmanian devils
    total = y(:,1) + y(:,2) + y(:,3) + y(:,4) + y(:,5);
    
    %compute the error
    error = sum((total - devil_data(:,2)).^2);
    
    %convert time from months to years
    time = 1985 + t/12;
    %plot all the lines
    plot(time,y(:,1),time,y(:,2),time,y(:,3),time,y(:,4),time,y(:,5),time,y(:,1)+y(:,2)+y(:,3)+y(:,4)+y(:,5),devil_data(:,1),devil_data(:,2))
    %make the title
    title('ODE Model for Population of Tasmanian Devils')
    %label the x axis
    xlabel('Year')
    %label the y axis
    ylabel('Population')
    %make grid
    grid on
    %change font size
    set(gca,'FontSize',12)
    %change from scientific notation to normal
    set(gca,'YTickLabel',get(gca,'YTick'))
    %draw the x line
    xline(1985+DFTD_start/12,'--')
    %make the legend
    legend('J','S','E','I','Dis','Total','Observed Data','DFTD Start Time')
end