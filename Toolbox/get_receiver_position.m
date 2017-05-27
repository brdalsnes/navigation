function [ estimate, iterations ] = get_receiver_position( npr, eph, weeks, seconds, estimate)
%Least squares

npr_file = fopen(npr);
pseudo_ranges = [];

counter = 1;
tline = fgetl(npr_file);
while ischar(tline)
    data = strsplit(tline);
    data(1) = []; %Remove blank first element
    pseudo_ranges = [pseudo_ranges; str2double(data(1))];
    counter = counter + 1;
    
    tline = fgetl(npr_file);
end
    

prev = [-1 -1 -1 -1]';
estimate = [estimate, 1]';
iterations = 0;
time = time_fixer(seconds, weeks, 0);

while abs(prev - estimate) > 0.001
    H = [];
    z = [];

    eph_file = fopen(eph);
    tline = fgetl(eph_file);
    counter = 1;
    while ischar(tline)
    
        [~, xyz] = get_satellite_position_tx(tline, time, estimate(1:3)');
            
        e0 = ((xyz - estimate(1:3)')/norm(xyz - estimate(1:3)'))';
    
        H = [H; [-e0', 1]];
        z = [z; pseudo_ranges(counter) - e0'*xyz'];
    
        counter = counter + 1;
        tline = fgetl(eph_file);
    end
    fclose(eph_file);

prev = estimate;
estimate = inv(H'*H)*H'*z;
iterations = iterations + 1;

end

end

