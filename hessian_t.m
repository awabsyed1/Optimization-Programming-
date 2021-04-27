function y = hessian_t(x,c)
if x(1)^2 -x(2) +1 < 0 
    y(1,1) = 2;
    y(1,2) = 0;
    y(2,1) = 0;
    y(2,2) = 2;
elseif x(1)^2 -x(2) +1 > 0 
    y(1,1) = 2 + 2*c*(3*x(1)^2-x(2)+1);
    y(1,2) = -2*c*x(1);
    y(2,1) = -2*c*x(1);
    y(2,2) = 2*c;
else 
    disp('This should not happen -hessian matrix error')
end
% y(1,1) = 2 + c/2*max(0,(4*(3*x(1)^2-x(2))));
% y(1,2) = c*max(0,4*(-x(1)));
% y(2,1) = c*max(0,-2*x(1));
% y(2,2) = 2 + c*max(0,1);

% y(1,1) = 2 + c*max(0,(6*x(1)^2 - 2*x(2)+2));
% y(1,2) = c*max(0,(-2*x(1)));
% y(2,1) = c*max(0,-2*x(1));
% y(2,2) = 2 + c*max(0,1);
end 