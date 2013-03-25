function [particles_t P_X_0] = PARTICLE_FILTER( N, evidence, dbn )


%Persistant
sample_population=randsample(size(dbn.map,1),N,true,dbn.P_X_0);

S=zeros(N,3);
for i = 1 : N
    index=sample_population(i);
    S(i,:)=dbn.map(index,:);
    
    
end
W=zeros(N,1);


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
