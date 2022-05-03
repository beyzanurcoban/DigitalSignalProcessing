Samp_f=1000;
Samp_T=1/Samp_f;
len = 1000;
t=(0:len-1)*Samp_T;


f1 = 60;
f2 = 150;

s1 = 0.7 * cos(2*pi*f1.*t);
s2 = 1.1 * cos(2*pi*f2.*t);

noise = 0 + 2 .* randn([1,1000]);

sig = s1+s2+noise;

figure
plot(t, sig);
title('Noisy Signal');
xlabel('Time');
ylabel('Amplitude');

SIG = fft(sig);
f= Samp_f * (0:length(SIG)-1)/length(SIG);
figure
plot(f, mag2db(abs(SIG)), 'blue');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Fourier transform of the noisy signal');
