function [ str_code, code ] = CA_code_generation(taps1, taps2, code_length, index)

code_phase = [2 6;
              3 7];
register1 = ones(1,10);
register2 = ones(1,10);        
code = zeros(1, code_length);

for i = 1:code_length
    
    %Combine
    bits = register2(code_phase(index,:));
    A = xor(bits(1), bits(2));
    B = register1(10);
    
    code(i) = xor(A, B);
    
    %G1
    bits = register1(taps1);
    A = bits(1);
    for j = 1:length(bits)-1
        bits(1) = [];
        B = bits(1);
        A = xor(A,B);
    end
    register1(end) = [];
    register1 = [A, register1];
    
    %G2
    bits = register2(taps2);
    A = bits(1);
    for j = 1:length(bits)-1
        bits(1) = [];
        B = bits(1);
        A = xor(A,B);
    end
    register2(end) = [];
    register2 = [A, register2];

end

code = zero_one2minusone_one(code);

str_code = '';
for i = 1:code_length
    str_code = strcat(str_code, num2str(code(i)));
end


end

