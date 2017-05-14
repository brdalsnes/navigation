function [ max_speed ] = max_speed( file )

max_speed = 0;

tline = fgetl(file);
while ischar(tline)
    
    sentence = tline(2:6);
    
    if strcmp(sentence,'GPRMC')
        
        [~, status, ~, ~, speed] = get_GPRMC(tline);
        
        if (strcmp(status,'A') || strcmp(status,'D')) && checksum(tline)
            if speed > max_speed
                max_speed = speed;
            end
        end
    end
    tline = fgetl(file);
end
%Convert to km/h
max_speed = 1.852*max_speed;
end

