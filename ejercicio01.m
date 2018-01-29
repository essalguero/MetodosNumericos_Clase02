clc
clear all

%f = @(x) (x.^4) - 1 - ((x.^2)* exp(-x))

f = @(x) (x.^4) - 1 - (exp(-x) .* x.^2)

ejex = @(x) 0 * x;

I = [1:0.01:1.2];

subplot(4, 1, 1)
plot(I, f(I), I, ejex(I))

df = @(x) 4*x.^3 - (-exp(-x) .* (x.^2) + exp(-x) * 2 .* x)

a = 1;
b = 1.5;

phiN = @(x) x - (f(x)./df(x))
phi01 = @(x) (1 + exp(-x) .* x.^2) .^ (1/4)
phi02 = @(x) x + f(x)

tolerancia = 10 ^ -6;
maxIter = 1000;

x01 = 1;
[x, niter] = puntofijo2(phiN, x01, tolerancia, maxIter)
[x, niter] = puntofijo2(phi01, x01, tolerancia, maxIter)
[x, niter] = puntofijo2(phi02, x01, tolerancia, maxIter)


subplot(4, 1, 2);
plot(I, phiN(I), I, diag(I))
axis equal

subplot(4, 1, 3);
plot(I, phi01(I), I, diag(I))
axis equal

subplot(4, 1, 4);
plot(I, phi02(I), I, diag(I))
axis equal


% El ultimo no es valido porque la pendiente de la curva es mucho mayor que 1