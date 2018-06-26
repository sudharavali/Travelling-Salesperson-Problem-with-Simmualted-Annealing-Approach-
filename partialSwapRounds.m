function swapped_schedule=partialSwapRounds(S)
global weeks teams;

%disp("PSR");
round_i=randi(weeks);
round_j=randi(weeks);
team=randi(teams);



while round_j==round_i
    round_j=randi(weeks);
end

%intial swap
S=swap(S,team,round_i,round_j);

bool=1;
t=1:teams;

while bool==1
    
    col=abs(S(:,round_i));
    index=t(col==abs(S(team,round_i)));
    if length(index)==1
        break;
    end
    
    if index(1)==team
        team=index(2);
    else
        team=index(1);
    end
    
    S=swap(S,team,round_i,round_j);



end




swapped_schedule=S;
end


function swapped=swap(S,team,round_i,round_j)

temp=S(team,round_i);
S(team,round_i)=S(team,round_j);
S(team,round_j)=temp;

    if S(team,round_i)>0
        S(abs(S(team,round_i)),round_i)=-1*team;
    else
        S(abs(S(team,round_i)),round_i)=team;
    end
    
    if S(team,round_j)>0
        S(abs(S(team,round_j)),round_j)=-1*team;
    else
        S(abs(S(team,round_j)),round_j)=team;
    end
    

swapped=S;
end
