n = linspace(0, 1, 300);
f0 = 0;
f1 = pi;
y = chirp(n, f0, n(end), f1);
stem(y)
title('Swept-fequency Cosine Signal')
ylabel('Amplitude')

%%
n = 0:1:300;
n_sample = 301;
f_initial = 0;

% to convert w to Hz: 
% w [radians/sample] * n [sample/second] * (1/2pi) [cycles/radian] = wn/2pi
% [cycles/second] 
%f_final = pi*n_sample/(2*pi);
f_final = pi;

slope = (f_final - f_initial)/n(end);
y = cos(2*pi*slope.*n);
stem(y)


%%
Fs=301; % sample rate 
tf=2; % 2 seconds
t=0:1/Fs:tf-1/Fs;
f1=0;
f2=pi; % start @ 100 Hz, go up to 400Hz
semi_t=0:1/Fs:(tf/2-1/Fs);
sl=2*(f2-f1/2);
f1=f1*semi_t+(sl.*semi_t/2);
f2=f1(end)+f2*semi_t-sl.*semi_t/2;
f=[f1 f2];
y=1.33*cos(2*pi*f.*t);
plot(t,y)

%%
swept_startfreq = 0;
swept_endfreq = pi;
fs = 301;
swept_dursec = 2;  % duration of signal in seconds  
swept_t = (0:swept_dursec*fs)/fs;  % Time vector

swept_sig_out = cos(2*pi*swept_t);
stem(swept_sig_out)

%%
start_freq=0;
end_freq=pi;
fs_rate=301;
len_of_sig=3; %len in seconds
t=linspace(0,2*pi*len_of_sig,fs_rate*len_of_sig);
f0= start_freq; %inital frequency
f1= (end_freq/2)+(start_freq/2);%ending frequency formula
f=f0:(f1-f0)/length(t):f1-(f1-f0)/length(t); 

data=cos(f.*t);
stem(data)

%%
f_initial = 0;
f_final = pi;

sampling = 301;
time = 1;

t = linspace(0,2*pi*time,sampling*time);

f0 = f_initial;
f1 = (f_initial+f_final)/2;
f = f0:(f1-f0)/length(t):f1-(f1-f0)/length(t);

y = cos(f.*t);
stem(y)

%%
n = 0:300;
t = linspace(0, 2*pi, length(n));

wi = 0;
wf = pi;

slope = (wf-wi)/length(n);

w = wi + slope.*n; 

y = cos(w.*t);
stem(y)




