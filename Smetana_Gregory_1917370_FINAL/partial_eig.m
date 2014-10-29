function [ Vk, Dk, evs ] = partial_eig( A, k, tol, maxiterations)
%PARTIAL_EIG iteratively computes the partial eigendecomposition of a
%symmetric matrix

if nargin < 4
    maxiterations = 500;
    tol = 1E-6;
end

[n,~]=size(A);
qj = rand(n,1);
qj = qj/norm(qj);
Q = qj;

i=0;
err = 1E9;
while i < maxiterations && err > tol
  i = i+1;
  
  z = A*qj;
  alpha(i) = qj'*z;
  % reorthogonalize twice
  z = z - Q*(Q'*z);
  z = z - Q*(Q'*z);
  beta(i) = norm(z);
  
  qj = z/beta(i);
  Q = [Q,qj];
  
  % compute ritz values/vectors
  [V,D] = symtri_eig(alpha, beta(1:i-1));
  if(nargout > 2 )
    evs(1:i,i) = D;
  end
  if( i > k)
    err = beta(i)*norm(V(i,k));
  end
  
end
Vk = Q(:,1:i) * V;   
Vk = Vk(:,1:k);   % return approx
Dk = D(1:k);
end

