function [ output ] = generate_cos_table( file, time )

output = zeros(12,4);
counter = 1;

tline = fgetl(file);
while ischar(tline)
    
    [svn, xyz] = get_satellite_position_tx(tline, time);
    output(counter, 1) = svn;
    dir_cos = get_dir_cos(xyz);
    output(counter, 2:4) = dir_cos;
    
    counter = counter + 1;
    tline = fgetl(file);
end


end

