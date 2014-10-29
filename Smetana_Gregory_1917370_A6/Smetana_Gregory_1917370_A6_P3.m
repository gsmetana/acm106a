%Smetana_Gregory_1917370_A6_P3
clear;
clc;
close all;
path(path,'export_fig/');

%% part a
U = orth(rand(4,4));
D = diag([2,4,13,27]);
A = U * D * U';

x1 = 10*U(:,1)+ rand*U(:,2)+rand*U(:,3)+rand*U(:,4);
x2 = rand*U(:,1)+ 10*U(:,2)+rand*U(:,3)+rand*U(:,4);
x3 = rand*U(:,1)+ rand*U(:,2)+10*U(:,3)+rand*U(:,4);
x4 = rand*U(:,1)+ rand*U(:,2)+rand*U(:,3)+10*U(:,4);

[rho1, v1, e1] = rayleigh_quotient(A, x1, diag(D));
[rho2, v2, e2] = rayleigh_quotient(A, x2, diag(D));
[rho3, v3, e3] = rayleigh_quotient(A, x3, diag(D));
[rho4, v4, e4] = rayleigh_quotient(A, x4, diag(D));

display('part a');
[rho1,rho2,rho3,rho4]

figure;
hold all;
plot(e1,'x-');
plot(e2,'x-');
plot(e3,'x-');
plot(e4,'x-');

xlabel('iteration, i','FontSize',12);
ylabel('error |\rho^i-\lambda^*|','FontSize',12);
legend('\rho_1', '\rho_2', '\rho_3', '\rho_4');
title(['Rayleigh Quotient iteration, A=UDU^T'],'FontSize',16);

set(gca,'FontSize',12);
set(gca,'yscale','log')
filename = ['report/p3b.pdf'];
export_fig(filename)

figure;
hold all;
plot(log10(-log10(e1)),'x-');
plot(log10(-log10(e2)),'x-');
plot(log10(-log10(e3)),'x-');
plot(log10(-log10(e4)),'x-');

xlabel('iteration, i','FontSize',12);
ylabel('log(log( |\rho^i-\lambda^*|))','FontSize',12);
legend('\rho_1', '\rho_2', '\rho_3', '\rho_4');
title(['Rayleigh Quotient iteration, A=UDU^T'],'FontSize',16);

set(gca,'FontSize',12);
filename = ['report/p3blog.pdf'];
export_fig(filename)
%% part b
U = orth(rand(4,4));
V = orth(rand(4,4));
sigma = diag([10, 5+5*rand, 1+4*rand, 1]);
S = U * sigma * V'; % generate matrix with condition number = 10
A = S * D * inv(S);

x1 = 10*S(:,1)+ rand*S(:,2)+rand*S(:,3)+rand*S(:,4);
x2 = rand*S(:,1)+ 10*S(:,2)+rand*S(:,3)+rand*S(:,4);
x3 = rand*S(:,1)+ rand*S(:,2)+10*S(:,3)+rand*S(:,4);
x4 = rand*S(:,1)+ rand*S(:,2)+rand*S(:,3)+10*S(:,4);

[rho1, v1, e1] = rayleigh_quotient(A, x1, diag(D));
[rho2, v2, e2] = rayleigh_quotient(A, x2, diag(D));
[rho3, v3, e3] = rayleigh_quotient(A, x3, diag(D));
[rho4, v4, e4] = rayleigh_quotient(A, x4, diag(D));

display('part b');
[rho1,rho2,rho3,rho4]

figure;
hold all;
plot(e1,'x-');
plot(e2,'x-');
plot(e3,'x-');
plot(e4,'x-');

xlabel('iteration, i','FontSize',12);
title(['Rayleigh Quotient iteration, A=SDS^-^1'],'FontSize',16);
ylabel('error |\rho^i-\lambda^*|','FontSize',12);
legend('\rho_1', '\rho_2', '\rho_3', '\rho_4');
set(gca,'FontSize',12);
set(gca,'yscale','log')
filename = ['report/p3c.pdf'];
export_fig(filename)

figure;
hold all;
plot(log10(-log10(e1)),'x-');
plot(log10(-log10(e2)),'x-');
plot(log10(-log10(e3)),'x-');
plot(log10(-log10(e4)),'x-');

xlabel('iteration, i','FontSize',12);
ylabel('log(log( |\rho^i-\lambda^*|))','FontSize',12);
legend('\rho_1', '\rho_2', '\rho_3', '\rho_4');
title(['Rayleigh Quotient iteration,  A=SDS^-^1'],'FontSize',16);

set(gca,'FontSize',12);
filename = ['report/p3clog.pdf'];
export_fig(filename)
