function [ num, angle] = get_GPGSV( message )

info = strsplit(message, ',');

num = str2double(info(4));
angle = str2double(info(6));

end

