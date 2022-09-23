function op=zcr_l(ip1)  %finding all position of zero crossing points %
L=length(ip1);
		LOC=[];
for i=1:L-1
			if(ip1(i)*ip1(i+1)<0)
			LOC=[LOC i];
		else
			LOC=LOC;
			end
end
op=LOC;
end

