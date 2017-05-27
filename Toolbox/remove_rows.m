function [ mat ] = remove_rows( mat, binary_vector )

index_vector = [];

for i = 1:length(binary_vector)
    if binary_vector(i) == 0
        index_vector = [index_vector, i];
    end
end

mat(index_vector,:) = [];

end

