%WGS 84
a = 6378137.0;
f = 1/298.257223563;

%Ex1
delta_t = time_fixer(129, 1741, 0) - time_fixer(60307, 1739, 0);

file = fopen('ns2016-2017_WA2.eph');

%Ex4
%a
time = time_fixer(0, 1765, 0);
%table = generate_satellite_table(file, time);

%b
%table_tx = generate_satellite_table_tx(file, time);

%c
%r1_xyz = [4918527, -791212, 3969767];
%az_el_table = generate_az_el_table(file, time, r1_xyz, a, f);

%Ex3
%table = generate_satellite_table(file, time);

%Ex2


