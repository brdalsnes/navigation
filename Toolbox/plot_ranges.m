function [ ] = plot_ranges( file, time, interval, r1, el_limit, a, f )

ranges = zeros(9, interval);
svns = zeros(1, 9);

counter = 1;
tline = fgetl(file);
while ischar(tline)
    
    [svn] = get_satellite_position_tx(tline, time, r1);
    svns(counter) = svn;
    
    for i = 1:interval
        [~, xyz] = get_satellite_position_tx(tline, time + i - 1, r1);
        [~, elevation] = az_el(r1, xyz, a, f);
        
        if elevation > el_limit
            ranges(counter, i) = norm(r1 - xyz);
        else
            ranges(counter,:) = [];
            counter = counter - 1;
            break
        end
        
    end
    
    counter = counter + 1;
    tline = fgetl(file);
end

ranges

%Ranges
[rows, ~] = size(ranges);
for i = 1:rows
    plot(ranges(i,:));
    info{i} = num2str(svns(i));
    hold on
end
legend(info);

