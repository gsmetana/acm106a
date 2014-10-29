%Smetana_Gregory_1917370_A5_P4
A = [5, -1, 0, 0;
    -1, 5,  -1,0;
    0, -1, 5, -1;
    0, 0, -1, 5];
format compact;
display('qr_iteration.m')
diag(qr_iteration(A))
display('qr_shift.m')
diag(qr_shift(A))
display('eig')
eig(A)
display('qr_wilkinson.m');
diag(qr_wilkinson(A))