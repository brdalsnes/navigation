function [ gain ] = cumulative( file )

gain = 0;
previous = 0;

tline = fgetl(file);
while ischar(tline)
    
    sentence = tline(2:6);
    
    if strcmp(sentence,'GPGGA')
        
        [~, ~, altitude, quality] = get_GPGGA(tline);
        if previous == 0
            previous = altitude;
        end
        
        if ~ismember(quality, [0,6,7,8]) && checksum(tline)
            if altitude > previous
                gain = gain + (altitude - previous);
            end
            previous = altitude;
        end
    end
    tline = fgetl(file);
end
end

