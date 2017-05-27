function [ error ] = pseudo_error(npr, interval, ranges, offset, drift)

c = 299792458;

npr_file = fopen(npr);
pseudo_ranges = zeros(9, interval);

%Pseudo ranges
[rows, columns] = size(ranges);
for i = 1:rows
    for j = 1:columns
        pseudo_ranges(i,j) = ranges(i,j) + (offset + drift*(j-1))*c;
    end
end

[rows, cols] = size(ranges);
error_matrix = zeros(rows, cols);

%NPR file
counter = 1;
tline = fgetl(npr_file);
while ischar(tline)  
    sat_data = strsplit(tline);
    sat_data(1) = [];
    for i = 1:cols
        error_matrix(counter,i) = abs(pseudo_ranges(counter,i) - str2double(sat_data(i)));
    end
    
    counter = counter + 1;
    tline = fgetl(npr_file);
end

error = sum(sum(error_matrix))/(rows*cols);

end

