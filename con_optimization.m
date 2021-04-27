%-----------MATLAB function, 'fmincon' for constrained optimization------%
%   Minimizing using 'fmincon' 
%-------------Upper & Lower Bound ------------------------------------%
lb = [];  %lower bound 
ub = []; % upper bound 
%---------------------------------Initial value-----------------------%
x0 = [5,-5];  %Initial value 
lb = [];
ub = [];
%----------------------------Contraints -------------------------------%
A = [];
b = [];
Aeq = [];
beq = [];
confun = @con_fun;
fun = @objfun;
[x,fval, eflag,output] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,confun)