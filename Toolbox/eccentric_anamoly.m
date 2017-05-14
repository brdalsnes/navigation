function [ E ] = eccentric_anamoly(M, e, delta )

E = M;
E_ = 0;

while abs(E - E_) >= delta
    E_ = E;
    E = M + e*sin(E);   
end

end

