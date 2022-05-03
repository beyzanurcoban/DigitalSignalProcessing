%------------------------------ a ------------------------------%

% N = 6
%signal definitions
x1 = [6 5 4 3 2 1]; 
x2 = [1 0 0 0 1];

%6-point fft calculation
fftx1_6 = fft(x1,6);
fftx2_6 = fft(x2,6);

%circular convolution is equal to multiplication in DFT domain
yK_6 = fftx1_6.*fftx2_6;

y6 = ifft(yK_6);

figure
stem((0:5),y6)
xlabel('Samples (k)')
ylabel('Amplitude')
title('Circular convolution of x1 and x2 when N=6')

% N = 10
%10-point fft calculation
fftx1_10 = fft(x1,10);
fftx2_10 = fft(x2,10);

yK_10 = fftx1_10.*fftx2_10;

y10 = ifft(yK_10);

figure
stem((0:9),y10)
xlabel('Samples (k)')
ylabel('Amplitude')
title('Circular convolution of x1 and x2 when N=10')