function [ output ] = generate_satellite_table(file, time )

output = zeros(12,4);
counter = 1;

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

