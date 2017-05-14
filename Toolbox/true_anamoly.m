function [ phi_0 ] = true_anamoly( e, E )

phi_0 = atan2(sqrt(1-e^2)*sin(E), cos(E)-e);

end

