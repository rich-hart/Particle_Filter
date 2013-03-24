
dbn= struct('P_X_0',[],'P_X_1_given_P_X_0',[],'P_E_1_given_X_1',[],'map',[]);

dbn.P_X_0=ones(size(frames,1)*size(frames,2),1)/(size(frames,1)*size(frames,2));


dbn.P_X_1_given_P_X_0=zeros(size(frames,1)*size(frames,2),1);

dbn.P_E_1_given_X_1=CreateSensorDistrobution();

dbn.map=zeros(size(frames,1)*size(frames,2),3);

%Load Map
counter=0;

for i=1:size(frames,1)
    for j=1:size(frames,2)
        counter=counter+1;
       dbn.map( counter,1)=i;
        dbn.map( counter,2)=j;
        dbn.map( counter,3)=counter;
    end
end


for t=1:number_frames_in_movie

[particles_t dbn.P_X_1_given_P_X_0] =PARTICLE_FILTER( 1000,frames(:,:,:,t) , dbn );


dbn.P_X_0=dbn.P_X_1_given_P_X_0;

figure(1);
image(frames(:,:,:,t));
title('+++ Showing Particles +++')


hold on
plot(particles_t(:,2), particles_t(:,1), '.')
hold off

end

final_distribution= zeros(size(frames,1),size(frames,2));

counter=0;
total=0;
for i=1:size(frames,1)
    for j=1:size(frames,2)
        counter=counter+1;
       final_distribution(i,j)=dbn.P_X_0(counter);
       total=dbn.P_X_0(counter)+total;
    end
    
end

