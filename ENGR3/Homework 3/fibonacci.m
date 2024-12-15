function f = fibonacci(n)
    %if n is less than or equal to 0.
    if n <= 0
        %then we simply return 0 because the input doesn't make sense
        f = 0;
    %otherwise
    else
        %We pre-allocate f with zeros
        f = zeros(n,1);
        %Set f(1) to be f_1
        f(1) = 1;
        %Set f(2) to be f_2
        f(2) = 2;
        %Here we do the majority of the work
        for i = 3:n
            %This computes the next number in the fibonacci sequence
            f(i) = f(i-1) + f(i-2);
        end
        %We set the output to be the nth fibonacci number
        f = f(n);
    end
end