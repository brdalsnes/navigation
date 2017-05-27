function [ vector ] = zero_one2minusone_one( vector )

for i = 1:length(vector)  
    if vector(i) == 0
        vector(i) = -1;
    end
end

