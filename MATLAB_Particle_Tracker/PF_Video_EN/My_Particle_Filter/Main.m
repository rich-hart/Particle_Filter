N=1000;
X=randi([1,frame_dimensions(1)],[1,N]);
Y=randi([1,frame_dimensions(2)],[1,N]);

S=[X;Y];


for t=1:number_frames_in_movie
frame_t=frames(:,:,:,t);

[S_t PS_t ]= PARTICLE_FILTER( S,frame_t );
S=S_t;

figure(1);

for i=1:length(PS_t)

    
%frame_t(PS_t(1,i),PS_t(2,i),:)=[0 255 255];



end
image(frame_t);

hold on
plot(PS_t(2,:), PS_t(1,:), '.')
hold off

end




