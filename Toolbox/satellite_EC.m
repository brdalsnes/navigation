%WGS 84
a = 6378137.0;
f = 1/298.257223563;

%1
A = 26559755; %Orbit semi-maior axis
e = 0.017545; %Orbit eccentricity
omega = 1.626021;
t = 39929; %Time of perigee passage

% T = orbital_period(A);
%n = mean_angular_motion(A);
%E = eccentric_anamoly(n*t, e, 10^-12)*180/pi;
% r_0 = satellite_radius(A, e, E);
% phi_0 = true_anamoly(e, E);
% phi = phi_0 + omega;

%2
file = fopen('ephemerides.eph.txt');
time = time_fixer(213984, 1693, 0);
%table = generate_satellite_table(file, time);

%3
r1 = [4918526.668, -791212.115, 3969767.140]; %WGS 84
table_tx = generate_satellite_table_tx(file, time, r1);

%4
%cos_table = generate_cos_table(file, time);

%5
%az_el_table = generate_az_el_table(file, time, r1, a, f);




