function u = zombie(t,X)
global mu delta beta gamma
u = [mu*X(1) - beta * X(1) * X(2) - delta*X(1); -gamma * X(1) * X(2) + beta * X(1) * X(2)];
end