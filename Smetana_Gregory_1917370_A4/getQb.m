%Smetana_Gregory_1917370_A4_P3
function [ Qb ] = getQb( b, U )
%GETQB Computes the product Q'b
[m,n] = size(U);
for i=1:n
    u = U(i:m,i);
    g = -2 * u' * b(i:m);
    b(i:m) = b(i:m) + g*u;
end
Qb = b;
