function [ r_0 ] = satellite_radius( A, e, E )

r_0 = A*(1 - e*cos(E));

end

