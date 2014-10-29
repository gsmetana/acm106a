function [ M ] = fill_c( M )
%FILL_C fills unknown entries of M with column average

[m,n]=size(M);
colavg = sum(M,1)./sum(M>0,1);
for i = 1:n
    M(M(:,i)<1,i) = colavg(i);
end

end

