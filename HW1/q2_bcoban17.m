fs = 1000;  %sampling frequency
T = 1/fs; %sampling periof
len = 1000; %signal length
t = (0:len-1)*T; %time vector 
freq1 = 60; %frequency of the first signal component
freq2 = 150; %frequency of the second signal component

%sinusoidal signals
sin60Hz = 0.7 * cos(2*pi*freq1.*t);
sin150Hz = 1.1 * cos(2*pi*freq2.*t);

%zero-mean random white noise with variance 4
variance = 4;
noise = sqrt(variance)*randn(size(t)); 

%original signal without noise
orig_sig = sin60Hz + sin150Hz;

%signal with noise
sig_w_noise = orig_sig + noise;
figure
plot(t,sig_w_noise)
xlabel('Time (s)')
ylabel('Amplitude')
title('Time domain representation of the noisy signal')

%fourier transform of the original signal
fft_orig = fft(orig_sig);

%fourier transform of the noisy signal
signal_fft = fft(sig_w_noise);
double_sided = abs(signal_fft/len);
single_sided = double_sided(1:len/2+1);
single_sided(2:end-1) = 2*single_sided(2:end-1);
freq = fs*(0:(len/2))/len;

figure
plot(freq, single_sided);
xlabel('Frequency (Hz)')
ylabel('Magnitude ')
title('Single sided amplitude spectrum of the noisy signal')