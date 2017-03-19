function [ corners ] = find_corners( file )

max_lat = -18000;
min_lat = 18000;
max_long = -18000;
min_long = 18000;

tline = fgetl(file);
while ischar(tline)
    
    sentence = tline(2:6);
    
    if strcmp(sentence,'GPGLL')
        
        [latitude, longitude, ~, status] = get_GPGLL(tline);
        
        if strcmp(status, 'A') && checksum(tline)
            if latitude > max_lat
                max_lat = latitude;
            end

            if latitude < min_lat
                min_lat = latitude;
            end

            if longitude > max_long
                max_long = longitude;
            end

            if longitude < min_long
                min_long = longitude;
            end
        end
        
    end
    tline = fgetl(file);
end

c1 = format_latitude(max_lat);
c2 = format_latitude(min_lat);
c3 = format_longitude(max_long);
c4 = format_longitude(min_long);

corners = {c1, c2, c3, c4};

fclose(file);

end

