%------------------------------ a ------------------------------%
t = 0:0.00001:10;
for i = 0:0.5:2
    y = cos(i*pi*t);
    figure
    plot(t, y)
    title('Continuous cosine signal x(t) = cos(Ωt)')
    xlabel('Sample (t)')
    ylabel('Magnitude')
end

%------------------------------ b ------------------------------%
n = 0:0.1:10;
for i = 0:0.5:2
    dis = cos(i*pi*n);
    figure
    stem(n, dis)
    title('Discrete cosine signal x[n] = cos(ωn)')
    xlabel('Sample (n)')
    ylabel('Magnitude')
end