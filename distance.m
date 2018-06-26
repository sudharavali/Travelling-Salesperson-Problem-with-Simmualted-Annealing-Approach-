function cost=distance(S)
global teams weeks Distance_Matrix;
distance_mat=Distance_Matrix;
total_cost=0;
for i=1:teams
    if S(i,1)<0
        cost=distance_mat(i,abs(S(i,1)));
    else
        cost=0;
    end
    
    temp=S(i,1);
    for j=2:weeks
        current=S(i,j);
        if temp>0 && current<0
            cost= cost+ distance_mat(i,abs(current));
        elseif temp<0 && current<0
            cost=cost+ distance_mat(abs(temp),abs(current));
        elseif temp>0 &&current>0
            cost=cost+0;
        else %temp<0 && current>0
            cost=cost+ distance_mat(abs(temp),i);    
        end
        temp=current;
        
    end
    total_cost=total_cost+cost;
end


for i=1:teams
 if S(i,weeks)<0
     total_cost=total_cost+distance_mat(abs(S(i,weeks)),i);
 end
end


cost=total_cost;


end