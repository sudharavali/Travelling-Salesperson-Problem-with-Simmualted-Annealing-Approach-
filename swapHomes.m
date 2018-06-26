function swapped_schedule=swapHomes(S)
global teams weeks;
%disp("SH\n");

team_i=randi(teams);
team_j=randi(teams);

while team_j==team_i
    team_j=randi(teams);
end



for k=1:weeks
    if abs(S(team_i,k))==(team_j)
        S(team_i,k)= (-1)*S(team_i,k);
        S(team_j,k)= (-1)*S(team_j,k);
    end
end



swapped_schedule=S;
end