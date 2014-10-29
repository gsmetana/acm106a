%Smetana_Gregory_1917370_A5_P4
function [ Anew ] = qr_iteration( A )
%QR_ITERATION 
i = 0;
tol = 10^-6;
err = 1;
Aold = A;

while i < 1E6 && err > tol
    [Q,R] = qr(Aold);
    Anew = R*Q;
    i = i+1;
    err = max(diag(Anew - Aold));
    Aold = Anew;
end
i
