%Smetana_Gregory_1917370_A2_P4
clear;
clc;
n = 1000;
t_alg = zeros(25,1);
t_0 = zeros(25,1);
t_1 = zeros(25,1);
t_2 = zeros(25,1);
t_3 = zeros(25,1);
t_4 = zeros(25,1);
t_5 = zeros(25,1);


for( i = 1:25);
    A = diag(rand(n,1));
    b = rand(n,1);

    tic;
    solve_diag(A,b);
    t_alg(i) = toc;
    
    tic;
    A\b;
    t_0(i) = toc;
    
    %% part 1
    beta = 10^-15;
    e1 = [1; zeros(n-1,1)];
    e2 = [0 ; 1; zeros(n-2,1)];
    E1 = e1 * e2';
    A1 = A + beta * E1;
    
    tic;
    A1\b;
    t_1(i) = toc;
    %% part 2
    E2 = E1 + E1';
    A2 = A + beta * E2;

    tic;
    A2\b;
    t_2(i) = toc;
    %% part 3
    E3 = triu(rand(n));
    A3 = A + beta * E3;

    tic;
    A3\b;
    t_3(i) = toc;
    %% part 4
    E4 = rand(n);
    E4 = (E4 + E4')/2;
    A4 = A + beta * E4;

    tic;
    A4\b;
    t_4(i) = toc;
    %% part 5
    E5 = rand(n);
    A5 = A + beta * E5;
    
    tic;
    A5\b;
    t_5(i) = toc;
end;

%% output results
disp(['t_alg = ',num2str(mean(t_alg*10^6)),...
    '(',num2str(std(t_alg*10^6)),') [microsecond]'])
disp(['t_0 = ',num2str(mean(t_0*10^6)),...
    '(',num2str(std(t_0*10^6)),') [microsecond]'])
disp(['t_1 = ',num2str(mean(t_1*10^6)),...
    '(',num2str(std(t_1*10^6)),') [microsecond]'])
disp(['t_2 = ',num2str(mean(t_2*10^6)),...
    '(',num2str(std(t_2*10^6)),') [microsecond]'])
disp(['t_3 = ',num2str(mean(t_3*10^6)),...
    '(',num2str(std(t_3*10^6)),') [microsecond]'])
disp(['t_4 = ',num2str(mean(t_4*10^6)),...
    '(',num2str(std(t_4*10^6)),') [microsecond]'])
disp(['t_5 = ',num2str(mean(t_5*10^6)),...
    '(',num2str(std(t_5*10^6)),') [microsecond]'])
