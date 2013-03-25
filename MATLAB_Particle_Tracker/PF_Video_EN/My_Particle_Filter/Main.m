N=400;
X=randi([1,frame_dimensions(1)],[1,N]);
Y=randi([1,frame_dimensions(2)],[1,N]);

S=[X;Y];


for t=1:number_frames_in_movie
frame_t=frames(:,:,:,t);

S_t= PARTICLE_FILTER( S,frame_t );
S=S_t;

figure(1);

for i=1:length(S)

    
frame_t(S(1,i),S(2,i),:)=[0 255 0];


end
image(frame_t);

end



