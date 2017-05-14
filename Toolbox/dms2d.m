function [ d ] = dms2d( dms )

latitude = dms(1:3);
longitude = dms(4:6);
altitude = dms(7);

latitude(1) = latitude(1) + (latitude(2)/60) + (latitude(3)/3600);
latitude(2) = [];
latitude(2) = [];

longitude(1) = longitude(1) + (longitude(2)/60) + (longitude(3)/3600);
longitude(2) = [];
longitude(2) = [];

d = [latitude, longitude, altitude];

end

