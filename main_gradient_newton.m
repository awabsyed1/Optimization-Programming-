% The function is defined in the file 'Rosenbrock.m'.
% The gradient is given in the file 'Rosenbrock_grad.m'.
% The hessian is given in the file 'Rosenborck_hessian.m'
% The terminates when the norm of the gradient is less than a given small
%   number 'epsilon'(0.0001).
clc, clear; 
%-----------------------Initial Conditions-------------------------------%
x0 = [5,5]'; %Initial value 
[m,n] = size(x0);
if m == 1 
    x0 = x0';
end
%---------------------Armijo Rule ---------------------------------------%
tao = 0.5;
beta = 0.4;
epsilon = 0.0001;
obj = rosenbrock(x0); %gives the smallest value of the objec func
gradient = rosenbrock_grad(x0);   %Gradient 
hessian = rosenbrock_hessian(x0); %Hessian 
[x, A, Iterate] = newton_armijo(x0, tao, beta, obj, gradient, hessian, ...
    epsilon);
f = rosenbrock(x(end,:)); %Final value of F(x)
%-------------------------Results-----------------------------------------%
xf = [x0';x];
figure (2) 
plot(xf(:,1),xf(:,2),'-o');
grid on 
 for i = 1:length(xf)
     objlog(i) = rosenbrock(xf(i,:));
 end
Afinal = [1;A];
results(:,1:2) = xf;
resultss(:,3) = objlog';
fprintf('Step Size to generate x = %5i\n',Afinal(end,1))