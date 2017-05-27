%1
taps1 = [3 10];
taps2 = [2 3 6 8 9 10];

% G1 = code_generation(taps1, 1023);
% G2 = code_generation(taps2, 1023);

%2
[str_CA1, CA1] = CA_code_generation(taps1, taps2, 1023, 1);
[str_CA2, CA2] = CA_code_generation(taps1, taps2, 1023, 2);

%3


%4
x = xcorr(CA1, CA2);

%5
