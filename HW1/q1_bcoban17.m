%to represent the 301 samples
n = 0:300;
%I divided one period of cosine into 301 pieces to produce the samples
t = linspace(0, 2*pi, length(n));

%minimum and maximum frequency 
w_min = 0;
w_max = pi;

%the slope gives us the amount of incrementation of the frequency in each
%step
slope = (w_max-w_min)/length(n);

%the frequency is a linear function that increases as n increases
w = w_min + slope.*n; 

%function
y = cos(w.*t);
stem(t,y)
xticks([0 pi/2 pi 3*pi/2 2*pi])
xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})
xlabel('Frequency (w)')
ylabel('Magnitude of cos(wt)')
title('Swept-frequency Cosine Signal')