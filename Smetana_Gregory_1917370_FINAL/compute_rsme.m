function [ rsme ] = compute_rsme( T, M )
%RSME compute root mean square 

Ntest = sum(sum(T > 0)); % non zero entries;

z = find(T);
[i,j] = ind2sub(size(T),z);
rsme = 0;
for k = 1:length(i)
    rsme = rsme + (T(i(k),j(k)) - M(i(k),j(k)))^2;
end

rsme = sqrt(1/Ntest *rsme);
end

