function [ max_elev ] = max_elevation( file )

max_elev = 0;

tline = fgetl(file);
while ischar(tline)
    
    sentence = tline(2:6);
    
    if strcmp(sentence,'GPGSV')
        
        [~, elev] = get_GPGSV(tline);
        
        if checksum(tline)
            if elev > max_elev
                max_elev = elev;
            end
        end
    end
    tline = fgetl(file);
end


end

