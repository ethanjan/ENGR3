%define the function DiseaseFreeODE_model
function xdot = DiseaseFreeODE_model(t,X)
%define all of the global variables
global kbirth kmature Dj Ds Dover
%define T to be the total of juveniles and adults
T = X(1) + X(2);
%define xdot to be the system of differential equations
xdot = [kbirth * X(2) - kmature * X(1) - Dj*X(1) - Dover*X(1)*T;
        kmature * X(1) - Ds * X(2) - Dover*X(2)*T];
end