function P = nascar(N)
    %initialize the number of successes
    numSuccess = 0;
    for i = 1:N
        %start with 43 cars
        cars = 43;
        %dont have any crashes to begin with
        crashes = 0;
        %loop through all the cars
        for j = 1:cars
            %if we are unlucky
            if rand > 0.72671
                %the car crashes
                crashes = crashes + 1;
            end
        end
        %total number of remaining cars
        cars = cars - crashes;
        %if there are at least 35 cars remaining
        if cars >= 35
            %increment the number of successes
            numSuccess = numSuccess + 1;
        end
    end
    %find the probability
    P = numSuccess/N;
end