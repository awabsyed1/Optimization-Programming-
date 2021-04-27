function [Solution, A, Iterate] = newton_armijo(x, tao, beta, obj, gradient, hessian, epsilon)
%Terminates when norm of the gradient is less than 0.0001
%Gradient and hessian define in rosenbrock_gradient & rosenbrock_hessian
k = 1 %index of iterations 
while norm (gradient) > epsilon
    d = -inv(hessian) * gradient;
    a = 1;
    newobj = rosenbrock(x + a*d);
    while newobj >= obj + a*beta*gradient'*d
        a = tao * a;
        newobj = rosenbrock(x + a*d)
    end 
    if (mod(k,2)==1)
        fprintf('Number of iteration is: %10u\n',k)
        figure (1)
        plot(x(1),x(2),'ro','LineWidth',15); grid,
        title(['x value after ',num2str(k),'iteration']);
        xlabel('x_1','FontSize',28),ylabel('x_2','FontSize',28),
        grid on 
    end
   x = x + a*d; %value of x 
   obj = newobj; %Final value of the function
   %---------------------------Gradient and Hessian -------------------%
<<<<<<< HEAD
   gradient = pen_grad(x);
   hessian1 = hessian_t(x);
=======
   gradient = rosenbrock_grad(x);
   hessian1 = rosenbrock_hessian(x);
>>>>>>> Gradient-/-Steepest-Gradient-Method-Newton's-Method
   
   A(k) = a; %Step size 
   Solution(k,:) = x;
   Iterate(k) = k;
   k = k +1
end 
%-----------------------End of iteration-----------------------------%
A(k) = a;
Iterate(k) = k;
A = A';
Iterate = Iterate';
fprintf('\n Iterations     Step size\n')';
for i = 1:k
    fprintf(' %d                 %f\n',Iterate(i),A(i));
end 
%-------------------------------Display x and k-------------------------%
fprintf('\nFinal value of x = ');
x
fprintf('Total iteration No. (k) = %d\n',k);

