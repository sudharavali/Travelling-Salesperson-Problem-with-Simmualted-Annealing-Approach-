function swapped_schedule=swapTeams(S)
global teams weeks;
%disp("ST\n");
team_i=randi(teams);
team_j=randi(teams);


while team_j==team_i
    team_j=randi(teams);
end


for k=1:weeks
    
    if abs(S(team_i,k))==team_j
        continue;
    end
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

end
    
swapped_schedule=S;

end