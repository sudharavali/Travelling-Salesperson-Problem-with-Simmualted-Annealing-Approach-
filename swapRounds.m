function swapped_schedule=swapRounds(S)
global weeks;
%disp("SR");


round_i=randi(weeks);
round_j=randi(weeks);

while round_j==round_i
    round_j=randi(weeks);
end


S(:,[round_i round_j]) = S(:,[round_j round_i]);

swapped_schedule=S;

end