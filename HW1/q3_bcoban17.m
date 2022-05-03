%------------------------------ a ------------------------------%

%25th order FIR bandpass filter with passband 0.40π ≤ ω ≤ 0.80π 
fir25th = fir1(25, [0.4, 0.8]);
figure
freqz(fir25th,1,500)
title('25th order FIR bandpass filter with passband 0.40π ≤ ω ≤ 0.80π')

%35th order FIR bandpass filter with passband 0.40π ≤ ω ≤ 0.80π 
fir35th = fir1(35, [0.4, 0.8]);
figure
freqz(fir35th,1,500)
title('35th order FIR bandpass filter with passband 0.40π ≤ ω ≤ 0.80π')

%------------------------------ b ------------------------------%

fir_filter1 = fir1(25, [0.1, 0.3]);
fir_filter2 = fir1(25, [0.4, 0.6]);
fir_filter3 = fir1(25, [0.7, 0.9]);

%------------------------------ c ------------------------------%

n = 0:150; %data points

%input signal
x = 2*cos(52*pi*n/256) + 3*cos(200*pi*n/256);
fft_x = fft(x);

%output signals of the filters
output1 = filter(fir_filter1, 1, x); 
output2 = filter(fir_filter2, 1, x);
output3 = filter(fir_filter3, 1, x);

%fourier transforms of the output signals 
fft_1 = fft(output1); 
fft_2 = fft(output2);
fft_3 = fft(output3);

%------------------------------ d ------------------------------%

%plotting the input signal and its fft
figure
plot(x)
xlabel('Sample (n)')
ylabel('Magnitude of x[n]')
title('Input signal')
figure
%plot(mag2db(abs(fft_x)))
plot(abs(fft_x/length(n)))
xlabel('Frequency (w)')
ylabel('Magnitude (dB)')
title('Fourier transform of the input signal')

%plotting the output signals
figure
plot(output1)
xlabel('Sample (n)')
ylabel('Magnitude of y[n]')
title('Output signal from 0.10π ≤ ω ≤ 0.30π')
figure
plot(output2)
xlabel('Sample (n)')
ylabel('Magnitude of y[n]')
title('Output signal from 0.40π ≤ ω ≤ 0.60π')
figure
plot(output3)
xlabel('Sample (n)')
ylabel('Magnitude of y[n]')
title('Output signal from 0.70π ≤ ω ≤ 0.90π')