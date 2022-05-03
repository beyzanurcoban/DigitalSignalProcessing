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
fprintf('Order of Butterworth Filter: %d\n', n_butterworth)

% Chebyshev-I Filter
[n_chebyshev1, Wn2] = cheb1ord(Wp, Ws, Rp, Rs);
fprintf('Order of Chebyshev-I Filter: %d\n', n_chebyshev1)

% Chebyshev-II Filter
[n_chebyshev2, Wn3] = cheb2ord(Wp, Ws, Rp, Rs);
fprintf('Order of Chebyshev-II Filter: %d\n', n_chebyshev2)

% Elliptic Filter
[n_elliptic, Wn4] = ellipord(Wp, Ws, Rp, Rs);
fprintf('Order of Elliptic Filter: %d\n', n_elliptic)

