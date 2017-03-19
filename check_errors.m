function [ errors ] = check_errors( file )

errors = 0;

tline = fgetl(file);
while ischar(tline)
    
    if ~checksum(tline)
        errors = errors + 1;
    end
    
    tline = fgetl(file);
end
end

