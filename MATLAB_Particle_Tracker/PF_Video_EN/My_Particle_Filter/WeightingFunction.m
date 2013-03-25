function  L  = WeightingFunction(color,Xrgb_trgt, Xstd_rgb)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


color=double(color);

Xrgb_trgt=double(Xrgb_trgt);


A = -log(sqrt(2 * pi) * Xstd_rgb);
B = - 0.5 / (Xstd_rgb.^2);

D = color - Xrgb_trgt;
        
        D2 = D' * D;
        
        L =  A + B * D2;
        
        L=exp(L);
        
     

end


