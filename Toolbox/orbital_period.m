function [ T ] = orbital_period( A )
u = 3.986005*10^14; %Earth gravitational constant

T = 2*pi*sqrt(A^3/u);

end

