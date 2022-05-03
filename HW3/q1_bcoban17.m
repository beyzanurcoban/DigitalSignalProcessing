%DFT size and sample points
N = 128;
n = 0:N-1;

%signals 
x1 = cos(pi*n/4) + cos(0.26*pi*n);
x2 = cos(pi*n/4) + (1/3)*cos(pi*n/8);
x3 = cos(pi*n/8) + (1/3)*cos(pi*n/16);

%------------------------------ a ------------------------------%
w1 = rectwin(N); %producing a rectangular window with length 128

%elementwise multiplication of the signals and the rectangular window
v11 = x1 .* w1';
v12 = x2 .* w1';
v13 = x3 .* w1';

%DFT calculations of the resulting signals
V11 = fft(v11, N);
V12 = fft(v12, N);
V13 = fft(v13, N);

%plotting DFTs
figure
stem((0:N-1),abs(V11))
xlabel('Samples (k)')
ylabel('Amplitude')
title('N=128 point DFT of x1 and rectangular window')

figure
stem((0:N-1),abs(V12))
xlabel('Samples (k)')
ylabel('Amplitude')
title('N=128 point DFT of x2 and rectangular window')

figure
stem((0:N-1),abs(V13))
xlabel('Samples (k)')
ylabel('Amplitude')
title('N=128 point DFT of x3 and rectangular window')

%------------------------------ b ------------------------------%
w2 = hamming(N); %producing a hamming window of 128 points

%elementwise multiplication of the signals and the hamming window
v21 = x1 .* w2';
v22 = x2 .* w2';
v23 = x3 .* w2';

%DFT calculations of the resulting signals
V21 = fft(v21, N);
V22 = fft(v22, N);
V23 = fft(v23, N);

%plotting DFTs
figure
stem((0:N-1),abs(V21))
xlabel('Samples (k)')
ylabel('Amplitude')
title('N=128 point DFT of x1 and hamming window')

figure
stem((0:N-1),abs(V22))
xlabel('Samples (k)')
ylabel('Amplitude')
title('N=128 point DFT of x2 and hamming window')

figure
stem((0:N-1),abs(V23))
xlabel('Samples (k)')
ylabel('Amplitude')
title('N=128 point DFT of x3 and hamming window')
