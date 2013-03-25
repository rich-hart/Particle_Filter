function [S] = PARTICLE_FILTER( S,evidence )

Xmax=size(evidence,1);

Xmin=1;

Ymax=size(evidence,2);

Ymin=1;

std=100;

total_weight=0;

W=zeros(1,length(S));

target_color=[85;5;5];

for i=1:length(S)
   X=S(1,i);
   if(~(Xmin<Xmax))
       stop=1;
   end
    X=Transition( X,std, Xmin, Xmax );
    
       Y=S(2,i);
    Y=Transition( Y,std, Ymin, Ymax );
   try
      red =evidence(X,Y,1);
    green=evidence(X,Y,2);
    blue=evidence(X,Y,3);
    color=[red;green;blue];
    
   catch
      st=0; 
   end
      
   
     Prob_o_s = WeightingFunction(color,target_color,200 );
    total_weight=total_weight+  Prob_o_s;
    
    W(i)=W(i)+Prob_o_s;
end

W=W/total_weight;

indexs=randsample(1:length(S),length(S),true,W);
S(:,1:length(S))=S(:,indexs);

end