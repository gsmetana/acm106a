function [ M ] = fill_b( M )
%FILL_B fills unknown entries of M with row average

[m,n]=size(M);
rowavg = sum(M,2)./sum(M>0,2);
for i = 1:m
    M(i,M(i,:)<1) = rowavg(i);
end

end