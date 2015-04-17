%% Initialize Plot
clear
addpath(['..' filesep 'lib'])

nSamples = 1001;
tStart = -5;
tEnd = 5;

dt = (tEnd - tStart) / (nSamples - 1);
t = tStart : dt : tEnd;

subplot(2, 1, 1)
plot1 = plot(t, NaN(1, nSamples), 'b-', ...
    t, NaN(1, nSamples), 'g-', ...
    t, NaN(1, nSamples), 'r-', ...
    t, NaN(1, nSamples), 'k--');
title('Exercise 4.4')
xlabel('t')
legend('f1(t)', 'f2(t)', 'f3(t)', 'f4(t)')

subplot(2, 1, 2)
plot2 = plot(t, NaN(1, nSamples), 'b-', ...
    t, NaN(1, nSamples), 'g-', ...
    t, NaN(1, nSamples), 'r--', ...
    t, NaN(1, nSamples), 'r:', ...
    t, NaN(1, nSamples), 'k--', ...
    t, NaN(1, nSamples), 'k:', ...
    [NaN, NaN], [0, 0], 'ok');
xlabel('t')
legend('-arg1(t)', 'arg2(t)', '-arg3a(t)', 'arg3b(t)', 'arg4a(t)', 'arg4b(t)')

%% Update Plot
t1 = -2.5;
t2 = 2.5;
a = 1;

% define anonymous functions
gauss = @(x) a * exp(-pi * (a * x).^2); % max = a, area = 1

arg1 = @(x) x - t1;
f1 = @(x) gauss(arg1(x));

arg2 = @(x) (x - t1) .* (x - t2);
f2 = @(x) gauss(arg2(x));

arg3a = @(x) (x - t1);
arg3b = @(x) (x - t2);
f3 = @(x) 1 / abs(t1 - t2) * (gauss(arg3a(x)) + gauss(arg3b(x)));

arg4a = @(x) (t1 - t2) * (x - t1);
arg4b = @(x) (t2 - t1) * (x - t2);
f4 = @(x) gauss(arg4a(x)) + gauss(arg4b(x));

% evaluate functions
y1 = f1(t);
y2 = f2(t);
y3 = f3(t);
y4 = f4(t);

% update data of plots
set(plot1(1), 'YData', y1)
set(plot1(2), 'YData', y2)
set(plot1(3), 'YData', y3)
set(plot1(4), 'YData', y4)
set(plot2(1), 'YData', -arg1(t))
set(plot2(2), 'YData', arg2(t))
set(plot2(3), 'YData', -arg3a(t))
set(plot2(4), 'YData', arg3b(t))
set(plot2(5), 'YData', arg4a(t))
set(plot2(6), 'YData', arg4b(t))
set(plot2(7), 'XData', [t1, t2])

% calculate integrals (adaptive Gauss-Kronrod quadrature)
i1 = quadgk(f1, tStart, tEnd);
i2 = quadgk(f2, tStart, tEnd);
i3 = quadgk(f3, tStart, tEnd);
i4 = quadgk(f4, tStart, tEnd);

% print integrals
disp(['i1 = ', num2str(i1, '%5.3f'), ...
    '      sum(y1) * dt = ', num2str(sum(y1) * dt, '%5.3f')])
fprintf('i2 = %5.3f\tsum(y2) * dt = %5.3f\n', i2, sum(y2) * dt)
fprintf('i3 = %5.3f\tsum(y3) * dt = %5.3f\n', i3, sum(y3) * dt)
fprintf('i4 = %5.3f\tsum(y4) * dt = %5.3f\n\n', i4, sum(y4) * dt)
