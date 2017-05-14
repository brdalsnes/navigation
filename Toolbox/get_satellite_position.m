function [ svn, xyz, r , i, Omega] = get_satellite_position(line, time)

OmegaDot_e = 7.2921151467*10^-5; %Earth rotation rate
    
    data = get_satellite_data(line);
    
    A = data('sqrt_A')^2;
    e = data('e');
    delta_n = data('delta_n');
    eta = mean_angular_motion(A, delta_n);
    toe = time_fixer(data('toe'), data('WN'), 1);
    delta_t = time - toe;
    M = data('M0') + mean_anamoly(delta_t, eta);
    E = eccentric_anamoly(M, e, 10^-12);
    
    r0 = satellite_radius(A, e, E);
    phi0 = true_anamoly(e, E);
    phi = phi0 + data('omega');
    delta_r = data('Crc')*cos(2*phi) + data('Crs')*sin(2*phi);
    r = r0 + delta_r;
    
    delta_u = data('Cuc')*cos(2*phi) + data('Cus')*sin(2*phi);
    u = phi + delta_u;
    
    delta_i = data('Cic')*cos(2*phi) + data('Cis')*sin(2*phi);
    i = data('i0') + delta_i + data('IDOT')*delta_t;
    
    Omega = data('Omega0') + (data('OmegaDot') - OmegaDot_e)*delta_t - OmegaDot_e*data('toe');
    
    svn = data('SVN');
    xyz = [r*cos(u) r*sin(u) 0]*Rot_x(-i)*Rot_z(-Omega);


end

