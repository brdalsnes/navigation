function d_llh = molodensky(llh, a, f, d_a, d_f, d_X, d_Y, d_Z )

phi = llh(1)*pi/180;
lam = llh(2)*pi/180;
h = llh(3);

b = a*(1 - f);
e2 = 1 - (b^2/a^2);

R_N = a/sqrt(1 - (e2*sin(phi)^2));
R_M = (a*(1 - e2))/sqrt((1 - (e2*sin(phi)^2))^3);

d_phi = ((-d_X*sin(phi)*cos(lam)) - (d_Y*sin(phi)*sin(lam)) + (d_Z*cos(phi)) + ((d_a*R_N*e2/a) + (d_f*((R_M*a/b) + (R_N*b/a))))*sin(phi)*cos(phi))/(R_M + h);
d_lam = ((-d_X*sin(lam)) + (d_Y*cos(lam)))/((R_N + h)*cos(phi));
d_h = (d_X*cos(phi)*cos(lam)) + (d_Y*cos(phi)*sin(lam)) + (d_Z*sin(phi)) - (d_a*a/R_N) + (d_f*b*R_N*sin(phi)^2/a);

d_llh = [(d_phi*180/pi) (d_lam*180/pi) d_h];

end

