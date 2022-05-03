%------------------------------ a ------------------------------%
x = [1 1 1 1 0 0 0 0];

fft8 = fft(x, 8);
figure
stem((0:7),abs(fft8)) %according to K values, plot the diagram
xlabel('Samples (k)')
ylabel('Amplitude')
title('L=8 point DFT of the signal x[n]')


%% 
%------------------------------ b ------------------------------%
%produce y signal from x signal
y = zeros(1,16);
for i = 1:16
    if(rem(i,2) == 0)
        y(i) = x(i/2);
    else 
        y(i) = 0;
    end
end

fft16 = fft(y, 16);
figure
stem((0:15),abs(fft16))
xlabel('Samples (k)')
ylabel('Amplitude')
title('L=16 point DFT of the signal y[n]')