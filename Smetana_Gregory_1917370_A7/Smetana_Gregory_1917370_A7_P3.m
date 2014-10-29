%Smetana_Gregory_1917370_A6_P3
clear;
clc;
close all;
path(path,'export_fig/');

A = [3, -5, 2;
    5, 4, 3;
    2, 5, 3 ];

b = [1;1;1];

xc = A\b;

x0=[0;0;0];
tol = 1E-3;
maxiterations = 100;

tic
for i = 1:1000
    [xjmat, kjmat] = jacobi_mat(A,b,x0, tol, maxiterations);
end
tjmat = toc
kjmat
xjmat_err = norm(xc - xjmat)/norm(xc)

tic
for i = 1:1000
    [xjseq, kjseq] = jacobi_seq(A,b,x0, tol, maxiterations);
end
tjseq = toc
kjseq
xjseq_err = norm(xc- xjseq)/norm(xc)

tic
for i = 1:1000
    [xgsmat, kgsmat] = gs_mat(A,b,x0, tol, maxiterations);
end
tgsmat = toc
kgsmat
xgsmat_err = norm(xc-xgsmat)/norm(xc)

tic
for i = 1:1000
    [xgsseq, kgsseq] = gs_seq(A,b,x0, tol, maxiterations);
end
tgsseq = toc
kgsseq
xgsseq_err = norm(xc - xgsseq)/norm(xc)

b = [2;9;3]
xc = A\b;
x0=[6;4;3]


[xjmat, kjmat] = jacobi_mat(A,b,x0, tol, maxiterations);
xjmat_err = norm(xc - xjmat)/norm(xc)

[xjseq, kjseq] = jacobi_seq(A,b,x0, tol, maxiterations);
xjseq_err = norm(xc- xjseq)/norm(xc)

[xgsmat, kgsmat] = gs_mat(A,b,x0, tol, maxiterations);
xgsmat_err = norm(xc-xgsmat)/norm(xc)

[xgsseq, kgsseq] = gs_seq(A,b,x0, tol, maxiterations);
xgsseq_err = norm(xc - xgsseq)/norm(xc)

b = [4;7;1]
xc = A\b;
x0=[5;0;2]


[xjmat, kjmat] = jacobi_mat(A,b,x0, tol, maxiterations);
xjmat_err = norm(xc - xjmat)/norm(xc)

[xjseq, kjseq] = jacobi_seq(A,b,x0, tol, maxiterations);
xjseq_err = norm(xc- xjseq)/norm(xc)

[xgsmat, kgsmat] = gs_mat(A,b,x0, tol, maxiterations);
xgsmat_err = norm(xc-xgsmat)/norm(xc)

[xgsseq, kgsseq] = gs_seq(A,b,x0, tol, maxiterations);
xgsseq_err = norm(xc - xgsseq)/norm(xc)

b = [7;9;8]
xc = A\b;
x0=[2;5;6]


[xjmat, kjmat] = jacobi_mat(A,b,x0, tol, maxiterations);
xjmat_err = norm(xc - xjmat)/norm(xc)

[xjseq, kjseq] = jacobi_seq(A,b,x0, tol, maxiterations);
xjseq_err = norm(xc- xjseq)/norm(xc)

[xgsmat, kgsmat] = gs_mat(A,b,x0, tol, maxiterations);
xgsmat_err = norm(xc-xgsmat)/norm(xc)

[xgsseq, kgsseq] = gs_seq(A,b,x0, tol, maxiterations);
xgsseq_err = norm(xc - xgsseq)/norm(xc)