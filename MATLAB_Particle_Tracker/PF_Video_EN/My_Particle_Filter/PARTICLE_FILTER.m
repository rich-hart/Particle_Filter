function [ particles_t ] = PARTICLE_FILTER( s_t_1,o_t,Pr_S_t_give_S_t_1,Pr_O_t_given_S_t);


%This function is based off of the pseudocode from Modeling and 
%Reasoning with Bayesian Networks by Adnan Darwiche
P=0;
[rows col]=size(Pr_S_t_give_S_t_1);
P_S_t=ones(rows,col)/(rows*col);

for i=1:length(s_t_1);
    
particles_t=s_t_1;
end

