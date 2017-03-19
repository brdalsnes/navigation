p1 = [38 46 49.61 -9 -29 -56.19 103];
p2 = [4910384.3, -821478.6, 3973549.6];

%WGS 84
a = 6378137.0;
f = 1/298.257223563;

%Ex1
%dm = dms2dm(p1)
%d = dms2d(p1)

%Ex2
d = dms2d(p1);
xyz = llh2xyz(d, a, f);

%Ex3
%llh = bowring(p2, a, f)
%llh = heikkinen(p2, a, f

%Ex4
%n = norm(p2 - xyz)


