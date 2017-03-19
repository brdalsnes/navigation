function [ llh ] = bowring( xyz, a, f )

x = xyz(1);
y = xyz(2);
z = xyz(3);

b = a*(1 - f);
p = sqrt(x^2 + y^2);
e2 = 1 - (b^2/a^2);
e_2 = (a^2/b^2) - 1;
beta = atan2(a*z, b*p);

phi = atan2(z + (e_2*b*sin(beta)^3), p - (e2*a*cos(beta)^3));

R = a/sqrt(1 - f*(2 - f)*sin(phi)^2);

lambda = atan2(y, x);
h = (p*cos(phi)) + (z*sin(phi)) - (a^2/R);

llh = [(phi*180/pi) (lambda*180/pi) h];


end

