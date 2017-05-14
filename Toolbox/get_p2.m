function [ p2 ] = get_p2( p1_xyz, az, el, a, f )

az = az*pi/180;
el = el*pi/180;

p1_llh = heikkinen(p1_xyz, a, f);

lam = (-p1_llh(2)*pi/180) - (pi/2);
phi = (p1_llh(1)*pi/180) - (pi/2);

R_z = [cos(lam) -sin(lam) 0;
       sin(lam) cos(lam)  0;
       0    0       1];

R_x = [1    0       0;
       0 cos(phi) -sin(phi);
       0 sin(phi) cos(phi)];
   

n = sqrt(-24000^2/((1 + tan(az)^2)*(-1 - tan(el)^2)));
e = n*tan(az);
u = sqrt(24000^2 - n^2 - e^2);

enu = [e n u];

d_p = enu*R_x*R_z;

p2_xyz = d_p + p1_xyz;

p2 = heikkinen(p2_xyz, a, f);
end

