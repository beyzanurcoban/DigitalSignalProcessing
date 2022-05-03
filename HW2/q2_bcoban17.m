%Defining the signal for part b, c, d
t = 0:1:50; %sample points for the signal

unitstep = t>= 0; %unit step function, it is 0 when t<0

x = power(1/3, t).*unitstep; %exponential signal
figure
stem(t,x, 'Filled', 'LineWidth',2)
xlabel('Samples (n)')
ylabel('Amplitude')
title('Exponential signal')

%%
%------------------------------ b ------------------------------%
%16-point DFT
fft16 = fft(x, 16);
figure
stem((0:15),abs(fft16))
xlabel('Samples (k)')
ylabel('Amplitude')
title('L=16 point DFT of the exponential signal')


%%
%------------------------------ c ------------------------------%
%512-point DFT
fft512 = fft(x,512);
figure
stem((0:511),abs(fft512))
xlabel('Samples (k)')
ylabel('Amplitude')
title('L=512 point DFT of the exponential signal')


%%
%------------------------------ d ------------------------------%
%since MATLAB uses 1-based index, the DFT array contains k=2 value in its
%third location, and DFT array contains k=64 value in its 65th location

X16_2 = fft16(3);
X512_64 =  fft512(65);

analytical = 3/(3-exp(1i*pi/4));