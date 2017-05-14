function [ d ] = long2d( read )

deg = str2double(read(2:3));
min = str2double(read(4:5));
sec = str2double(read(6:10)*0.0001*60);

d = deg + (min/60) + (sec/3600);

end

