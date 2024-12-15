function f = findPrime(n)
    %Here we define the position in the final vector f
    pos = 1;
    %Here we define the variable telling us whether or not the current number
    %is prime
    isPrime = 1;
    %This will iterate through the numbers 2 to n and find which ones are prime
    for i = 2:n
        %This loop determines if the number i is prime
        for j = 2:i-1
            %if i is divisible by some number not equal to i or 1
            if rem(i, j) == 0           
                %We record that i is not prime
                isPrime = 0; 
                %We break out of the loop since i is composite
                break;
            end
        end
        %if i is prime 
        if isPrime == 1
            f(pos) = i; %then we add it to the output vector
            pos = pos + 1;%and increment the position
        end
        %We set isPrime to 1 for the next iteration
        isPrime = 1;
    end
end
