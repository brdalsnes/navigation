function [ count ] = count_lines( file )

tline = fgetl(file);
count = 0;

while ischar(tline)
    tline = fgetl(file);
    count = count + 1; 
end

fclose(file);
end

