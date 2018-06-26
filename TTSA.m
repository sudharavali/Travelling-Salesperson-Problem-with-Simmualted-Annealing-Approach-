global teams weeks weight Distance_Matrix;
tic
load('Distance_Matrix_16.mat');

teams=6;
weeks=2*teams-2;
weight=4000;



%Find a random schedule
S=random_Schedule();
S
bestFeasible=Inf;
nbf=Inf;
bestInfeasible=Inf;
nbi=Inf;

T=400;            %Temperature
bestTemperature=0;
reheat=0;       
counter=0;
maxR=10;
maxP=500;
maxC=500;

theta=1.04;
beta=0.9999;
tau=1.04;

fun_counter=1;

while reheat<=maxR
    phase=0;
    disp(reheat);
    while phase<=maxP
        counter=0;
        while counter<=maxC
            %fun_counter=fun_counter+1
            next_S= random_move_selection(S);
            
            [c_S,nbv_S]=objective(S);
            [c_next_S,nbv_next_S]=objective(next_S);      
            
            delta_c= abs(c_next_S - c_S);
           
            if (c_next_S<c_S) || (nbv_next_S==0 && c_next_S<bestFeasible) || (nbv_next_S>0 && c_next_S<bestInfeasible)
                accept=true;
            else
                prob=100*exp(-delta_c/T);
                threshold=randi(100);
                if prob>threshold
                    accept=true;
                else
                    accept=false;
                end    
            end
            
            
            if accept
                S=next_S;
                if nbv_next_S==0
                    nbf=min(c_next_S,bestFeasible);
                else
                    nbi=min(c_next_S,bestInfeasible);
                end
                
                if nbf<bestFeasible || nbi<bestInfeasible
                    reheat=0;
                    counter=0;
                    phase=0;
                    bestTemperature=T;
                    bestFeasible=nbf;
                    bestInfeasible=nbi;
                  
                    if nbv_next_S==0
                        weight=weight/theta;
                    else
                        weight=weight*tau;
                    end
                else
                    counter=counter+1;
                end
            end
           
        end
       phase=phase+1;
       T=T*beta; 
    end
    reheat=reheat+1;
    T=2*bestTemperature;
end

schedule=S
bestFeasible
bestInfeasible
toc

