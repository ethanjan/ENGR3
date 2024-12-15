function [p1,p2] = prob57(numTrials)
    %initialize count for the number of 5 or 7s that we obtain
    num57 = 0;
    for i = 1:numTrials
        %compute dice 1
        dice1 = randi(6);
        %compute dice 2
        dice2 = randi(6);
        %if we roll a 5 or a 7
        if dice1+dice2 == 5 || dice1+dice2 == 7
            %increment the number of 5 or 7 rolls
            num57 = num57 + 1;
        end
    end
    %estimate the probability with the Monte Carlo method
    p1 = num57/numTrials;
    %compute the theoretical probability
    %there are 10 ways to get 5 or 7
    %5 = 4 + 1 = 1 + 4 = 2 + 3 = 3 + 2
    %7 = 6+1 = 1+6 = 2+5 = 5+2 = 3+4 = 4+3
    %there are 36 total outcomes
    p2 = 10/36;
end
