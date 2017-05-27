%WGS 84
a = 6378137.0;
f = 1/298.257223563;

c = 299792458;

%1
file = fopen('ephemerides.eph.txt');
time = time_fixer(213984, 1693, 0);
r1 =  [4918526.668, -791212.115, 3969767.140];

%plot_ranges(file, time, 3, r1, 10, a, f);

%2
%plot_pseudo_ranges(file, time, 3, r1, 10, 500e-6, 0.4e-6, a, f);

%3
r3 = [38, 44, 12.46, -9, -8, -18.91, 102];
r3 = dms2d(r3);
r3 = llh2xyz(r3, a, f);
p1 = [38, 46, 49.61, -9, -29, -56.19, 103];
p1 = dms2d(p1);
p1 = llh2xyz(p1, a, f);
p0 = [0, 0, 0];

%[x, iter] = get_receiver_position('npr.txt', 'eph.txt', 1693, 213984, p0)

%4
% [PDOP, HDOP] = get_DOP('eph.txt', time, r1, 5);
% max_PDOP = max(PDOP)
% min_PDOP = min(PDOP)
% max_HDOP = max(HDOP)
% min_HDOP = min(HDOP)

%5
ranges = create_ranges('eph.txt', time, 3600, r1);
error = pseudo_error('npr.txt', 3600, ranges, 500e-6, 0.4e-6)



