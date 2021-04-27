%-----------MATLAB function, 'fmincon' for constrained optimization------%
%   Minimizing using 'fmincon' 
fun = @(x) x(1)^2 + x(2)^2;   %Objective function
%-------------Upper & Lower Bound ------------------------------------%
lb = [];  %lower bound 
ub = []; % upper bound 
%---------------------------------Initial value-----------------------%
x0 = [5,-5];  %Initial value 
A = [1 , -1];
B = -1;
opts = optimoptions(@fmincon,'Algorithm','interior-point');
problem = createOptimProblem('fmincon',...
    'x0',x0,'objective',fun,...
    'Aineq', A,'bineq',B,'options',opts)
[x,fval,eflag,output] = fmincon(problem)