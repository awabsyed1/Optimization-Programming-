% This is to test the steepest descent (gradient) method with a constant step-size.
% It terminates when the norm of the gradient is less than 
%      a given small positive number 'epsilon'.
% The function is defined in the file 'Rosenbrock.m'.
% The gradient is given the file 'Rosenbrock_grad.m'.

clc,
clear,

n=2;               % number of variables
x0 = [2,-2]';        % inital condiation
a = 1.0e-003;      % constant step-size
epsilon =1.0e-004; % stop search when the norm of the gradient is less than this nimber.

  obj = rosenbrock(x0);
    g = rosenbrock_grad(x0);
  [x, Iterate]= steepest_gradient(x0, a, obj, g, epsilon);
  
  xf = [x0';x];
  
  pause,
 
  figure,
  plot(xf(:,1),xf(:,2),'-o'); grid;