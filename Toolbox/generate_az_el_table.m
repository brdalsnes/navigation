function [ output ] = generate_az_el_table( file, time, p1_xyz, a, f )

output = zeros(12,3);
counter = 1;

tline = fgetl(file);
while ischar(tline)
    
    [svn, p2_xyz] = get_satellite_position(tline, time);
    output(counter, 1) = svn;
    [azimuth, elevation] = az_el(p1_xyz, p2_xyz, a, f);
    output(counter, 2) = azimuth;
    output(counter, 3) = elevation;
    
    counter = counter + 1;
    tline = fgetl(file);
end

end

