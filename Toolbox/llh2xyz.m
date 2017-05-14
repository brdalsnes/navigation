function [ xyz ] = llh2xyz( llh, a, f )

phi = llh(1)*pi/180;
lambda = llh(2)*pi/180;
h = llh(3);

R = a/sqrt(1 - f*(2 - f)*sin(phi)^2);

x = (R + h)*cos(phi)*cos(lambda);
y = (R + h)*cos(phi)*sin(lambda);
z = (((1 - f)^2)*R + h)*sin(phi);

xyz = [x y z];
end

