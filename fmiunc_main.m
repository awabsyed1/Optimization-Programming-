%--------------------------------fminunc---------------------------------%
%Using fminunc function for unconstrained optimization 
x0 = [5,5]'; %Initial value 
[m,n] = size(x0);
if m == 1 
    x0 = x0';
end
fun = @rosenbrock;
[xf,obj,flf,of] = fminunc(fun,x0);
fprintf('xf = %d\n',xf)
fprintf ('obj = %d\n',obj)
fprintf ('flf = %d\n',flf) 
disp (of)
%--------------------------End of 'fminunc' Function-------------------%