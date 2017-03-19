function [ utc, status, latitude, longitude, speed ] = get_GPRMC( message )

info = strsplit(message, ',');

utc = str2double(info(2));
status = info(3);
latitude = str2double(info(4));
longitude = str2double(info(6));
speed = str2double(info(8));

%More convinient representation
if strcmp(info(5),'S')
    latitude = -latitude;
end
if strcmp(info(7),'W')
    longitude = -longitude;
end


end

