function [ llh ] = heikkinen( xyz, a, f )

x = xyz(1);
y = xyz(2);
z = xyz(3);

b = a*(1 - f);
r = sqrt(x^2 + y^2);
e2 = 1 - (b^2/a^2);
e_2 = (a^2/b^2) - 1;

F = 54*b^2*z^2;
G = r^2 + (1 - e2)*z^2 - e2*(a^2 - b^2);
c = ((e2^2)*F*r^2)/G^3;
s = nthroot(1 + c + sqrt(c^2 + 2*c), 3);
P = F/((3*(s + (1/s) + 1)^2)*G^2);
Q = sqrt(1 + 2*P*e2^2);
r0 = -((P*e2*r)/(1+Q)) + sqrt((a^2/2)*(1 + (1/Q)) - ((P*(1-e2)*z^2)/(Q*(1+Q))) - (P*r^2/2));
U = sqrt((r - e2*r0)^2 + z^2);
V = sqrt((r - e2*r0)^2 + (1 - e2)*z^2);
z0 = ((z*b^2)/(a*V));

h = U*(1 - (b^2/(a*V)));
phi = atan2(z + (e_2*z0), r);
lambda = atan2(y, x);

llh = [(phi*180/pi) (lambda*180/pi) h];
end

