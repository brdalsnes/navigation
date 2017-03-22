function [ bearing, distance ] = loxodrome( p1, p2, R )

phi_1 = p1(1)*pi/180;
lam_1 = p1(2)*pi/180;
phi_2 = p2(1)*pi/180;
lam_2 = p2(2)*pi/180;

sig_1 = lox_sum(phi_1);
sig_2 = lox_sum(phi_2);

bearing = atan2(lam_2 - lam_1, sig_2 - sig_1);
distance = R*abs(phi_2-phi_1)*abs(sec(bearing));

bearing = bearing*180/pi;

end

