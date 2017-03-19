function [ format ] = format_longitude( longitude)

format = num2str(abs(longitude));

if longitude >= 0
    format = strcat(format, ',E');
else
    format = strcat(format, ',W');
end

end
