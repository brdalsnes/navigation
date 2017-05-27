function [ output ] = generate_satellite_table_tx(file, time, r)

output = zeros(12,5);
counter = 1;

tline = fgetl(file);
while ischar(tline)
    
    [svn, xyz] = get_satellite_position_tx(tline, time, r);
    xyz = xyz';
    output(counter, 1) = svn;
    output(counter, 2:4) = xyz;
    [~, old_xyz] = get_satellite_position(tline, time);
    output(counter, 5) = norm(old_xyz - xyz');
    
    counter = counter + 1;
    tline = fgetl(file);
end

end

