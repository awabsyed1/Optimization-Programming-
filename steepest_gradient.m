function [Solution, Iterate]= gradient(x,a,obj,g,epsilon)
% file name:  gradient.m
% This is for the steepest descent (gradient) method with a constant step-size.
% It terminates when the norm of the gradient is smaller than a given number 'epsilon'(<0).
% The function is defined in the file 'Rosenbrock.m'.
% The gradient is given the file 'Rosenbrock_grad.m'.

  k=1;          % k = the number of iterations
  axes('FontSize',20);

% Iteration procedure
  while  norm(g) > epsilon    
         d = -g;          % steepest descent direction
         newobj = rosenbrock(x + a*d);   
         if (mod(k,1000)==1)
%              fprintf('Number of iteration is: %10u\n',k);
               plot(x(1),x(2),'ro','LineWidth',10); grid,
               title(['Iteration = ',num2str(k)]);
               xlabel('x_1','FontSize',28),ylabel('x_2','FontSize',28),
               pause(0.1);
         end
         x = x + a*d;
         obj = newobj;
         g =   rosenbrock_grad(x);
    
         Solution(k,:)= x;
         Iterate(k) = k;
         k = k + 1;
  end
% iteration end  
Iterate = Iterate';
x, k                       % Display x and k