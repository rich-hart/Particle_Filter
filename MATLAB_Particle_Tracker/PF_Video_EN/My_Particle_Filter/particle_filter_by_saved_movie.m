clear ;
number_of_particles = 4000;

%% Loading Movie

movie_pointer = VideoReader('Person.mp4');

frame_dimensions = [movie_pointer.Width movie_pointer.Height];
number_frames_in_movie = floor(movie_pointer.Duration * movie_pointer.FrameRate);

%Create Particles

s_0 = create_particles( number_of_particles);
Pr_S_0=ones(frame_dimensions(1)*frame_dimensions(2))/(frame_dimensions(1)*frame_dimensions(2));
Pr_O_0_given_S_0=Pr_S_0;
%o_t= this is frame
%Pr_S_t_given_S_t_1;
%Pr_O_t_given_S_t;

s_t_1=s_0;
Pr_S_t_give_S_t_1=Pr_S_0;
Pr_O_t_given_S_t=Pr_O_0_given_S_0;


vector_table=zeros(frame_dimensions(1)*frame_dimensions(2),2);
frame_map=zeros(frame_dimensions);
counter=0;
for i=1:frame_dimensions(1)
   for j=1: frame_dimensions(2)
       counter=counter+1;
       vector_table(counter,1)=i;
       vector_table(counter,2)=j;       
       frame_map(i,j)=counter;
   end
end



for t = 1:1%number_frames_in_movie

    frame_t = read(movie_pointer, t);
    
    o_t=frame_t;
    
    s_t=PARTICLE_FILTER(s_t_1,o_t,Pr_S_t_give_S_t_1,Pr_O_t_given_S_t);
    
    show_particles(s_t, o_t); 

end

