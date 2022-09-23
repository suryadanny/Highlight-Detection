function OP = overlap(y) %blocking%
L=length(y);
Z=L/128;
overlap=128;
Bs=256;
OP=zeros(256,125);
for i=1:128
			y(i+L)=0;
end

for i=1:Z
OP(:,i)=y((i-1)*(Bs-overlap)+1:(i-1)*(Bs-overlap)+Bs);
end
end

