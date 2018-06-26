function violation_count=nbv(S)
global teams weeks;
bool=(S>0);

atmost_const=0;
repeat_const=0;
for i=1:teams
    j=1;
    while j<=weeks-3
        if (bool(i,j)==1 && bool(i,j+1)==1 && bool(i,j+2)==1 && bool(i,j+3)==1)||(bool(i,j)==0 && bool(i,j+1)==0 && bool(i,j+2)==0 && bool(i,j+3)==0)
            atmost_const=atmost_const+1;
            j=j+3;
        end
        j=j+1;
    end
end

for i=1:teams
    j=1;
    while j<=weeks-1
        if abs(S(i,j))==abs(S(i,j+1))
            repeat_const=repeat_const+1;
        end
        j=j+1;
    end
end


violation_count=repeat_const+atmost_const;
end
