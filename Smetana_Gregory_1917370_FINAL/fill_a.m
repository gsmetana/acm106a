function [ M ] = fill_a( M )
%FILL_A fills unknown entries of M with random integer between 1 & 5

z = find(M<1);
M(z) = ceil(5 * rand(length(z),1));

end

