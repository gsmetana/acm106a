function [ Anew ] = qr_wilkinson( A )
%QR_WILKINSON
i = 0;
tol = 10^-6;
err = 1;
Aold = A;
n = size(A,1);
 while i < 1E6 && err > tol
    B = A(n-1:n, n-1:n);
    d = (B(1,1)-B(2,2))/2;
    if( d >= 0)
        sigma = B(2,2) + d - sqrt(B(1,2)^2 + d^2);
    else
        sigma = B(2,2) + d + sqrt(B(1,2)^2 + d^2);
    end

    [Q,R] = qr(Aold - sigma*eye(n));
    Anew = R*Q + sigma*eye(n);

    i = i+1;
    err = max(diag(Anew - Aold));
    Aold = Anew;
 end
 i