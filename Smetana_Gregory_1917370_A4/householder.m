%Smetana_Gregory_1917370_A4_P3
function [U,R] = householder( A )
%HOUSEHOLDER performs triangularization of A
[m, n]= size(A);
U = zeros(m,n);
R = A;
for i = 1:min(m-1,n)
    % Extract the i-th column of A(i : m; i : n)
    x = R(i:m,i);
    e = zeros(length(x),1);
    e(1) = 1;
    % Compute direction ui
    u = sign(x(1))*norm(x)*e + x;
    % Normalize ui
    u = u./ norm(u);
    % Update A(i : m; i : n):
    R(i:m, i:n) = R(i:m,i:n)- 2*u*u'*R(i:m,i:n);
    U(i:m,i)= u;
end
% force triangular format
R = triu(R);

