function N= Normalisation(x)
L=length(x);
N=[];
M=max(max(x),abs(min(x)));
for i=1:L
    n=x(i)/M;
    N=[N n];
end
end
    