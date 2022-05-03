figure
fir_filter1 = fir1(25, [0.1, 0.3]);
freqz(fir_filter1,1,500)

figure
fir_filter2 = fir1(25, [0.4, 0.6]);
freqz(fir_filter2,1,500)

figure
fir_filter3 = fir1(25, [0.7, 0.9]);
freqz(fir_filter3,1,500)

n = 0:150;

x = 2*cos(52*pi*n/256) + 3*cos(200*pi*n/256);
fft_x = fft(x);
figure
plot(x)
figure
plot(mag2db(abs(fft_x)))


output1 = filter(fir_filter1, 1, x);
output2 = filter(fir_filter2, 1, x);
output3 = filter(fir_filter3, 1, x);

fft_1 = fft(output1);
fft_2 = fft(output2);
fft_3 = fft(output3);

figure
plot(mag2db(abs(fft_1)))
figure
plot(mag2db(abs(fft_2)))
figure
plot(mag2db(abs(fft_3)))

figure
plot(output1)
figure
plot(output2)
figure
plot(output3)
