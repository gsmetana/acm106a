function [ x, k ] = gs_seq( A, b, x0, tol, maxiterations )
%GS_SEQ gauss-seidel method using for loops

n = length(b);
  
k = 0;
err = 1;
x = x0;

while k < maxiterations && err > tol
  for i = 1 : n
    sigma =0;
    for j = 1:n
        if j ~= i
            sigma = sigma + A(i,j)*x(j);
        end
    end
    x(i) = (b(i)-sigma)/A(i,i);
  end
  err = norm(A*x - b)/norm(b);
  k=k+1;
end