function [op,lom1,v,k]=process(x,z)

op=zeros(1,184375);
lom1=zeros(1,184375);
v=[];
k=[];
for j=1:z
    sum=0;
   count=0;
   count2=0;
   for i=1:16000
       sum=sum+x(i,j)*x(i,j);
   end   
        if sum>0.3            %% if the block of 1 sec has a energy less than 0.3 , then it is detected as silence.
         Y=overlap(x(:,j));
          for f=1:125
              sum1=0;              
            for g=1:256
                sum1=sum1+Y(g,f)*Y(g,f); %%  calculation of frame energy.
            end
              if sum1>0.01  %% energy of each frame is calculated ,if less than 0.01 is detected as silence.
                  e1=0;
                  e2=0;s=0;
                  Y(:,f)=Y(:,f) .* (hamming(length(Y(:,f))));
                 ACR=sd_autocorellation(Y(:,f));
                 ACR_l=zcr_l(ACR);
                 for i=1:256                           %% emergy of the total ACR sequence of the frame
                     e1=e1+ACR(i)*ACR(i); 
                 end
                 for  i=1:30       %% energy of the ACR sample for decay rate method
                      e2=e2+ACR(i)*ACR(i);
                 end
                    s=e2/e1;    %% decay rate value, if between 0.6-0.8 then it is applause 
                  if s<=0.8 && s>=0.6
                       count=count+1;
                  end
                    op((j-1)*125+f)=s;   %% the value of the silence are being recorded as zero
                    t=min(ACR(ACR_l(1):ACR_l(2)));
                    for h=ACR_l(1):ACR_l(2)
                        if t==ACR(h)
                           lom1((j-1)*125+f)=h;
                           if h>3 && h<8
                               count2=count2+1;
                           end
                        end
                    end
              end
              
                  
          end
          if count>60
           v=[v j];
          end
          if count2>60
              k=[k j];
          end
        end
end
end
                    
                