%%
%------------------------------ a ------------------------------%
N = 15;

n = linspace(0,N-1,N); %sample points for the signal
x = triangularPulse(0,(N-1)/2,N-1,n); %triangular signal with 15 point

figure
stem((0:14),x)
xlabel('Samples (n)')
ylabel('Amplitude')
title('Triangular pulse with length N=15')

%16-point DFT and IDFT
X16 = fft(x,16); 
figure
stem((0:15),abs(X16))
xlabel('Samples (k)')
ylabel('Amplitude')
title('L=16 point DFT of the triangular pulse')

x16 = ifft(X16);
figure
stem((0:15),x16)
xlabel('Samples (n)')
ylabel('Amplitude')
title('L=16 point IDFT of X[k]')
%%
%------------------------------ b ------------------------------%

%32-point DFT and IDFT
X32 = fft(x,32);
figure(3)
stem((0:31),abs(X32))
xlabel('Samples (k)')
ylabel('Amplitude')
title('L=32 point DFT of the triangular pulse')

x32 = ifft(X32);
figure
stem((0:31),x32)
xlabel('Samples (n)')
ylabel('Amplitude')
title('L=32 point IDFT of X[k]')

%%
%------------------------------ c ------------------------------%

%64-point DFT and IDFT
X64 = fft(x,64);
figure
stem((0:63),abs(X64))
xlabel('Samples (k)')
ylabel('Amplitude')
title('L=64 point DFT of the triangular pulse')

x64 = ifft(X64);
figure
stem((0:63),x64)
xlabel('Samples (n)')
ylabel('Amplitude')
title('L=64 point IDFT of X[k]')

%%
%------------------------------ d ------------------------------%

%128-point DFT and IDFT
X128 = fft(x,128);
figure
stem((0:127),abs(X128))
xlabel('Samples (k)')
ylabel('Amplitude')
title('L=128 point DFT of the triangular pulse')

x128 = ifft(X128);
figure
stem((0:127),x128)
xlabel('Samples (n)')
ylabel('Amplitude')
title('L=128 point IDFT of X[k]')