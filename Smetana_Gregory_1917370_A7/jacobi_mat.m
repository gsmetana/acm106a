%Smetana_Gregory_1917370_A6_P3
function [ x, k ] = jacobi_mat( A, b, x0, tol, maxiterations )
%JACOBI_MAT jacobi method using matrices
n = length(b);

%% calculate update matrix
D = diag(A);
Lt = -tril(A,-1);
Ut = -triu(A,1);
Rj = diag(1./D) * (Lt + Ut);

c = diag(1./D) * b;

%rhoJ = max(abs(eig(Rj))) % output spectral radius

k = 0;
err = 1;
x = x0;
while k < maxiterations && err > tol
    x = Rj*x + c;
    err = norm(A*x - b)/norm(b);
    k=k+1;
end
