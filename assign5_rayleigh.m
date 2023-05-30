##N = 10^6;
##rand('state', 100);
##randn('state', 200);
##
##% Transmitter
##input = rand(1, N) > 0.5;
##s = 2 * input - 1;
##n = 1 / sqrt(2) * (randn(1, N) + 1j * randn(1, N));
##
##Eb_No_db = -3:10;
##nErr = zeros(size(Eb_No_db));
##
##for ii = 1:length(Eb_No_db)
##    % Noise Addition
##    y = s + 10^(-Eb_No_db(ii) / 20) * n;
##
##    % Receiver
##    inputHat = real(y) > 0;
##
##    % Counting the errors
##    nErr(ii) = sum(input ~= inputHat);
##end
##
##simBer = nErr / N;
##theoryBer = 0.5 * erfc(sqrt(10.^(Eb_No_db / 10)));
##
##% Plot
##close all
##figure
##semilogy(Eb_No_db, theoryBer, 'b.-');
##hold on
##semilogy(Eb_No_db, simBer, 'mx-');
##axis([-3 10 10^-5 0.5])
##grid on
##legend('Theory', 'Simulation');
##xlabel('Eb/No (dB)');
##ylabel('Bit Error Rate');
##title('Bit Error Rate Probability Curve for BPSK Modulation');
##

N = 10^6;
rand('state', 100);
randn('state', 200);

% Transmitter
input = rand(1, N) > 0.5;
s = 2 * input - 1;
n = 1 / sqrt(2) * (randn(1, N) + 1j * randn(1, N));

Eb_No_db = -3:10;
nErr = zeros(size(Eb_No_db));

for ii = 1:length(Eb_No_db)
    % Noise Addition
    y = s + 10^(-Eb_No_db(ii) / 20) * n;

    % Receiver
    inputHat = real(y) > 0;

    % Counting the errors
    nErr(ii) = sum(input ~= inputHat);
end

simBer = nErr / N;
theoryBer = 0.5 * erfc(sqrt(10.^(Eb_No_db / 10)));

% Rayleigh Theory
rayleighTheoryEb_No = 0:0.1:35;
rayleighTheoryBer = 0.5 * (1 - sqrt(1 + 10.^(rayleighTheoryEb_No / 10)));

% Rayleigh Simulation
rayleighSimEb_No = -3:0.1:35;
rayleighSimBer = 0.5 * erfc(sqrt(10.^(rayleighSimEb_No / 10)));

% Plot
close all
figure
semilogy(Eb_No_db, theoryBer, 'b.-');
hold on
semilogy(Eb_No_db, simBer, 'mx-');
semilogy(rayleighTheoryEb_No, rayleighTheoryBer, 'g.-');
semilogy(rayleighSimEb_No, rayleighSimBer, 'rx-');
axis([-3 35 10^-5 0.5])
grid on
legend('BPSK Theory', 'BPSK Simulation', 'Rayleigh Theory', 'Rayleigh Simulation');
xlabel('Eb/No (dB)');
ylabel('Bit Error Rate');
title('Bit Error Rate Probability Curve for BPSK Modulation and Rayleigh Fading Channel');

