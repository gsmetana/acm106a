%Smetana_Gregory_191737_A2_P4
clear;
clc;

nn=[10,100,500];
t_alg = zeros(1,25);
t_matlab = zeros(1,25);
residual = zeros(1,25);
for n=nn
for(i=1:25)
%initialize
A = eye(n);
idx = randperm(n);
A=A(idx,:);
b=rand(n,1);
u = rand(n,1);
v = rand(n,1);

% solve using sherman morrison
tic;
xt= sherman_morrison(A,u,v,b);
t_alg(i) = toc;

% solve using backslash
At = A + u*v';
tic;
x = At\b;
t_matlab(i) = toc;

residual(i) = norm(xt-x);
end;

% output results
disp(['n = ',num2str(n)])
disp(['residual = ',num2str(mean(residual)),...
    '(',num2str(std(residual)),')'])
disp(['t_alg = ',num2str(mean(t_alg*10^6)),...
    '(',num2str(std(t_alg*10^6)),') [microsecond]'])
disp(['t_matlab = ',num2str(mean(t_matlab*10^6)),...
    '(',num2str(std(t_matlab*10^6)),') [microsecond]'])
end;