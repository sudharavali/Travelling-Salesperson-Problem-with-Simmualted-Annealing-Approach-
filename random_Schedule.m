function initial_schedule=random_Schedule()
global teams weeks;
S=zeros(teams,weeks);

[bool_schedule,schedule]=generate_random_schedule(S,1,1);
initial_schedule=schedule;


end