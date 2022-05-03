% Variables
Rp = 0.5; % passband ripple
Rs = 40; % minimum stopband attenuation

F_sampling = 44000; % sampling rate

fp = 4000; % passband corner frequency
fs = 8000; % sropband corner frequency
Wp = 2*fp/F_sampling;
Ws = 2*fs/F_sampling;

% Butterworth Filter
[n_butterworth, Wn1] = buttord(Wp, Ws, Rp, Rs);
[b1,a1] = butter(n_butterworth, Wn1);
[H1,w1] = freqz(b1,a1);

figure
subplot(2,1,1);
plot(w1,abs(H1))
ylabel('Gain')
xlabel('Frequency (f/Fs) (rad/sample)')
title('Amplitude Response - Butterworth')

subplot(2,1,2); 
plot(w1,angle(H1))
ylabel('Phase (rad)')
xlabel('Frequency (f/Fs) (rad/sample)')
title('Phase Response - Butterworth')

figure
freqz(b1,a1)
title('Transfer Function - Butterworth')
%%

% Chebyshev-I Filter
[n_chebyshev1, Wn2] = cheb1ord(Wp, Ws, Rp, Rs);
[b2,a2] = cheby1(n_chebyshev1, Rp, Wp);
[H2,w2] = freqz(b2,a2);

figure
subplot(2,1,1);
plot(w2,abs(H2))
ylabel('Gain')
xlabel('Frequency (f/Fs) (rad/sample)')
title('Amplitude Response - Chebyshev-I')

subplot(2,1,2); 
plot(w2,angle(H2))
ylabel('Phase (rad)')
xlabel('Frequency (f/Fs) (rad/sample)')
title('Phase Response - Chebyshev-I')

figure
freqz(b2,a2)
title('Transfer Function - Chebyshev-I')
%%
% Chebyshev-II Filter
[n_chebyshev2, Wn3] = cheb2ord(Wp, Ws, Rp, Rs);
[b3,a3] = cheby2(n_chebyshev2, Rs, Ws);
[H3,w3] = freqz(b3,a3);

figure
subplot(2,1,1);
plot(w3,abs(H3))
ylabel('Gain')
xlabel('Frequency (f/Fs) (rad/sample)')
title('Amplitude Response - Chebyshev-II')

subplot(2,1,2); 
plot(w3,angle(H3))
ylabel('Phase (rad)')
xlabel('Frequency (f/Fs) (rad/sample)')
title('Phase Response - Chebyshev-II')

figure
freqz(b3,a3)
title('Transfer Function - Chebyshev-II')
%%
% Elliptic Filter
[n_elliptic, Wn4] = ellipord(Wp, Ws, Rp, Rs);
[b4,a4] = ellip(n_elliptic, Rp, Rs, Wp);
[H4,w4] = freqz(b4,a4);

figure
subplot(2,1,1);
plot(w4,abs(H4))
ylabel('Gain')
xlabel('Frequency (f/Fs) (rad/sample)')
title('Amplitude Response - Elliptic')

subplot(2,1,2); 
plot(w4,angle(H4))
ylabel('Phase (rad)')
xlabel('Frequency (f/Fs) (rad/sample)')
title('Phase Response - Elliptic')

figure
freqz(b4,a4)
title('Transfer Function - Elliptic')

