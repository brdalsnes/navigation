p1 = [38 46 49.61 -9 -29 -56.19 103]; %WGS 84 llh
p2 = [4910384.3, -821478.6, 3973549.6]; %WGS 84 xyz

%WGS 84
a = 6378137.0;
f = 1/298.257223563;

%Ex1
%dm = dms2dm(p1)
%d = dms2d(p1)

%Ex2
d = dms2d(p1);
xyz = llh2xyz(d, a, f)

%Ex3
%llh = bowring(p2, a, f)
%llh = heikkinen(p2, a, f

%Ex4
%n = norm(p2 - xyz)

%Ex5
d_a = 251;
d_f = 0.000014192702;
d_X = 84;
d_Y = 107;
d_Z = 120;
%p1 = dms2d(p1);
%d_llh = molodensky(p1, a, f, d_a, d_f, d_X, d_Y, d_Z);
%p1_ed50 = p1 + d_llh;
%p2 = heikkinen(p2, a, f);
%d_llh = molodensky(p2, a, f,  d_a, d_f, d_X, d_Y, d_Z);
%p2_ed50 = p2 + d_llh;
%p1_xyz = llh2xyz(p1, a, f);
%p1_xyz_trans = p1_xyz + [84 107 120];
%p1_ed50_xyz = llh2xyz(p1_ed50, a + d_a, f + d_f);
%n = norm(p1_xyz_trans - p1_ed50_xyz);

%Ex6
%p1 = dms2d(p1);
%p1 = llh2xyz(p1, a, f);
%[azimuth, elevation] = az_el(p1, p2, a, f)

%Ex7
new_york = [40 45 0 -73 -58 0 0];
london = [51 32 0 0 -10 0 0];
new_york = dms2d(new_york);
london = dms2d(london);
R = 6378000;
[distance_v, dep, app] = orthodrome(new_york, london, R); %From New York to London

%Ex8
[distance_l, bearing] = loxodrome(new_york, london, R);
n = norm(distance_v - distance_l);



