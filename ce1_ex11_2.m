%% a1
clear

A0 = 1;
fg = 1;
filename = 'ce1_ex11_2a.dat';

t = linspace(-4, 4, 161);
a1 = A0 * (0.5 + 1 / pi * sinint(2 * pi * fg * t));

figure
plot(t, a1)
grid on
title('Exercise 11.2')
xlabel('t')
legend('a1(t)')

%%
fid = fopen(filename, 'w');
fprintf(fid, '%13s %13s\n', ...
    't', 'a1');
fprintf(fid, '%13.6e %13.6e\n', ...
    [t; a1]);
fclose(fid);

%% a2
clear

A0 = 1;
t0 = 1;
f_max = 1 / (4 * t0);
filename = 'ce1_ex11_2b.dat';

t = linspace(-8, 8, 161);
i1 = t0 * (2 / pi * sinint(pi * (t - 2 * t0) / (2 * t0)) + 1);
i2 = 2 * t0 * (2 / pi * sinint(pi * t / (2 * t0)) + 1);
i3 = t0 * (2 / pi * sinint(pi * (t + 2 * t0) / (2 * t0)) + 1);
a2 = A0 * f_max / 2 * (i1 + i2 + i3);

figure
plot(t, i1, t, i2, t, i3, t, a2);
grid on
title('Exercise 11.2')
xlabel('t')
legend('i1(t)', 'i2(t)', 'i3(t)', 'a2(t)')

%%
fid = fopen(filename, 'w');
fprintf(fid, '%13s %13s %13s %13s %13s\n', ...
    't', 'i1', 'i2', 'i3', 'a2');
fprintf(fid, '%13.6e %13.6e %13.6e %13.6e %13.6e\n', ...
    [t; i1; i2; i3; a2]);
fclose(fid);

%% a3
clear

A0 = 1;
tb = 1;
filename = 'ce1_ex11_2c.dat';

t = linspace(-3, 3, 161);
a3 = A0 / 2 * (1 + erf(t / tb * sqrt(log(2))));

figure
plot(t, a3)
grid on
title('Exercise 11.2')
xlabel('t')
legend('a3(t)')

%%
fid = fopen(filename, 'w');
fprintf(fid, '%13s %13s\n', ...
    't', 'a3');
fprintf(fid, '%13.6e %13.6e\n', ...
    [t; a3]);
fclose(fid);
