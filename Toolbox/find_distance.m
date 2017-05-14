function [ dist ] = find_distance( start, file, a, f)

prev_point = start;
dist = 0;

tline = fgetl(file);
while ischar(tline)
    
    sentence = tline(2:6);
    
    if strcmp(sentence,'GPGGA')
        [ latitude, longitude, altitude, quality] = get_GPGGA(tline);
        
        if ~ismember(quality, [0,6,7,8]) && checksum(tline)
            point = llh2xyz([latitude, longitude, altitude], a, f);
            dist = dist + norm(point - prev_point)
            prev_point = point;
        end
    end
    tline = fgetl(file);
end

end

