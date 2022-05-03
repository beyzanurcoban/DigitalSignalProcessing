N = 256; %DFT size
n = 0:16000; %sample points for the discrete-time signal x[n]

%signal
x = cos((pi*n/4) + 1000*sin(pi*n/8000));

%256-point rectangular window
w = rectwin(N);

%spectogram of |X[n,k]| 
spectrogram(x,w, 'yaxis');
title('Spectrogram of |X[n,k]| using 256-point rectangular window')
