function [ ranges ] = create_ranges( eph, time, interval ,r1)

eph_file = fopen(eph);
ranges = zeros(9, interval);

%Ranges
counter = 1;
tline = fgetl(eph_file);
while ischar(tline) 
    for i = 1:interval
        [~, xyz] = get_satellite_position_tx(tline, time + i - 1, r1);
        ranges(counter, i) = norm(r1 - xyz);
    end
    counter = counter + 1;
    tline = fgetl(eph_file);
end


end

