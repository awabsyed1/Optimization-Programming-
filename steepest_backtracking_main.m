% This is to test the steepest descent (gradient) method using Armijo step-size rule.
% It terminates when the norm of the gradient is less than a given small number 'epsilon'(>0).
% The function is defined in the file 'Rosenbrock.m'.
% The gradient is given the file 'Rosenbrock_grad.m'.

clc,
clear,

n=2;          %  the number of variables;
x0 = [2,-2]';  %  the initial point x0 = [0;0];

% Armijo stepsize rule parameters
  tao  = 0.5;
  epsilon = 1.0e-004;
  
  obj = rosenbrock(x0);
    g = rosenbrock_grad(x0);
    
  [x, A, Iterate]= steepest_backtracking(x0, tao, obj, g, epsilon);
  
  xf = [x0';x];
  
  pause,
 f = rosenbrock(x(end,:));
  figure,
  plot(xf(:,1),xf(:,2),'-o'); grid;