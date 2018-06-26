function [bool,Schedule]=generate_random_schedule(S,team,week)
    
     global teams weeks ;
    
    if team==teams+1
         bool=1;
         Schedule=S;
    elseif S(team,week)~=0
        week=week+1;
        if week>weeks
            week=1;
            team=team+1;
        end
        [bool,Schedule]=generate_random_schedule(S,team,week);
    
    else 
        i=team;
        range=-teams:teams;
        Z1 = range(range~=i);
        Z2 = Z1(Z1~=-i);
        Z3 = Z2(Z2~=0);
        temp=setdiff(Z3,S(team,:));
        choices=temp(randperm(length(temp)));
        bool=0;
        
        for k=1:length(choices)
            o=choices(k);
            if S(abs(o),week)~=0
                continue;
            end
            S(team,week)=o;
            if o>0
                S(o,week)=-team;
            else
                S(abs(o),week)=team;
            end
            
            week=week+1;
            if week>weeks
            week=1;
            team=team+1;
            end
            [bool,Schedule]=generate_random_schedule(S,team,week);
            
            if bool==1
                break;
            end       
            
        end
        
        if bool~=1
        bool=0;
        Schedule=S;
        end
        

    end
    

end