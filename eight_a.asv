%------------------Constrained minimization solver---------------------%
%------------------Initial Conditions----------------------------------%
A = [-1 0 0.0193 0 ; 0 -1 0.00954 0];
b = [0 ; 0];
Aeq = []; 
beq = [];
ub = [100, 100,200,200];
lb = [0, 0,10,10];
x0 = (ub + lb)/2; 
n = 4;
Function = @(x) objfunct (x);
%rng default%output of stochastic process remains the same(reproducibiility)
initpop  =10*rand(40,4) + repmat(x0,40,1); %40 by 4 matrix (population)
options = optimoptions('ga','InitialPopulationMatrix',initpop);
opts = optimoptions('particleswarm','InitialSwarmMatrix',initpop);
%-----------------------Functions---------------------------------------%
i = 1;
while i <= 9 
    tic
    [x,fval,eflag,output] = fmincon(@objfunct,x0,A,b,Aeq,beq,lb,ub,@confunct);
    time_fmin = toc;
    tic
    [x1,fval1,eflag_1,output_1] = ga(Function,n,A,b,Aeq,beq,lb,ub,@confunct,options);
    time_ga = toc;
    tic
    [x2,fval2,eflag_2,output_2] = particleswarm (Function,n,lb,ub,opts);
    time_particle = toc;
    Fval = [fval,fval1,fval2]';
    i = i +1;
end
%----------------Result of 'fmincon'-----------------------------------%
disp(---------------'Result using fmincon -----------------')
disp(['fmincon, x = ',num2str(x)])
disp (['final val (fmincon) = ',num2str(fval)])
disp (['Total iterations for each run',num2str(output.iterations)])
disp (['Execution time of each fmincon run',num2str(time_fmin)])
if eflag == 1
    disp (['exit flag = ',num2str(eflag)])
    disp('minimum found using fmincon')
else   
    disp('minimum not found using fmincon')
end
%-----------------Result of 'ga'---------------------------------------%
disp(---------------'Result using ga -----------------')
disp(['ga, x = ',num2str(x1)])
disp (['final val (ga) = ',num2str(fval1)])
disp (['Total iterations for each run',num2str(output_1.generations)])
disp (['Execution time of each ga run',num2str(time_ga)])
if eflag == 1
    disp (['exit flag = ',num2str(eflag_1)])
    disp('minimum found using ga')
else   
    disp('minimum not found using ga')
end
%-----------------------Particleswarm (PSO)-----------------------------%
disp(---------------'Result using PSO -----------------')
disp(['PSO, x = ',num2str(x2)])
disp (['final val (PSO) = ',num2str(fval2)])
disp (['Total iterations for each run',num2str(output_2.iterations)])
disp (['Execution time of each PSO run',num2str(time_particle)])
if eflag == 1
    disp (['exit flag = ',num2str(eflag_2)])
    disp('minimum found using PSO')
else   
    disp('minimum not found using PSO')
end
disp (['Number of runs for each method = ',num2str(10)])
%----------------------------Figure 1---------------------------------%
NumEval = [output.funcCount,output_1.funccount,output_2.funccount];
Solver = {'fmincon';'ga';'particleswarm'};
figure(1) 
hold on 
for ii = 1:length(Fval)
    clr = rand(1,3); 
    plot(NumEval(ii),Fval(ii),'o','MarkerSize',10,'MarkerEdgeColor',clr,'MarkerFaceColor',clr) ;
    text(NumEval(ii),Fval(ii),Solver{ii},'Color',clr); 
end
ylabel('Fval')
xlabel('NumEval')
title('Reported Minimum and Evaluation by Solver')
hold off 
 %--------------------------Figure 2---------------------------------%
Fval = [fval,fval1,fval2]';
NumEval = [output.iterations,output_1.generations,output_2.iterations];
Solver = {'fmincon';'ga';'particleswarm'};
figure (2) 
hold on 
for ii = 1:length(Fval)
    clr = rand(1,3); 
    plot(NumEval(ii),Fval(ii),'o','MarkerSize',10,'MarkerEdgeColor',clr,'MarkerFaceColor',clr) ;
    text(NumEval(ii),Fval(ii),Solver{ii},'Color',clr); 
end
ylabel('Fval')
xlabel('Iteration No.')
title('Reported Minimum and Iteration No.')
hold off 