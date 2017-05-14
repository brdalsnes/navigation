function [ svn, xyz ] = get_satellite_position_tx( line, time)

c = 299792458; %Speed of light
OmegaDot_e = 7.2921151467*10^-5; %Earth rotation rate

data = get_satellite_data(line);

svn = data('SVN');


d = 1;
d_ = 0;

while abs(d_ - d) >= 0.001
    
    d = d_;
    t_tx = time - (d/c);
    [svn, xyz, r] = get_satellite_position(line, t_tx);
    delta_Omega = OmegaDot_e*d/c;
    xyz = Rot_z(-delta_Omega)*xyz';
    d_ = norm(xyz - r');
    
end


end

