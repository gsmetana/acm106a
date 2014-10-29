% Smetana_Gregory_1917370_A1_P1

function [ exp ] = exp_p1a( x, d )
%exp_p1a Computes exp(x) by summing d terms of Taylor series
exp=0;
for n=0:d
    exp = exp + x^n/factorial(n);
end
end

