function [ value ] = Transition( mean,std, value_min, value_max )


min=mean-2*std;
max=mean+2*std;






    
    
value=randi([min, max],1);

if(value<value_min)
   value=value_min; 
end

if(value>value_max)
   value=value_max; 
end

% prob=(1/(sqrt(2*pi*std^2)))*exp((-1.0*(value-mean)^2)/(2*std^2));
% test=rand(1);


%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

end





