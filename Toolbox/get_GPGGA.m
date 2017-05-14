function [ latitude, longitude, altitude, quality, utc ] = get_GPGGA( message )

info = strsplit(message, ',');

utc = str2double(info(2));
latitude = lat2d(info(3));
longitude = long2d(info(5));
altitude = str2double(info(10));
quality = str2double(info(7));

%More convinient representation
if strcmp(info(4),'S')
    latitude = -latitude;
end
if strcmp(info(6),'W')
    longitude = -longitude;
end

end

