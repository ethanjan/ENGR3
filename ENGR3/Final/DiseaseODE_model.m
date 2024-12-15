%Here we define the function for the Disease ODE model
function xdot = DiseaseODE_model(t,X)
%define all the global variables
global kbirth kmature Dj Ds Dover Iinfected Idiseased Tincubation Tprogression De Di Dd
%define T for convenience
T = X(1) + X(2) + X(3) + X(4) + X(5);
xdot = [
    kbirth*(X(2) + X(3) + X(4)) - kmature * X(1) - Dj * X(1) - Dover*X(1)*T;
    kmature * X(1) - Iinfected * X(2) * X(4) - Idiseased * X(2) * X(5) - Ds * X(2) - Dover * X(2) * T;
    Iinfected * X(2) * X(4) + Idiseased * X(2) * X(5) - Tincubation * X(3) - De * X(3) - Dover*X(3)*T;
    Tincubation * X(3) - Tprogression * X(4) - Di * X(4) - Dover * X(4) * T;
    Tprogression * X(4) - Dd * X(5) - Dover * X(5) * T;
    ];
end