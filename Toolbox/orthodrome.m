function [ distance, dep, app ] = orthodrome( p1, p2, R )

phi_1 = p1(1)*pi/180;
lam_1 = p1(2)*pi/180;
phi_2 = p2(1)*pi/180;
lam_2 = p2(2)*pi/180;

theta = acos((cos(phi_2)*cos(lam_1-lam_2)*cos(phi_1)) + (sin(phi_2)*sin(phi_1)));
dep = atan2(-cos(phi_2)*sin(lam_1-lam_2), (-cos(phi_2)*cos(lam_1-lam_2)*sin(phi_1)) + (sin(phi_2)*cos(phi_1)));
app = atan2(-sin(lam_1 - lam_2)*cos(phi_1), (sin(phi_2)*cos(lam_1-lam_2)*cos(phi_1)) - (cos(phi_2)*sin(phi_1)));

distance = R*theta;
dep = dep*180/pi;
app = app*180/pi;

end

