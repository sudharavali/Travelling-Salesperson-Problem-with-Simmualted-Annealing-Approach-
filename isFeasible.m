function [bool,count]=isFeasible(S)
count=nbv(S);
if(count==0)
    bool=true;
else
    bool=false;
  
end