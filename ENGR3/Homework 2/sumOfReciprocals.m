value = pi^2/6;
sum = 0;
N = 0;
while abs(sum - value) >= 0.01
    N = N+1;
    sum = sum + 1/N^2;
end
disp(N)