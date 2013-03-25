X=randi([0,frame_dimensions(1)],[1,500]);
Y=randi([0,frame_dimensions(2)],[1,500]);

S=[X;Y];


for t=1:number_frames_in_movie
frame_t=frames(:,:,:,t);

S= PARTICLE_FILTER( S,frame_t );

figure(1);
image(frame_t);
title('+++ Showing Particles +++')


hold on
plot(S(2,:), S(1,:), '.')
hold off


end



