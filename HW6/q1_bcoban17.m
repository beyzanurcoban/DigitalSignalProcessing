%%
%------------------------------ a ------------------------------%
N = 100;
n = 0:1:N;

%original x[n] signal
x = sin(2*pi*n*0.05)+sin(2*pi*n*0.4);
figure
stem((0:N),x)
xlabel('Samples (n)')
ylabel('Amplitude')
title('x[n]')

%128-point DFT of x[n]
X128 = fft(x,128);
figure
stem((0:127),abs(X128))
xlim([0 127])
xlabel('Samples (k)')
ylabel('Amplitude')
title('128 point DFT of x[n]')

%%
%------------------------------ b ------------------------------%

%downsampled y[n] signal
y = downsample(x,2);

figure
stem((0:length(y)-1),y)
xlabel('Samples (n)')
ylabel('Amplitude')
title('y[n]')

Y128 = fft(y,128);
figure
stem((0:127),abs(Y128))
xlim([0 127])
xlabel('Samples (k)')
ylabel('Amplitude')
title('128 point DFT of y[n]')

%%
%------------------------------ c ------------------------------%

%define antialiasing filter
h = zeros(1,5);
for i = 1:5
    h(i) = 0.2;
end

%original z[n] signal
z = conv(x,h);
%downsampled z[n] signal
z = downsample(z,2);

figure
stem((0:length(z)-1),z)
xlabel('Samples (n)')
ylabel('Amplitude')
title('z[n]')

Z128 = fft(z,128);
figure
stem((0:127),abs(Z128))
xlim([0 127])
xlabel('Samples (k)')
ylabel('Amplitude')
title('128 point DFT of z[n]')

%%
%------------------------------ d ------------------------------%
% downsampled y[n] and z[n] signals
y_up = upsample(y,2);
z_up = upsample(z,2);

figure
stem((0:length(y_up)-1),y_up)
xlabel('Samples (n)')
ylabel('Amplitude')
title('yup[n]')

figure
stem((0:length(z_up)-1),z_up)
xlabel('Samples (n)')
ylabel('Amplitude')
title('zup[n]')

Y_up128 = fft(y_up,128);
figure
stem((0:127),abs(Y_up128))
xlim([0 127])
xlabel('Samples (k)')
ylabel('Amplitude')
title('128 point DFT of yup[n]')

Z_up128 = fft(z_up,128);
figure
stem((0:127),abs(Z_up128))
xlim([0 127])
xlabel('Samples (k)')
ylabel('Amplitude')
title('128 point DFT of zup[n]')

%%
%------------------------------ e ------------------------------%
% zero-order hold interpolation for y_up[n]
nn1 = 0:1:length(y_up)-1;
nq1 = 0:0.25:length(y_up)-1;
zero_ordery = interp1(nn1,y_up,nq1,'nearest');

% zero-order hold interpolation for z_up[n]
nn2 = 0:1:length(z_up)-1;
nq2 = 0:0.25:length(z_up)-1;
zero_orderz = interp1(nn2,z_up,nq2,'nearest');

figure
plot(nn1,y_up,'o',nq1,zero_ordery,':.')
xlabel('Samples (n)')
ylabel('Amplitude')
title('zero-order hold interpolation for yup[n]')

figure
plot(nn2,z_up,'o',nq2,zero_orderz,':.')
xlabel('Samples (n)')
ylabel('Amplitude')
title('zero-order hold interpolation for zup[n]')

zuy = fft(zero_ordery,128);
figure
stem((0:127),abs(zuy))
xlim([0 127])
xlabel('Samples (k)')
ylabel('Amplitude')
title('128 point DFT of zero-order hold interpolated yup[n]')

zuz = fft(zero_orderz,128);
figure
stem((0:127),abs(zuz))
xlim([0 127])
xlabel('Samples (k)')
ylabel('Amplitude')
title('128 point DFT of zero-order hold interpolated zup[n]')

%%
%------------------------------ f ------------------------------%
% linear interpolation for y_up[n] and z_up[n]
linear_y = interp1(nn1,y_up,nq1);
linear_z = interp1(nn2,z_up,nq2);

figure
plot(nn1,y_up,'o',nq1,linear_y,':.')
xlabel('Samples (n)')
ylabel('Amplitude')
title('linear interpolation for yup[n]')

figure
plot(nn2,z_up,'o',nq2,linear_z,':.')
xlabel('Samples (n)')
ylabel('Amplitude')
title('linear interpolation for zup[n]')

ly = fft(linear_y,128);
figure
stem((0:127),abs(ly))
xlim([0 127])
xlabel('Samples (k)')
ylabel('Amplitude')
title('128 point DFT of linearly interpolated yup[n]')

lz = fft(linear_z,128);
figure
stem((0:127),abs(lz))
xlim([0 127])
xlabel('Samples (k)')
ylabel('Amplitude')
title('128 point DFT of linearly interpolated zup[n]')

