function [ latitude, longitude, altitude, quality, utc ] = get_GPGGA( message )

info = strsplit(message, ',');

utc = str2double(info(2));
latitude = str2double(info(3));
longitude = str2double(info(5));
altitude = str2double(info(10));
quality = str2double(info(6));

%More convinient representation
if strcmp(info(4),'S')
    latitude = -latitude;
end
if strcmp(info(6),'W')
    longitude = -longitude;
end

end

