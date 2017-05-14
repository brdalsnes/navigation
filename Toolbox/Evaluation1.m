file = fopen('trackWA1_2016-2017.nmea.txt');

%WGS 84
a = 6378137.0;
f = 1/298.257223563;

%1
%p = [38 0 0 0 0 10 0];
%p = dms2d(p);
%z0 = get_z0(38, a, f)
%theta = p(2)*pi/180;
%dist = theta*z0

%2a
%[fails, order] = count_fail(file)

%2b
start = [38 44.1786 0 -9 -9.1135 0 77.3];

%2c
start = dms2d(start);
start_xyz = llh2xyz(start, a, f);

%2d
%[min_alt, max_alt] = minmax_altitude(file);

%2e
%dist = find_distance(start_xyz, file, a, f)

%3
p1 = [38 45 50.50 -9 -8 -20.20 156];
p1 = llh2xyz(p1, a, f);
%p2 = get_p2(p1, 240, 6, a, f)


%4a
lisbon = [38 39 38.5 -9 -17 -56.2 0];
fortaleza = [-3 -41 -56.4 -38 -28 -56.3 0];
R = 6378000;
[distance, dep, app] = orthodrome(lisbon, fortaleza, R)





