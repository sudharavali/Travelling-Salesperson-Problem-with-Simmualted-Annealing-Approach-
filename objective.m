function [cost,violation]=objective(S)

global weight;

[bool,nbv]=isFeasible(S);

if bool
    cost=distance(S);
    violation=nbv;
else
    cost=sqrt(distance(S)^2+((weight)*(sublinear(nbv)))^2);
    violation=nbv;
end


end