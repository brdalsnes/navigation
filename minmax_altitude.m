function [ min_out, max_out ] = minmax_altitude( file )

min_altitude = 9999;
max_altitude = -9999;

tline = fgetl(file);
while ischar(tline)
    
    sentence = tline(2:6);
    
    if strcmp(sentence,'GPGGA')
        
        [latitude, longitude, altitude, quality, utc] = get_GPGGA(tline);
        
        if ~ismember(quality, [0,6,7,8]) && checksum(tline)
            if altitude > max_altitude
                max_altitude = altitude;
                max_out = {num2str(altitude), format_latitude(latitude), format_longitude(longitude), num2str(utc)};
            end
            if altitude < min_altitude
                min_altitude = altitude;
                min_out = {num2str(altitude), format_latitude(latitude), format_longitude(longitude), num2str(utc)};
            end
        end
    end
    tline = fgetl(file);
end
end

