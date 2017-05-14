function [ format ] = format_latitude( latitude)

format = num2str(abs(latitude));

if latitude >= 0
    format = strcat(format, ',N');
else
    format = strcat(format, ',S');
end

end

