%WGS 84
a = 6378137.0;
f = 1/298.257223563;

c = 299792458;

%1
file = fopen('ephemerides.eph.txt');
time = time_fixer(213984, 1693, 0);
r1 =  [4918526.668, -791212.115, 3969767.140];

az_el_table = generate_az_el_table(file, time, r1, a, f);

