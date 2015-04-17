clear
import lib.*

A = 1;
fg = 1;
nSamples = 100;
tStart = -5;
dt = 0.1;

t = tStart + (0 : nSamples - 1) * dt;
fs = 1 / dt;
f = fftaxis(nSamples, fs);
shiftPhase = exp(-2i * pi * f * t(1));

H1 = 2 * A * tri(f / fg);
h1 = ifft(H1 .* conj(shiftPhase) / dt);
H2 = -A * rect(f / (2 * fg));
% H2(abs(f) == fg) = -A / 2;
h2 = ifft(H2 .* conj(shiftPhase) / dt);
H = H1 + H2;
h = h1 + h2;

subplot(2, 1, 1)
plot1 = plot(fftshift(f), fftshift(H), '-', ...
    fftshift(f), fftshift(H1), '--', ...
    fftshift(f), fftshift(H2), '--');
ylim([-2, 2]);
grid on
title('Exercise 8.3')
xlabel('f')
legend('H(f)', 'H1(f)', 'H2(f)')

subplot(2, 1, 2)
plot2 = plot(t, h, '-', ...
    t, h1, '--', ...
    t, h2, '--');
grid on
xlabel('t')
legend('h(t)', 'h1(t)', 'h2(t)')
