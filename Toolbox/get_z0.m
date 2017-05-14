function [ z0 ] = get_z0( latitude, a, f )

phi = latitude*pi/180;

b = a*(1 - f);
e2 = 1 - (b^2/a^2);
R_N = a/sqrt(1 - (e2*sin(phi)^2));

z0 = (a^2/b^2)*R_N*sin(phi);

end

