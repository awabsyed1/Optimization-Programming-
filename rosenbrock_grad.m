function y = rosenbrock_grad(x)
%file name:  Rosenbrock_grad.m
%This is the gradient of the Rosenbrock function
y(1) = 100*(2*(x(1)^2-x(2))*2*x(1)) + 2*(x(1)-1);
y(2) = 100*(-2*(x(1)^2-x(2)));
[n,m]= size(x);
if m == 1
   y = y';
end