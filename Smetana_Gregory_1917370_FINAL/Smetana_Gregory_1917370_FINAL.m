%Smetana_Gregory_1917370_FINAL

clear;
clc;
close all;
path(path,'export_fig/');

%% Load data
M = load('movies.mat','movies_train');
M = full(M.movies_train);
T = load('movies.mat','movies_test');
T = full(T.movies_test);
[m,n]=size(M);

%% Fill in unknown entries
M_a = fill_a(M);
M_b = fill_b(M);
M_c = fill_c(M);
M_d = fill_d(M);

%% Compute SVD for k=25
 
[U_a, S_a, V_a, svs_a] = partial_svd(M_a,25);
[U_b, S_b, V_b, svs_b] = partial_svd(M_b,25);
[U_c, S_c, V_c, svs_c] = partial_svd(M_c,25);
[U_d, S_d, V_d, svs_d] = partial_svd(M_d,25);

%% Timing
kt = [5,10,15,20];
t_a = zeros(4,1);
t_b = zeros(4,1);
t_c = zeros(4,1);
t_d = zeros(4,1);
for i = 1:4
    tic
    partial_svd(M_a,kt(i));
    t_a(i) = toc;
    
    tic
    partial_svd(M_b,kt(i));
    t_b(i) = toc;
    
    tic
    partial_svd(M_c,kt(i));
    t_c(i) = toc;
    
    tic
    partial_svd(M_d,kt(i));
    t_d(i) = toc;
end

%% Plot 
Mk_a = zeros(m,n);
Mk_b = zeros(m,n);
Mk_c = zeros(m,n);
Mk_d = zeros(m,n);

f1 = figure;
hold all;
f2 =figure;
hold all;
for k=1:25
    Mk_a = Mk_a + U_a(:,k) * S_a(k) * V_a(:,k)';
    Mk_b = Mk_b + U_b(:,k) * S_b(k) * V_b(:,k)';
    Mk_c = Mk_c + U_c(:,k) * S_c(k) * V_c(:,k)';
    Mk_d = Mk_d + U_d(:,k) * S_d(k) * V_d(:,k)';

    figure(f1);

    plot(k, compute_rsme(T,Mk_a),'rx')
    plot(k, compute_rsme(T,Mk_b),'bo')
    plot(k, compute_rsme(T,Mk_c),'k*')
    plot(k, compute_rsme(T,Mk_d),'gx')
    
    figure(f2);
    
    plot(k, norm(Mk_a - M_a)/ norm(M_a), 'rx');
    plot(k,  norm(Mk_b - M_b)/ norm(M_b),'bo')
    plot(k,  norm(Mk_c - M_c)/ norm(M_c),'k*')
    plot(k, norm(Mk_d - M_d)/ norm(M_d),'gx') 
    
end

f3 = figure;
hold all;
for i=1:length(svs_a)
    plot(i, svs_a(:,i),'x')
end
set(gca,'yscale','log')

f4 = figure;
hold all;
for i=1:length(svs_b)
    plot(i, svs_b(:,i),'x')
end
set(gca,'yscale','log')

f5 = figure;
hold all;
for i=1:length(svs_c)
    plot(i, svs_c(:,i),'x')
end
set(gca,'yscale','log')

f6 = figure;
hold all;
for i=1:length(svs_d)
    plot(i, svs_d(:,i),'x')
end
set(gca,'yscale','log')
%%
f7 = figure;
hold all;
plot(kt, t_a,'rx')
plot(kt, t_b,'bo')
plot(kt, t_c,'k*')
plot(kt, t_d,'gx')

%% label plots
figure(f1)
h_legend = legend('fill a','fill b','fill c','fill d','Location','best');
set(h_legend,'FontSize',12);
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('RSME of prediction error','FontSize',12);
title('RSME of prediction error', 'FontSize',12);
filename = ['report/rsme.pdf'];
export_fig(filename)


figure(f2)
h_legend = legend('fill a','fill b','fill c','fill d','Location','best');
set(h_legend,'FontSize',12);
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('Relative error','FontSize',12);
title('Relative error', 'FontSize',12);
filename = ['report/relative.pdf'];
export_fig(filename)

figure(f3)
set(gca,'FontSize',12);
xlabel('Lanczos step','FontSize',12);
ylabel('Singular values','FontSize',12);
title('Fill-in method a', 'FontSize',12);
filename = ['report/sv_a.pdf'];
export_fig(filename)

figure(f4)
set(gca,'FontSize',12);
xlabel('Lanczos step','FontSize',12);
ylabel('Singular values','FontSize',12);
title('Fill-in method b', 'FontSize',12);
filename = ['report/sv_b.pdf'];
export_fig(filename)

figure(f5)
set(gca,'FontSize',12);
xlabel('Lanczos step','FontSize',12);
ylabel('Singular values','FontSize',12);
title('Fill-in method c', 'FontSize',12);
filename = ['report/sv_c.pdf'];
export_fig(filename)

figure(f6)
set(gca,'FontSize',12);
xlabel('Lanczos step','FontSize',12);
ylabel('Singular values','FontSize',12);
title('Fill-in method d', 'FontSize',12);
filename = ['report/sv_d.pdf'];
export_fig(filename)
%%
figure(f7)
h_legend = legend('fill a','fill b','fill c','fill d','Location','best');
set(h_legend,'FontSize',12);
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('time [s]','FontSize',12);
title('Computation time', 'FontSize',12);
filename = ['report/time.pdf'];
export_fig(filename)

%% save
save('workspace.mat','M_a', 'M_b', 'M_c', 'M_d',...
  'S_a', 'S_b', 'S_c', 'S_d', 'U_a', 'U_b', 'U_c',...
  'U_d', 'V_a', 'V_b', 'V_c', 'V_d');