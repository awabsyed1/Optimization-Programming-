function y = T_func(x,c)
y = x(1)^2 + x(2)^2 + (c/2*[max(0,x(1)^2-x(2)+1)]^2);
end