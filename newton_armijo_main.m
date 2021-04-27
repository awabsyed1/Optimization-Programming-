% This is to test the newton method using Armijo step-size rule.
% It terminates when the norm of the gradient is less than a given small number 0.0001.
% The function is defined in the file 'Rosenbrock.m'.
% The gradient is given the file 'Rosenbrock_grad.m'.
% The hessian is given the file 'Rosenborck_hessian.m'

%NOTE: Most vairables / codes are defined in the main 'q2.m' file

inverse_hessian = inv(rosenbrock_hessian(x0))