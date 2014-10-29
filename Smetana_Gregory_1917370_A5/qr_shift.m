%Smetana_Gregory_1917370_A5_P4
function [ Anew ] = qr_shift( A )
%QR_SHIFT 
i = 0;
tol = 10^-6;
err = 1;
Aold = A;
n = size(A,1);

while i < 1E6 && err > tol
    sigma = A(n,n);
    [Q,R] = qr(Aold - sigma*eye(n));
    Anew = R*Q + sigma*eye(n);
    i = i+1;
    err = max(diag(Anew - Aold));
    Aold = Anew;
end
i