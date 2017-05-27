function [ str_code ] = code_generation( taps, code_length)

code = zeros(1, code_length);
register = ones(1, 10);

for i = 1:code_length
    
    code(i) = register(end);
    
    bits = register(taps);
    
    A = bits(1);
    for j = 1:length(bits)-1
        bits(1) = [];
        B = bits(1);
        A = xor(A,B);
    end
    
    register(end) = [];
    register = [A, register];

end

str_code = '';
for i = 1:code_length
    str_code = strcat(str_code, num2str(code(i)));
end

end
    

