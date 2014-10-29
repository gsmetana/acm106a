%Smetana_Gregory_191737_A2_P4

function [ x ] = sherman_morrison( A, u, v, b )
%SHERMAN_MORRISON Solves A_t * x = b if A is an orthogonal matrix and
% A_t = A + u*v'

y = A'*b;
z = A'*u;
r = v'*y;
t = v'*z;
x = y - z*r/(1+t);
end

