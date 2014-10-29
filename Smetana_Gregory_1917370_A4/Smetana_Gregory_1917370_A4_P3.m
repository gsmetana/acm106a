%Smetana_Gregory_1917370_A4_P3
clear;
clc;
close all;
path(path,'export_fig/');
%solve normal equations A'*A = A'*b
n=51;
t = linspace(0, 1, n)';
b = sin(4 *t);
format longE
for m= [3,7,12]

A = zeros(n,m);

for(j = 1:m)
    A(:,j)= t.^(j-1);
end

%% part a

% factorize R' * R = A
tic;
R = chol(A'*A);
d = A'*b;
z = R'\d; % forward substitution
x_a = R\z % back substitution
t_a = toc * 1E6
r_a = norm(b - polyval(flipud(x_a),t))
cond_a = cond(A'*A)
%% part b
tic;
[U,R] = householder(A);
Qb = getQb(b, U);
x_b = R\Qb % back substitution
t_b = toc * 1E6
r_b = norm(b - polyval(flipud(x_b),t))
cond_b = cond(A)

%% plot
figure;
hold all;
plot(t,b)
plot(t,polyval(flipud(x_a),t),'+');
plot(t,polyval(flipud(x_b),t),'x');
xlabel('x','FontSize',12);
ylabel('f(x)','FontSize',12);
title(['f(x) and m=',num2str(m),' approximating polynomials'],'FontSize',16);
legend('f(x)', 'Cholesky', 'QR');
set(gca,'FontSize',12);
filename = ['report/p3_m=',num2str(m),'.pdf'];
export_fig(filename)
end;