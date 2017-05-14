function [ azimuth, elevation ] = az_el( p1_xyz, p2_xyz, a, f )

d_p = p2_xyz - p1_xyz;
p1_llh = heikkinen(p1_xyz, a, f);

lam = (p1_llh(2)*pi/180) + (pi/2);
phi = (-p1_llh(1)*pi/180) + (pi/2);

R_z = [cos(lam) -sin(lam) 0;
       sin(lam) cos(lam)  0;
       0    0       1];

R_x = [1    0       0;
       0 cos(phi) -sin(phi);
       0 sin(phi) cos(phi)];

enu = d_p*R_z*R_x;

azimuth = atan2(enu(1), enu(2)) * (180/pi);
elevation = atan2(enu(3), sqrt(enu(1)^2 + enu(2)^2)) * (180/pi);

end

