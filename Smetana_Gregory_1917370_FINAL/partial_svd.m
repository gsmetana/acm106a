function [U,S,V, svs] = partial_svd( A, k )
%PARTIAL_SVD calculate rank-k approximation of A

[V,D, ev] = partial_eig(A'*A,k);
S = D.^.5;
svs = ev.^.5;
U = A* V;
for i = 1:k
    U(:,i) = U(:,i)/S(i);
end

end