function [P1,P2] = surfer
    %initialize set count
    numSets = 0;
    %initalize wave count
    numWaves = 0;
    %Loop through the sets
    for set = 1:1000000
        %Loop through the waves
        for wave = 1:7
            if rand < 0.1
                %increment the number of waves
                numWaves = numWaves + 1;
            end
        end
        %check if numWaves is 3
        if numWaves == 3
            %increment the number of sets
            numSets = numSets+1;
        end
        %reset numWaves to be zero for the next loop
        numWaves = 0;
    end
    %Monte Carlo estimation
    P1 = numSets / 1000000;
    %Exact Result
    P2 = nchoosek(7,3) * 0.1 ^ 3 * 0.9 ^ 4;
end