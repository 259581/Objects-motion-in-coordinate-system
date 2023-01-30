clear;
clc;

steps_amount=500;
const = 10;

A = [0,1];
B = [1,1];
C = [1,0];
D = [0,0];

step_lenght1 = 0.01; 
step_lenght2 = 0.01;
step_lenght3 = 0.01;
step_lenght4 = 0.01;

noise1 = 0;
noise2 = 0;
noise3 = 0;
noise4 = 0;

road_A = 0;
road_B = 0;
road_C = 0;
road_D = 0;


for i = 1:steps_amount
    %Basic movement equations 
   %{ 
    v1 = (B-A);
    A = A + one_step(v1,step_lenght1) + rustle(noise1);
    v2 = (C-B);
    B = B + one_step(v2,step_lenght2) + rustle(noise2);
    v3 = (D-C);
    C = C + one_step(v3,step_lenght3) + rustle(noise3);
    v4 = (A-D);
    D = D + one_step(v4,step_lenght4) + rustle(noise4);
    %}
    
    % Movement for floating step length subordinate of distance
    
    v1 = (B-A);
    pejs(i) = pace(v1,const);
    A = A + one_step(v1,pace(v1,const)) + rustle(noise1);
    v2 = (C-B);
    B = B + one_step(v2,pace(v2,const)) + rustle(noise2);
    v3 = (D-C);
    C = C + one_step(v3,pace(v3,const)) + rustle(noise3);
    v4 = (A-D);
    D = D + one_step(v4,pace(v4,const)) + rustle(noise4);
    
    
    %Drawing movement trajectory
    figure(1);
    hold on;
    scatter(A(1,1),A(1,2),'red','filled');
    scatter(B(1,1),B(1,2),'green','filled');
    scatter(C(1,1),C(1,2),'cyan','filled');
    scatter(D(1,1),D(1,2),'magenta','filled');
    hold off;
    
    %Calculate a movement length 
    a = one_step(v1,step_lenght1);
    b = one_step(v2,step_lenght2);
    c = one_step(v3,step_lenght3);
    d = one_step(v4,step_lenght4);
    
    %Whole movement length 
    road_A = road_A + abs(a(1)) + abs(a(2));
    road_B = road_B + abs(b(1)) + abs(b(2));
    road_C = road_C + abs(c(1)) + abs(c(2));
    road_D = road_D + abs(d(1)) + abs(d(2));
    
end

%floating step length
function x = pace(v,const)
    x = (v(1)^2+v(2)^2)/const;
end

%one step calculation
function x = one_step(v,step_lenght)
    x = (v/VecLenght(v)*step_lenght);
end

%distance between objects
function lenght = VecLenght(v)
    lenght = sqrt(v(1)^2 + v(2)^2);
end

%adding noise
function z = rustle(noise) 
    x = noise * (rand(1,1)*2-1);
    y = noise * (rand(1,1)*2-1);
    z = [x,y];
end