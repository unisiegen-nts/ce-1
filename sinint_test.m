clear

t = linspace(0, 25, 251);

si = @(x) sinc(x / pi);
s1 = arrayfun(@(x) quadgk(si, 0, x), t);
s1_lim = pi / 2; % Dirichlet integral
s2 = sinint(t);

figure
plot(t, s1, 'b-', ...
    [t(1), t(end)], [s1_lim, s1_lim], 'b--', ...
    t, s2, 'r--')
grid on

%%
t = linspace(0, 4.7, 471);

% \int_{-\infty}^t \frac{\sin(\pi x)}{\pi x} \, dx
% = 0.5 + \int_0^t \frac{\sin(\pi x)}{\pi x} \, dx
s3 = 0.5 + arrayfun(@(x) quadgk(@sinc, 0, x), t);
s4 = 0.5 + 1/pi * sinint(pi * t);

figure
plot(t, s3, 'b-', t, s4, 'r--')
axis([0, max(t), -0.25, 1.1])
grid on
