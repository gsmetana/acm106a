clear all;
close all;
clc;

d = [10, 100, 200, 1000];
x = [-1,-5, -10, -15, -20];
%% part a)
approx_a = zeros(5,4);
tictoc_a = zeros(5,4);

for i = 1:5
    for j = 1:4
        tic
        approx_a(i,j) = exp_p1a(x(i), d(j));
        tictoc_a(i,j) = toc;
    end
end
tictoc_a=tictoc_a*10^6;
% generate table of approximations
latextable([cellstr(num2str(abs(x'))), num2cell([approx_a(:,1),approx_a(:,2),exp(x')])], ...
            'Horiz',{'$x$','$d=10$','$d=100$','matlab'},...
            'name','report/table1a_approx1.tex',...
            'format','%10.15e')

latextable([cellstr(num2str(abs(x'))), num2cell([approx_a(:,3),approx_a(:,4),exp(x')])], ...
            'Horiz',{'$x$','$d=200$','$d=1000$','matlab'},...
            'name','report/table1a_approx2.tex',...
            'format','%10.15e')

% generate table of times
latextable([cellstr(num2str(abs(x'))), num2cell(tictoc_a)], ...
            'Horiz',{'$x$','$d=10$','$d=100$','$d=200$','$d=1000$'},...
            'name','report/table1a_tictoc.tex',...
            'format','%4.0f')     
        
%% part b

approx_b = zeros(5,4);
tictoc_b = zeros(5,4);


for i = 1:5
    for j = 1:4
        tic
        approx_b(i,j) = exp_p1b(x(i), d(j));
        tictoc_b(i,j) = toc;
    end
end
tictoc_b=tictoc_b*10^6;

% generate table of approximations
latextable([cellstr(num2str(abs(x'))), num2cell([approx_b(:,1),approx_b(:,2),exp(x')])], ...
            'Horiz',{'$x$','$d=10$','$d=100$','matlab'},...
            'name','report/table1b_approx1.tex',...
            'format','%10.15e')

latextable([cellstr(num2str(abs(x'))), num2cell([approx_b(:,3),approx_b(:,4),exp(x')])], ...
            'Horiz',{'$x$','$d=200$','$d=1000$','matlab'},...
            'name','report/table1b_approx2.tex',...
            'format','%10.15e')
        
% generate table of times
latextable([cellstr(num2str(abs(x'))), num2cell(tictoc_b)], ...
            'Horiz',{'$x$','$d=10$','$d=100$','$d=200$','$d=1000$'},...
            'name','report/table1b_tictoc.tex',...
            'format','%4.0f')     
        
 %% part c
 
approx_ac = zeros(5,4);
tictoc_ac = zeros(5,4);

for i = 1:5
    for j = 1:4
        tic
        approx_ac(i,j) = exp_p1a(-x(i), d(j));
        approx_ac(i,j) = 1/approx_ac(i,j);
        tictoc_ac(i,j) = toc;
    end
end
tictoc_ac=tictoc_ac*10^6;

% generate table of approximations
latextable([cellstr(num2str(abs(x'))), num2cell([approx_ac(:,1),approx_ac(:,2),exp(x')])], ...
            'Horiz',{'$x$','$d=10$','$d=100$','matlab'},...
            'name','report/table1ac_approx1.tex',...
            'format','%10.15e')

latextable([cellstr(num2str(abs(x'))), num2cell([approx_ac(:,3),approx_ac(:,4),exp(x')])], ...
            'Horiz',{'$x$','$d=200$','$d=1000$','matlab'},...
            'name','report/table1ac_approx2.tex',...
            'format','%10.15e')

% generate table of times
latextable([cellstr(num2str(abs(x'))), num2cell(tictoc_ac)], ...
            'Horiz',{'$x$','$d=10$','$d=100$','$d=200$','$d=1000$'},...
            'name','report/table1ac_tictoc.tex',...
            'format','%4.0f') 
        
approx_bc = zeros(5,4);
tictoc_bc = zeros(5,4);

for i = 1:5
    for j = 1:4
        tic
        approx_bc(i,j) = exp_p1b(-x(i), d(j));
        approx_bc(i,j) = 1/approx_bc(i,j);
        tictoc_bc(i,j) = toc;
    end
end
tictoc_bc=tictoc_bc*10^6;

% generate table of approximations
latextable([cellstr(num2str(abs(x'))), num2cell([approx_bc(:,1),approx_bc(:,2),exp(x')])], ...
            'Horiz',{'$x$','$d=10$','$d=100$','matlab'},...
            'name','report/table1bc_approx1.tex',...
            'format','%10.15e')

latextable([cellstr(num2str(abs(x'))), num2cell([approx_bc(:,3),approx_bc(:,4),exp(x')])], ...
            'Horiz',{'$x$','$d=200$','$d=1000$','matlab'},...
            'name','report/table1bc_approx2.tex',...
            'format','%10.15e')

% generate table of times
latextable([cellstr(num2str(abs(x'))), num2cell(tictoc_bc)], ...
            'Horiz',{'$x$','$d=10$','$d=100$','$d=200$','$d=1000$'},...
            'name','report/table1bc_tictoc.tex',...
            'format','%4.0f') 