function [ latitude, longitude, utc, status ] = get_GPGLL( message)

info = strsplit(message, ',');

latitude = str2double(info(2));
longitude = str2double(info(4));
utc = str2double(info(6));
status = info(7);

%More convinient representation
if strcmp(info(3),'S')
    latitude = -latitude;
end
if strcmp(info(5),'W')
    longitude = -longitude;
end
end

