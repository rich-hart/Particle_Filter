function [particles_t P_X_0] = PARTICLE_FILTER( N, evidence, dbn )


%Persistant
sample_population=randsample(size(dbn.map,1),N,true,dbn.P_X_0);

S=zeros(N,3);
W=zeros(N,1);
for i = 1 : N
    index=sample_population(i);
    S(i,:)=dbn.map(index,:);
    W(i)=dbn.P_X_0(index);
end



sorted_samples = [W S];

sorted_samples =  sortrows(sorted_samples);

S=sorted_samples(1:N,2:4);

for i=1:floor(N/2)
    
    X=S(i,2);
    Y=S(i,1);

X_good=S(i+floor(N/2),2);
Xmin=X_good-50;
Xmax=X_good+50;

Y_good=S(i+floor(N/2),1);
Ymin=Y_good-50;
Ymax=Y_good+50;
if(Xmin<1)
   Xmin=1; 
end

if(Ymin<1)
   Ymin=1; 
end
if(Xmax>size(evidence,2)-1)
   Xmax=size(evidence,2)-1; 
end
if(Ymax>size(evidence,1)-1)
   Ymax=size(evidence,1)-1; 
end

X_replacement = randi([Xmin,Xmax],1) ;
Y_replacement = randi([Ymin,Ymax],1) ;
S(i,2)=X_replacement;
S(i,1)=Y_replacement;

end




for i = 1 : N
 S(i,3)= dbn.maprc( S(i,1), S(i,2));
end
%taken from bayes networks


for i = 1 : N
    y=S(i,1);
    x=S(i,2);
    index=S(i,3);
    r=y;
    c=x;
    red =evidence(r,c,1);
    green=evidence(r,c,2);
    blue=evidence(r,c,3);
    
    
    color=[red ; green ; blue];
    target_color=[85;5;5];
    Prob_o_s = WeightingFunction(color,target_color,10 );
    
    W(i)=dbn.P_X_0(index)+Prob_o_s;
    
    
end



W=W/sum(W);

for i = 1 : N
    index=S(i,3);
    dbn.P_X_0(index)=W(i);
end



particles_t=S;

P_X_0=dbn.P_X_0;

end
