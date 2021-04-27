% The initial parameters that you need are:
%__________________________________________
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of generations
% SearchAgents_no = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

% To run MFO: [Best_score,Best_pos,cg_curve]=MFO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj)

SearchAgents_no=100; % Number of search agents
Function_name='F2'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)
Max_iteration=1000; % Maximum numbef of iterations
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,cg_curve]=MFO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
figure('Position',[284   214   660   290])
%Draw search space
subplot(1,2,1);
func_plot(Function_name);
title('Test function')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])
grid off

%Draw objective space
subplot(1,2,2);
semilogy(cg_curve,'Color','b')
title('Convergence curve')
xlabel('Iteration');
ylabel('Best flame (score) obtained so far');

axis tight
grid off
box on
legend('MFO')

display(['The best solution obtained by MFO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by MFO is : ', num2str(Best_score)]);