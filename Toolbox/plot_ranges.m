function [ ] = plot_ranges( file, time, r1, el_limit, a, f )

tline = fgetl(file);
while ischar(tline)
    
    [svn, xyz, ~ , i, Omega] = get_satellite_position(tline, time);
    output(counter, 1) = svn;
    output(counter, 2:4) = xyz;                       
    output(counter, 5) = mod(i*180/pi,360);
    output(counter, 6) = mod(Omega*180/pi,360);
    
    counter = counter + 1;
    tline = fgetl(file);
end


end

