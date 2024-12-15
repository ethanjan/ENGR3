%set the number of points in each trial
npts = 100;
%set number of trials
nTrials = 10000;
%create results vector
results = zeros(nTrials,1);
%do the Monte Carlo method 10000 times
for i = 1:nTrials
    %fill the results vector
    results(i) = estimate(npts);
end

%plot the results vector with a histogram
histogram(results)
%make the title
title('Monte Carlo Method to approximate pi')
%label the x axis
xlabel('estimate for pi')
%label the y axis
ylabel('number of times')
