function y = rosenbrock_hessian(x)
%file name:  rosenbrock_hessian.m
%This is the Hessian of the Rosenbrock function
y(1,1) = 100*(8*x(1)^2+4*(x(1)^2-x(2)))+2;
y(1,2) = 100*(-4*x(1));
y(2,1) = 100*(-4*x(1));
y(2,2) = 200;
[n,m] = size(x)
if m == 1 
    y = y';
end 