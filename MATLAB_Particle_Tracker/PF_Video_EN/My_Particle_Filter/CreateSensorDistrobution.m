function [ E_give_X ] = CreateSensorDistrobution(  )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
red_mean=80;
red_standard_dev=10;



red=ones(256,1);
blue=ones(256,1);
green=ones(256,1);


for  i = 1:256
    red(i)=exp(-1.0*((i-red_mean)^2)/(2*red_standard_dev^2));
    blue(i)=0;
    green(i)=0;
end
red=red/sum(red);


E_give_X=[red green blue];

E_give_X=E_give_X/(sum(red)+sum(blue)+sum(green));
end

