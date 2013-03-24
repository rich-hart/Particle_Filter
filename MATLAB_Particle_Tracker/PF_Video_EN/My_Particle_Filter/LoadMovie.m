clear ;


%% Loading Movie

movie_pointer = VideoReader('Person.mp4');

frame_dimensions = [movie_pointer.Width movie_pointer.Height];

number_frames_in_movie = floor(movie_pointer.Duration * movie_pointer.FrameRate);

frames=zeros(movie_pointer.Width,movie_pointer.Height,3,number_frames_in_movie, 'uint8'); 


for t = 1:number_frames_in_movie

   frame_t = read(movie_pointer, t);
    
   frames(:,:,:,t)=frame_t;

end