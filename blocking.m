function Block= blocking(y,n) %blocking%
L=length(y);
X=n*16000;
Z=L/X;
Block=zeros(16000,1475);

for i=1:Z
Block(:,i)=y((i-1)*X+1:i*X);
end
end