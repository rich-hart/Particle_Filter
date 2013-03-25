function [ value ] = Transition( mean,std, value_min, value_max )

test=0;
prob=0;

while (~(test<prob)) 
value=randi([value_min, value_max],1);

prob=(1/(sqrt(2*pi*std^2)))*exp((-1.0*(value-mean)^2)/(2*std^2));
test=rand(1);
end

%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here


end

