function swapped_schedule=partialSwapTeams(S)

global weeks teams;
%fprintf("PST\n");



team_i=randi(teams);
team_j=randi(teams);
round=randi(weeks);
week=1:weeks;


while (team_j==team_i) ||(abs(S(team_i,round))==team_j && abs(S(team_j,round))==team_i) 
    team_j=randi(teams);
end


%intial swap

S=swap(S,team_i,team_j,round);
bool=1;
while bool==1
    %disp("loop");
    row=S(team_i,:);
    index=week(row==S(team_i,round));
    if length(index)==1
        break;
    end
    
    if index(1)==round
        round=index(2);
    else
        round=index(1);
    end
    
    S=swap(S,team_i,team_j,round);
    
    
end

swapped_schedule=S;

end


function swapped=swap(S,team_i,team_j,round)

k=round;
temp_a=S(team_i,k);
    S(team_i,k)=S(team_j,k);
    S(team_j,k)=temp_a;
    
    if S(team_i,k)>0
        S(abs(S(team_i,k)),k)=-1*team_i;
    else
        S(abs(S(team_i,k)),k)=team_i;
    end
    
    if S(team_j,k)>0
        S(abs(S(team_j,k)),k)=-1*team_j;
    else
        S(abs(S(team_j,k)),k)=team_j;
    end

swapped=S;
end