clear
import lib.*

A = 1.5;
f0 = 1;
nSamples = 201; % number of samples
tStart = -1; % first value of time axis
tEnd = 1; % last value of time axis

t = linspace(tStart, tEnd, nSamples); % time axis

f1 = A * cos(2 * pi * f0 * t);
f2 = step(f1);

plot(t, f1, '--', t, f2)
ylim([-2, 2])
grid on
title('Exercise 2.8')
xlabel('t / s')
legend('A * cos(2 * pi * f0 * t)', 'step(A * cos(2 * pi * f0 * t))')
