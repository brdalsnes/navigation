function [ okay ] = checksum( line )

str = strtok(line,'$*');
str = uint8(str);
chk = 0;
for i = 1:size(str,2)
    chk = bitxor(chk,str(i));
end
chk = dec2hex(chk,2);

split = strsplit(line, '*');

if hex2dec(chk) == hex2dec(split(2))
    okay = true;
else
    okay = false;
end


