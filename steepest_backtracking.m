function [Solution, A, Iterate]= steepest_backtracking(x,tao,obj,g, epsilon)
% file name:  backtracking.m
% This is for the steepest descent (gradient) method using a basic backtracking line search rule.
% It terminates when the norm of the gradient is less than a given small number 'epsilon'(>0).
% The function is defined in the file 'Rosenbrock.m'.
% The gradient is given the file 'Rosenbrock_grad.m'.
%
% Note that the input variable s is not used. It was put here is 
% for future use - say to extend backtracking to Armijo search. 
%

  k=1;          % the index of iterations (search steps)
  axes('FontSize',20);

% Iteration procedure
  while  norm(g) > epsilon    
         d = -g;          % steepest descent direction
         a = 1;
         newobj = rosenbrock(x + a*d);
         while (newobj-obj) > 0 
                a = a*tao;  
                newobj = rosenbrock(x + a*d);
         end
   
         if (mod(k,100)==1)
%              fprintf('Number of iteration is: %10u\n',k);
               plot(x(1),x(2),'ro','LineWidth',15); grid,
               title(['Iteration = ',num2str(k)]);
               xlabel('x_1','FontSize',28),ylabel('x_2','FontSize',28),
               pause(0.1);
         end
         x = x + a*d;
         obj = newobj;
         g =   rosenbrock_grad(x);
    
         A(k) = a;
         Solution(k,:)= x;
         Iterate(k) = k;
         k = k + 1;
  end
% Iteration end  
A = A';
Iterate = Iterate';
x, k    % Display x and k