function y = T_grad(x,c)
if x(1)^2 -x(2) +1 < 0 
    y(1) = 2*x(1);
    y(2) = 2*x(2);
elseif x(1)^2 -x(2) +1 > 0 
    y(1)= 2*x(1) + (2*c*x(1)*(x(1)^2-x(2)+1));
    y(2) = 2*x(2) + c*(x(2)-x(1)^2-1);
else
    disp('This should not happen - Gradient error')
end 
% y(1) = 2*x(1) + c*0.5*max(0,(2*(x(1)^2-x(2)+1)*2*x(1)));
% y(2) = 2*x(2) + c*0.5*max(0,(2*(x(1)^2-x(2)+1)*-1));
[n,m] = size(x);
if m == 1
    y = y';
end 