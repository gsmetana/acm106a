function [ x, k ] = gs_mat( A, b, x0, tol, maxiterations )
%GS_MAT gauss-seidel method using matrices
n = length(b);

%% calculate update matrix
D = diag(A);
Lt = -tril(A,-1);
Ut = -triu(A,1);
Rgs = (diag(D) - Lt)\Ut;
c = (diag(D) - Lt)\ b;

%rhoGS = max(abs(eig(Rgs))) % output spectral radius

k = 0;
err = 1;
x = x0;
while k < maxiterations && err > tol
    x = Rgs*x + c;
    err = norm(A*x - b)/norm(b);
    k=k+1;
end
