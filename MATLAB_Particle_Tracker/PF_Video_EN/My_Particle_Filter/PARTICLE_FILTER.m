function [particles_t P_X_0] = PARTICLE_FILTER( N, evidence, dbn )


%Persistant
sample_population=randsample(size(dbn.map,1),N,true,dbn.P_X_0);

S=zeros(N,3);
for i = 1 : N
    index=sample_population(i);
    S(i,:)=dbn.map(index,:);
    if(((374<S(i,1)&& S(i,1)< 391))&&(125<S(i,2)&& S(i,2)<215))
        stop=true;
    end
    
end
W=zeros(N,1);


%taken from bayes networks


for i = 1 : N
    y=S(i,1);
    x=S(i,2);
    index=S(i,3);
    r=y;
    c=x;
    red =evidence(r,c,1)+1;
    green=evidence(r,c,2)+1;
    blue=evidence(r,c,3)+1;
    
    
    Prob_o_s = dbn.P_E_1_given_X_1(red,1)+...
        dbn.P_E_1_given_X_1(green,2)+...
        dbn.P_E_1_given_X_1(blue,3);
    
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
