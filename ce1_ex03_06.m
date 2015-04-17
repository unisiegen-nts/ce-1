clear
import lib.*

T = 1;
fs = 100; % sampling frequency
dt = 1 / fs; % sample time

t1 = -2 : dt : 4; % time axis for function 1
f1 = 1 / T * exp(-t1 / T) .* step(t1); % function 1

t2 = -8 : dt : 1; % time axis for function 2
f2 = step(-2 * t2 - T); % function 2

t3 = t1(1) + t2(1) : dt : t1(end) + t2(end); % time axis for convolution result
f3 = conv(f1, f2) * dt; % result of convolution

t = t2(1) + t1(end); % time shift

xmin = min([t1, t2, t3]); % calculate axes limits
xmax = max([t1, t2, t3]);
ymin = -0.5;
ymax = 1.5;

subplot(3, 1, 1) % plot the functions
plot(t1, f1, 'b', t2, f2, 'g')
axis([xmin, xmax, ymin, ymax])
grid on
title('Exercise 6.6')
xlabel('t')
legend('f_1(t)', 'f_2(t)')

subplot(3, 1, 2)
plot(t - t1, f1, 'b', t2, f2, 'g');
axis([xmin, xmax, ymin, ymax])
grid on
xlabel('tau')
legend(['f_1(t - tau), t = ' num2str(t)], 'f_2(tau)')

subplot(3, 1, 3)
plot(t3, f3, [t, t], [ymin, ymax], 'k--')
axis([xmin, xmax, ymin, ymax])
grid on
xlabel('t')
legend('f(t) = f_2(t) * f_1(t)')
