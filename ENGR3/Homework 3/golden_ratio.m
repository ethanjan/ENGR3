function n = golden_ratio()
    %define the count variable that will be used to track which term in the
    %sequence gives the desired accuracy. We must start at 3 because that is
    %when we can start computing the differences between ratios.
    %for example, we start with f_3/f_2 - f_2/f_1
    n = 3;
    %define f_1
    x = 1;
    %define f_2
    y = 2;
    %define f_3
    z = x+y;
    %we keep iterating until the difference between successive ratios is
    %sufficiently small
    while abs(y/x - z/y) > 1e-9
        %compute f_{n-2}
        x = y;
        %compute f_{n-1}
        y = z;
        %compute f_n
        z = x+y;
        %increment the count
        n = n + 1;
    end
end

