function [ V, D ] = symtri_eig( a, b, tol, maxiterations )
%SYMTRI_EIG eigenvectors and eigenvalues of symmetric tridiagonal matrix
% variable a is on the diagonal, b is above/below

if nargin < 4
    maxiterations = 100;
    tol = 1E-6;
end

n = length(a);
c = zeros ( 1, n );
s = zeros ( 1, n );
V = eye(n);
shift =0;

for current = n:-1:2

    iteration = 0;
    while( abs(b(current-1)) > tol && iteration < maxiterations)
        
        % wilkinson shift (p213)
        d = (a(current-1)-a(current))/2;
        if( d >= 0)
            sigma = a(current) + d - sqrt(b(current-1)^2 + d^2);
        else
            sigma = a(current) + d + sqrt(b(current-1)^2 + d^2);
        end
        shift = shift + sigma;
        a(1:current) = a(1:current) - sigma;

        % implicit single shift QR (p169)
        b_old = b(1);
        for i = 2:current
            % givens rotation (p122)
            root = sqrt ( a(i-1)^2 + b_old^2 );
            c(i) = a(i-1) / root;
            s(i) = - b_old / root;     
            product = [c(i) -s(i); s(i) c(i)] * [a(i-1) b(i-1); b(i-1) a(i)];  
            a(i-1)=root;
            b(i-1)=product(1,2);
            a(i) = product(2,2);            
            if ( i < current ) 
                b_old = b(i); 
                b(i) = c(i)*b(i);
            end;
        end;
        
        a(1) = c(2)*a(1) - s(2)*b(1);
        b(1) = -s(2)*a(2);
        
        for i = 2:current-1
            a(i) = -s(i+1)*b(i) + c(i)*c(i+1)*a(i);
            b(i) = -s(i+1)*a(i+1);
        end;
        a(current) = c(current)*a(current);

       for i = 2 : current
           first = V(:,i-1) * c(i) - V(:,i) * s(i);
           V(:,i) = s(i) * V(:,i-1) + c(i) * V(:,i);
           V(:,i-1) = first;
       end;

       iteration = iteration + 1;
    end;
    D(current) = a(current)+ shift;
end
D(1) = a(1)+ shift;

