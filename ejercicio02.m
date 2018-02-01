clear all

clf

clc

f = @(x) x.^7 - x - cos(x) + 1

df = @(x) 7 * x.^6 -1 + sin(x)

d2f = @(x) 42 * x.^5 + cos(x)

ejex = @(x) 0 * x;

tolerancia = 10 ^ -5

nmax = 2000

I = [-1.5:0.01:1.5];

%subplot(3, 1, 1)
%figure
plot(I, f(I), I, ejex(I))

%subplot(3, 1, 2)
figure
plot(I, df(I), I, ejex(I))

%subplot(3, 1, 3)
figure
plot(I, d2f(I), I, ejex(I))


%x01 = 1;
%[x, niter] = puntofijo2(df, x01, tolerancia, maxIter)

x0_1 = -0.5;

x0_2 = 0.5

[x, niter] = puntofijo2(df, x0_1, tolerancia, nmax)

[x, niter] = puntofijo2(df, x0_2, tolerancia, nmax)