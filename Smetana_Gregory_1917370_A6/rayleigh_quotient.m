function [ rho, x , error] = rayleigh_quotient( A, x0, D)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

rho = x0'* A *x0/(x0'*x0);
i = 1;
x = x0;
n = size(A,1);
error=zeros(8,1);
while i <= 8
    y = (A - rho*eye(n))\x;
    x = y / norm(y);
    rho = x'*A *x / (x'*x);
    error(i) = min(abs(rho-D)) + 10^-16;
    i = i+1;
end

