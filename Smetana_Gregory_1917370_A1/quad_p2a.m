% Smetana_Gregory_1917370_A1_P2

function [ xp ] = quad_p2a( a, b, c )
%QUAD_P2A Computes the positive root of quadratic polynomial 
% ax^2 + 2bx + c = 0 using the standard formula

xp = (-b + sqrt(b.^2 -a*c))/a;

end

