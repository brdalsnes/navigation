function [ d ] = lat2d( read )

deg = str2double(read(1:2));
min = str2double(read(3:4));
sec = str2double(read(5:9)*0.0001*60);

d = deg + (min/60) + (sec/3600);

end

