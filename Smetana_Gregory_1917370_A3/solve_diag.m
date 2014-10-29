%Smetana_Gregory_1917370_A2_P4
function [ x ] = solve_diag( A, b )
%SOLVE_DIAG Solves the linear system Ax=b where A is nonsingular and
%diagonal

x = b ./ diag(A);

end

