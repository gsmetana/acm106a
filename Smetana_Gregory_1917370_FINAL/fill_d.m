function [ M ] = fill_d( M )
%FILL_D fills unknown entries of M with average of column and row averages

rowavg = sum(M,2)./sum(M>0,2);
colavg = sum(M,1)./sum(M>0,1);
z = find(M<1);
[i,j] = ind2sub(size(M),z);
for k = 1:length(i)
    M(i(k), j(k)) = 1/2*(rowavg(i(k)) + colavg(j(k)));
end

end

