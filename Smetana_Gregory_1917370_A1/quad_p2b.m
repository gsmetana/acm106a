% Smetana_Gregory_1917370_A1_P2

function [ xp ] = quad_p2b( a, b, c )
%QUAD_P2A Computes the positive root of quadratic polynomial using 
% ax^2 + 2bx + c = 0 using a modified formula

xp = c./(-b - sqrt(b.^2 -a*c));

end