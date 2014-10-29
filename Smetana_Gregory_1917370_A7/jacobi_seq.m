%Smetana_Gregory_1917370_A6_P3
function [ x, k ] = jacobi_seq( A, b, x0, tol, maxiterations )
%JACOBI_SEQ jacobi method using for loops


n = length(b);
  
k = 0;
err = 1;
x = x0;

while k < maxiterations && err > tol
  x_new = zeros ( n, 1 );   
  for i = 1 : n
    sigma =0;
    for j = 1:n
        if j ~= i
            sigma = sigma + A(i,j)*x(j);
        end
    end
    x_new(i) = (b(i)-sigma)/A(i,i);
  end
  x = x_new;
  err = norm(A*x - b)/norm(b);
  k=k+1;
end