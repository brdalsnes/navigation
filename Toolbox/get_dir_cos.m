function [ dir_cos ] = get_dir_cos( xyz )

h = norm(xyz);

dir_cos = [xyz(1)/h xyz(2)/h xyz(3)/h];

end

