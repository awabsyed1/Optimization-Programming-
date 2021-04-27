clc; clear; 
c = 1000; %parameter c 
rng default %output of stochastic process remains the same 
Function = @(x) T_func(x,c); %New objective fuction 
lb = [-50, -50];
ub = [50,50];
n = 2 ;
x0 = [5 , 5]';  %Attained from Question 2
tic
[x,fval,eflag,output] = ga(Function,n,[],[],[],[],lb,ub)
time_ga = toc
tic
[x1,fval_1,eflag_1,output_1] = particleswarm (Function,n,lb,ub)
time_pso = toc
tic
[x2,fval_2,eflag_2,output_2] = simulannealbnd(Function,x0,lb,ub)
time_annealing = toc

Fval = [fval,fval_1,fval_2]';
NumEval = [output.funccount,output_1.funccount,output_2.funccount]
Solver = {'ga';'particleswarm';'simulated annealing'};
figure 
hold on 
for ii = 1:length(Fval)
    clr = rand(1,3) 
    plot(NumEval(ii),Fval(ii),'o','MarkerSize',10,'MarkerEdgeColor',clr,'MarkerFaceColor',clr) ;
    text(NumEval(ii),Fval(ii),Solver{ii},'Color',clr); 
end
ylabel('Fval')
xlabel('NumEval')
title('Reported Minimum and Evaluations by Solver')
hold off 
%funccount
