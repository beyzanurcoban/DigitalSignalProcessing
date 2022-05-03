fsamp = 10000; % sampling rate

fp = 2000; % passband corner
fs = 2500; % stopband corner

fcuts = [fp fs];
m = [1 0]; % lowpass filter magnitudes
devs = [0.05 0.05]; % allowed tolerance values

% Kaiser Window Method

[n1, Wn1, beta1, ftype1] = kaiserord(fcuts,m,devs,fsamp);
f_kaiser = fir1(n1,Wn1,ftype1,kaiser(n1+1,beta1),'noscale');
[h1,w1] = freqz(f_kaiser, fsamp);
figure
plot(w1/pi,abs(h1))
title('Kaiser Window Method')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude')

% Parks-McClellan Method  
[n2, fo, mo, w] = firpmord(fcuts,m,devs,fsamp);
f_parksmc = firpm(n2,fo,mo,w);
[h2,w2] = freqz(f_parksmc, fsamp);
figure
plot(w2/pi,abs(h2))
title('Parks-McClellan Method')
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude')

fprintf("Order of Kaiser Window: %d\n", n1)
fprintf("Order of Parks-McClellan: %d\n", n2)