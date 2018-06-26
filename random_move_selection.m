function rand_schedule=random_move_selection(S)

n=randi(5);

switch n
    case 1
        rand_schedule=swapHomes(S);
    case 2
        rand_schedule=swapRounds(S);
    case 3
        rand_schedule=swapTeams(S);
    case 4
        rand_schedule=partialSwapRounds(S);
    case 5
        rand_schedule=partialSwapTeams(S);

end
%rand_schedule
end