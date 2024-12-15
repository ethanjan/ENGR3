%Easy way is with nchoosek
%fprintf('Number of ways to form a committee of 3: %d\n', nchoosek(30,3))

%calculating with a for loop.
%set count to be 0
count = 0;
for i = 1:30
    for j = i+1:30
        for k = j+1:30
            %for every way of obtaining a committee, increment count by one
            count = count+1;
        end
    end
end
%print the number of committees
fprintf('Number of ways to form a committee of 3: %d\n', count)