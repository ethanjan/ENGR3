%The purpose of this function is to take a vector containing r1, r2, r3,
%and v as inputs and to return an output vector which contains the values
%of i1, i2, i3, and i4 (in that order).
function x = circuit(r1,r2,r3,v)
%define the matrix A that will be used for computations. This matrix comes
%from the problem statement
A = [1 -1 -1 0; 0 1 1 -1; r1 0 r3 0; r1 r2 0 0];
%define the column vector b that will be used for computations. This column
%vector also comes from the problem statement
b = [0 0 v v]'; %we add the apostrophe to ensure that it is a column vector
%we compute the answer as follows
x = A\b;
end