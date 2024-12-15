function boarding
    %define number of trials
    numTrials = 10000;
    %initialize the counter for success
    numSuccess = 0;
    %Start the Monte Carlo Method
    for j = 1:numTrials
        %define the seat vector
        seat = zeros(100,1);
        %determine where frank sits
        pos = randi(100);
        %fill the seat
        seat(pos) = 1;
        %loop through the rest of the people
        for i = 2:99
            %if seat is empty
            if seat(i) == 0
                %Take the seat
                seat(i) = 1;
            %if seat is not empty
            else
                %try to find a new seat
                pos = randi(100);
                %keep trying to find a new seat until
                %one of the seats is empty
                while seat(pos) == 1
                    pos = randi(100);
                end
                %fill the seat
                seat(pos) = 1;
            end
        end
        %check to see if the last seat is open
        if seat(100) == 0
            %increment the number of successes
            numSuccess = numSuccess+1;
        end
    end
    %define the probability
    prob = numSuccess/numTrials;
    %display the probability
    fprintf('The probability that your seat will be available is %.4f\n',prob);
end