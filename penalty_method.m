syms x2 x1
f =  x1^2 + x2^2;
g =  x1^2 - x2 + 1;
fcontour (f); hold on; 
fimplicit (g)
c = 1000;
x0 = [5,5]'; %Initial value 
[m,n] = size(x0);
if m == 1 
     x0 = x0';
end
%---------------------Armijo Rule ---------------------------------------%
tao = 0.5;
beta = 0.4;
epsilon = 0.0001;
obj = T_func(x0,c); %gives the smallest value of the objec func
gradient = T_grad(x0,c);   %Gradient %pen_grad
hessian = hessian_t(x0,c); %Hessian 
[x, A, Iterate] = newton_armijo1(x0,c, tao, beta, obj, gradient, hessian, ...
    epsilon);
f1 = T_func(x(end,:),c(end,:)); %Final value of F(x)

xf = [x0';x];
figure (2) 
plot(xf(:,1),xf(:,2),'-o');
grid on 
 for i = 1:length(xf)
     objlog(i) = T_func(xf(i,:),c);
 end
Afinal = [1;A];
%results(:,1:2) = xf;
results(:,3) = objlog';
fprintf('Step Size to generate x = %5i\n',Afinal(end,1))

%grad = gradient (f, [x1, x2])


%@(x1,x2)
% fimplicit (@(x,c) x(1)^2 - x(2) +1 ,'r'); hold on; 
% fcountour(@(x,c) fun + [c * P]); hold off 

% fun = @(x) x(1)^2 + x(2)^2;   %Objective function
% P = @(x) 1/2 * [max(0,cons(x))]^2
% c = 10
% newobj = @(x) fun + [c * P]
