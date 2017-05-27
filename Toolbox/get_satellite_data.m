function [ data ] = get_satellite_data( line )

split_line = strsplit(line);
split_line(1) = []; %Remove blank first element

data = containers.Map();
data('SVN') = str2double(split_line(1));
data('WN') = str2double(split_line(4));
data('toe') = str2double(split_line(7));
data('sqrt_A') = str2double(split_line(34));
data('delta_n') = str2double(split_line(37));
data('M0') = str2double(split_line(40));
data('e') = str2double(split_line(43));
data('omega') = str2double(split_line(46));
data('i0') = str2double(split_line(49));
data('IDOT') = str2double(split_line(52));
data('Omega0') = str2double(split_line(55));
data('OmegaDot') = str2double(split_line(58));
data('Cuc') = str2double(split_line(61));
data('Cus') = str2double(split_line(64));
data('Crc') = str2double(split_line(67));
data('Crs') = str2double(split_line(70));
data('Cic') = str2double(split_line(73));
data('Cis') = str2double(split_line(76));

end

