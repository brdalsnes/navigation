function [ max_sat ] = satellites_in_view( file )

max_sat = 0;

tline = fgetl(file);
while ischar(tline)
    
    sentence = tline(2:6);
    
    if strcmp(sentence,'GPGSV')
        
        [sat] = get_GPGSV(tline);
        
        if checksum(tline)
            if sat > max_sat
                max_sat = sat;
            end
        end
    end
    tline = fgetl(file);
end


end

