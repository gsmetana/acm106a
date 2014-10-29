% Smetana_Gregory_1917370_A1_P1


function [ exp ] = exp_p1b( x, d )
%exp_p1a Computes exp(x) through recursion

exp = 0;
for i=d:-1:1
    exp = (exp*x/i + 1);
end

end

