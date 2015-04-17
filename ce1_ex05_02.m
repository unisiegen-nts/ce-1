%% Initialize Plot
clear
addpath(['..' filesep 'lib'])

nSamples = 101;
tStart = -5;
tEnd = 5;
tolerance = 1e-12;

dt = (tEnd - tStart) / (nSamples - 1);
t = tStart : dt : tEnd;
fs = 1 / dt;
f = fftaxis(nSamples, fs);
shiftPhase = exp(-2i * pi * f * t(1));

subplot(3, 1, 1)
plot1 = plot(t, NaN(1, nSamples));
title('Exercise 5.2')
xlabel('t')
legend('u(t)')

subplot(3, 1, 2)
plot2 = plot(fftshift(f), NaN(1, nSamples));
xlabel('f')
legend('|U(f)|')

subplot(3, 1, 3)
plot3 = plot(fftshift(f), NaN(1, nSamples));
xlabel('f')
legend('arg(U(f))')

%% Update Plot
t0 = 0.01;
T = 1;

u = rect((t - t0) / T);
U = fft(u) .* shiftPhase * dt;

% discard imaginary part of U if approx. 0
if max(abs(imag(U))) <= tolerance
    U = real(U);
end

% update data of plots
set(plot1, 'YData', u)
set(plot2, 'YData', abs(fftshift(U)))
set(plot3, 'YData', angle(fftshift(U)))
