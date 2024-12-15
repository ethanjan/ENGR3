function Xdot = pendulum(t,X)
Xdot = [X(2); -sin(X(1))];
end