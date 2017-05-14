function [ fails, order ] = count_fail( file )

tline = fgetl(file);
fails = 0;
index = 1;
order = [];

while ischar(tline)
    index = index + 1;
    if ~checksum(tline)
        fails = fails + 1;
        order(fails) = index;
    end
    tline = fgetl(file);
end


end

