clear
addpath(['..' filesep 'lib'])

T = 1.5;
fs = 2; % sampling frequency
tStart = -2; % first value of time axis
tEnd = 6; % last value of time axis

t = tStart : 1 / fs : tEnd; % time axis

f1 = tri(t); % function 1 (exercise 1.3.a)
f2 = T * tri(t / T); % function 2 (exercise 1.3.b)
f3 = 2 * tri((t - 2) / 3); % function 3 (exercise 1.3.c)

plot(t, f1)
hold on
plot(t, f2, 'rx--')
plot(t, f3, 'ko:')
ylim([-0.5, 2.5])
grid on
title('Exercise 1.3')
xlabel('t / s')
legend('tri(t)', 'T * tri(t / T)', '2 * tri((t - 2) / 3)')
