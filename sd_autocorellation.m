
function R = sd_autocorellation(x) %auto corellation %
L=length(x);
R=[];
for k=1:L
			sum=0;
		 sm=0;
	for i=1:L-k
		sum=sum+x(i)*x(i+k);
		end
		for i=1:L
		sm=sm+x(i)*x(i);
		end
		R=[R sum/sm];
end
end