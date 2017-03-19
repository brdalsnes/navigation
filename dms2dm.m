function [ dm ] = dms2dm( dms )

latitude = dms(1:3);
longitude = dms(4:6);
altitude = dms(7);

latitude(2) = latitude(2) + (latitude(3)/60);
latitude(3) = [];

longitude(2) = longitude(2) + (longitude(3)/60);
longitude(3) = [];

dm = [latitude, longitude, altitude];

end

