function [S PS] = PARTICLE_FILTER( S,evidence )

Xmax=size(evidence,1);

Xmin=1;

Ymax=size(evidence,2);

Ymin=1;

std=30;

total_weight=0;

W=zeros(1,length(S));

target_color=[82;9;13];

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
      
   
     Prob_o_s = WeightingFunction(color,target_color,20 );
    total_weight=total_weight+  Prob_o_s;
    
    W(i)=W(i)+Prob_o_s;
end

W=W/sum(W);

percent_save=.6;
indexs=randsample(1:length(S),floor(percent_save*length(S)),true,W);
saveS=S(:,indexs);

randX=randi([1,Xmax],[1,length(S)-floor(percent_save*length(S))]);
randY=randi([1,Ymax],[1,length(S)-floor(percent_save*length(S))]);

replaceS=[randX;randY];

S=[saveS replaceS];

% indexs=randsample(1:length(S),length(S),true,W);
% S=S(:,indexs);

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
      
   
     Prob_o_s = WeightingFunction(color,target_color,30 );
    total_weight=total_weight+  Prob_o_s;
    
    W(i)=W(i)+Prob_o_s;
end

W=W/sum(W);
PS=[S' W' ];

PS= sortrows(PS,-3);
PS=PS(1:floor(length(PS)*.3),:)';

end