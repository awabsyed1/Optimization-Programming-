function f = NSMFO(D,M,LB,UB,Pop,SearchAgents_no,Max_iteration,ishow)
%% Non Sorted Moth-flame Optimization Algorithm (NSMFO)
% NSMFO is developed by Pradeep Jangir
% f - optimal fitness
% X - optimal solution
% D  Dimensional of problem at hand   
% M Number of objective function
% Moth_pos is a matrix consists of all individuals
% SearchAgents_no is number of individual in Moth_possystem
% LB lower boundary constraint
% UB upper boundary constraint
%% Algorithm Variables
K = D+M;
Moth_pos = Pop(:,1:K+1);
Moth_pos_ad = zeros(SearchAgents_no,K);
%% Optimization Circle
Iteration = 1;
while Iteration<=Max_iteration % for each generation    
    for i = 1:SearchAgents_no   %  (Moth for each individual)
        j = floor(rand()* SearchAgents_no) + 1;
        while j==i
            j = floor(rand()* SearchAgents_no) + 1;
        end
        SF=round(1+rand); %% Scaling factor to perform best coverage in MFO
        % randomly select the best organism from first non-dominated front of Moth_pos
        Ffront = Moth_pos((find(Moth_pos(:,K+1)==1)),:); % first front
        ri =  floor(size(Ffront,1)*rand())+1; % ri is random index
        sorted_population = Moth_pos(ri,1:D);
     
         Flame_no=round(SearchAgents_no-Iteration*((SearchAgents_no-1)/Max_iteration));
         sorted_population1 = Moth_pos(Flame_no,1:D);
         
        % Calculate new solution 
        Moth_posNew1 = Moth_pos(i,1:D)+rand(1,D).*(sorted_population-SF.*Moth_pos(i,1:D));
        % Handling constraints
        Moth_posNew1 = bound(Moth_posNew1(:,1:D),UB,LB); 
        % Evaluate function at Moth_posNew1 
        Moth_posNew1(:,D + 1: K) = evaluate_objective(Moth_posNew1(:,1:D));
        % For the first trail Moth_posNew1
        dom_less = 0;
        dom_equal = 0;
        dom_more = 0;
        for k = 1:M
            if (Moth_posNew1(:,D+k)<Moth_pos(i,D+k))
                dom_less = dom_less + 1;
            elseif (Moth_posNew1(:,D+k)== Moth_pos(i,D+k))
                dom_equal = dom_equal + 1;
            else
                dom_more = dom_more +1;
            end
        end % end for k
        if dom_more == 0 && dom_equal ~= M %  If trial vector Moth_posNew1 dominates
            % target vector Xi. Replace Xi by Moth_posNew1 in current Moth_possystem and
            % add Xi to advanced population 2
            Moth_pos_ad(i,1:K) = Moth_pos(i,1:K); % add Xi to advanced Moth_pos
            Moth_pos(i,1:K) = Moth_posNew1(:,1:K); % replace Xi by Moth_posNew1            
        else % else Add Xi (trial vector) to advanced Moth_pos
            Moth_pos_ad(i,1:K)= Moth_posNew1;
        end % end if
        dom_equal = 0;
        dom_more = 0;
        for k = 1:M
                dom_more = dom_more +1;           
        end % end for k
        if dom_more == 0 && dom_equal ~= M %  If trial vector Moth_posNew1 dominates
            Moth_pos_ad(j,1:K) = Moth_pos(j,1:K); % add Xi to advanced Moth_pos
        end % end if
        j = floor(rand()* SearchAgents_no) + 1;
        while j==i
            j = floor(rand()* SearchAgents_no) + 1;
        end      
        for i=1:size(Moth_pos,1)
            if i<=Flame_no % Update the position of the moth with respect to its corresponsing flame
        % Calculate new solution 
        a=-1+Iteration*((-1)/Max_iteration);
        b=1;
        t=(a-1)*rand+1;                
        Moth_posNew1 = Moth_pos(i,1:D)+abs(sorted_population-Moth_pos(j,1:D))*exp(b.*t).*cos(t.*2*pi)+sorted_population;
            end
            if i>Flame_no % Update the position of the moth with respect to its corresponsing flame
        a=-1+Iteration*((-1)/Max_iteration);
        b=1;
        t=(a-1)*rand+1;                
        Moth_posNew1 = Moth_pos(i,1:D)+abs(sorted_population-Moth_pos(j,1:D))*exp(b.*t).*cos(t.*2*pi)+sorted_population1;
            end
        end  
        Moth_posNew1 = bound(Moth_posNew1(:,1:D),UB,LB);
        Moth_posNew1(:,D + 1: K) = evaluate_objective(Moth_posNew1(:,1:D));
        % Nondomination checking of trial individual
        dom_less = 0;
        dom_equal = 0;
        dom_more = 0;
        for k = 1:M
            if (Moth_posNew1(:,D+k)<Moth_pos(i,D+k))
                dom_less = dom_less + 1;
            elseif (Moth_posNew1(:,D+k)== Moth_pos(i,D+k))
                dom_equal = dom_equal + 1;
            else
                dom_more = dom_more +1;
            end
        end % end for k
        if dom_more == 0 && dom_equal ~= M %  If trial vector Moth_posNew1 dominates
            % target vector Xi. Replace Xi by Moth_posNew1 in current Moth_possystem and
            % add Xi to advanced population
            Moth_pos_ad(i,1:K) = Moth_pos(i,1:K); % add Xi to advanced Moth_pos
            Moth_pos(i,1:K) = Moth_posNew1(:,1:K); % replace Xi by Moth_posNew1            
        else % else Add Xi (trial vector) to advanced Moth_pos
            Moth_pos_ad(i,1:K)= Moth_posNew1;
        end % end if
        j = floor(rand()* SearchAgents_no) + 1;
        while j==i
            j = floor(rand()* SearchAgents_no) + 1;
        end
        parasiteVector=Moth_pos(i,1:D);
        seed=randperm(D);
        pick=seed(1:ceil(rand*D));  % select random dimension
        parasiteVector(:,pick)=rand(1,length(pick)).*(UB(pick)-LB(pick))+LB(pick);        
        % Evaluate the Parasite Vector
        parasiteVector(:,D + 1: K) = evaluate_objective(parasiteVector(:,1:D));
        % Nondomination checking of trial individual
        dom_less = 0;
        dom_equal = 0;
        dom_more = 0;
        for k = 1:M
            if (parasiteVector(:,D+k)<Moth_pos(j,D+k))
                dom_less = dom_less + 1;
            elseif (parasiteVector(:,D+k)== Moth_pos(j,D+k))
                dom_equal = dom_equal + 1;
            else
                dom_more = dom_more +1;
            end
        end % end for k
        if dom_more == 0 && dom_equal ~= M %  If trial vector Moth_posNew1 dominates
            % target vector Xi. Replace Xi by Moth_posNew1 in current Moth_possystem and
            % add Xi to advanced population
            Moth_pos_ad(j,1:K) = Moth_pos(j,1:K); % add Xi to advanced Moth_pos
            Moth_pos(j,1:K) = parasiteVector(:,1:K); % replace Xi by Moth_posNew1            
        else % else Add Xi (trial vector) to advanced Moth_pos
            Moth_pos_ad(j,1:K)= parasiteVector;
        end % end if 
    end % end for i
    if rem(Iteration, ishow) == 0
        fprintf('Generation: %d\n', Iteration);        
    end
    Moth_pos_com = [Moth_pos(:,1:K) ; Moth_pos_ad];
    intermediate_Moth_pos = non_domination_sort_mod(Moth_pos_com, M, D);
    Pop  = replace_chromosome(intermediate_Moth_pos, M,D,SearchAgents_no);
    Moth_pos=Pop(:,1:K+1); %    
    Iteration = Iteration+1;
end 
f= Moth_pos;

% Check the boundary limit
function a=bound(a,ub,lb)
a(a>ub)=ub(a>ub); a(a<lb)=lb(a<lb);