function [ n ] = mean_angular_motion( A, delta_n )
u = 3.986005*10^14; %Earth gravitational constant

n = sqrt(u/A^3) + delta_n;

end

