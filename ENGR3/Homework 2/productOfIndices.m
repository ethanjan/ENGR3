A = zeros(5,6);
for i = 1:5
    for j = 1:6
        A(i,j) = i * j - 1;
    end
end
disp(A)