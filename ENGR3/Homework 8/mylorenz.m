function u = mylorenz(t,X)
global sigma rho beta
u = [sigma*(X(2)-X(1)); X(1)*(rho - X(3)) - X(2); X(1)*X(2) - beta*X(3)];
end