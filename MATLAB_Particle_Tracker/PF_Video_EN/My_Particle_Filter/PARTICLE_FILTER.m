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

top_hits=S(floor(N*.9):N,:);

Xmean=round(mean(top_hits(:,2)));

Xmin=max(Xmean-50,0);
Xmax=min(Xmean+50,size(evidence,1));

Ymean=round(mean(top_hits(:,1)));
Ymin=max(Ymean-50,0);
Ymax=min(Ymean+50,size(evidence,2));
X_replacement = randi([Xmin,Xmax],[floor(N*.9),1]) ;
Y_replacement = randi([Ymin,Ymax],[floor(N*.9),1]) ;
S(1:floor(N*.9),1)=X_replacement;
S(1:floor(N*.9),2)=Y_replacement;

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
