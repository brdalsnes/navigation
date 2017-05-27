function [ PDOP, HDOP ] = get_DOP( eph ,time, r0, num_satellites)
    
    %Collect satellite coordinates
    satellite_coords = [];
    eph_file = fopen(eph);
    tline = fgetl(eph_file);
    while ischar(tline)
    
        [~, xyz] = get_satellite_position_tx(tline, time, r0);
        satellite_coords = [satellite_coords; xyz];
        
        tline = fgetl(eph_file);
    end
    fclose(eph_file);
    
    sat_vector = zeros(1,8);
    for i = 1:num_satellites
        sat_vector(i) = 1;
    end
    
    comb_matrix = perms(sat_vector);
    [rows, ~] = size(comb_matrix);
    
    PDOP = zeros(1, rows);
    HDOP = zeros(1, rows);
    
    for i = 1:rows
        H = [];
        selected_coords = remove_rows(satellite_coords, comb_matrix(i,:));
        
        for j = 1:num_satellites
            xyz = selected_coords(j,:);
            e0 = ((xyz - r0)/norm(xyz - r0))';
            H = [H; [-e0', 1]];
        end
        
        M = inv(H'*H);
        PDOP(i) = sqrt(trace(M(1:3,1:3)));
        HDOP(i) = sqrt(trace(M(1:2,1:2)));
    end

end

