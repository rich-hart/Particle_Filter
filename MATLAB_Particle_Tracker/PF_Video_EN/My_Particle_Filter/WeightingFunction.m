function  L  = WeightingFunction( )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

  C = [0; 40 ; 40];
Xrgb_trgt  = [50; 0 ; 0];

Xstd_rgb =10;
        A = -log(sqrt(2 * pi) * Xstd_rgb);
B = - 0.5 / (Xstd_rgb.^2);

D = C - Xrgb_trgt;
        
        D2 = D' * D;
        
        L =  A + B * D2;

end


