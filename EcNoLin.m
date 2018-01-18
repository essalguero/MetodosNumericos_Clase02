clc

%warning off

tol = 10^(-4);
nmax = 1000;

f = @(x) (x.^3) + (4 * x.^2) - 10;

ejex = @(x) 0 * x;

I = [0:0.01:2];

plot(I, f(I), I, ejex(I))

a = 1;
b = 2;
[zero, res, niter] = bisection(f, a, b, tol, nmax)

df = @(x) (3 * x.^2) + (8 * x);
x0 = a;

% Newtoniana
[zeroN, resN, niterN] = newton(f, df, x0, tol, nmax)

vx0 = [0.5, 0.5]';
[zNsys, rNsys, nNsys] = newtonsys(@fun, @Jac, vx0, tol, nmax)




%%% Punto fijo
phiV = @(x) 3*x ./ (1 + x);
phiP = @(x) (3 * x.^2) ./ (1 + x.^2);
diag = @(x) x;

I = [0:0.01:10];
subplot(2, 1, 1);
plot(I, phiV(I), I, diag(I))
subplot(2, 1, 2);
plot(I, phiP(I), I, diag(I))


x01 = 0.1;
[x, niter] = puntofijo2(phiV, x01, tol, nmax)

x02 = 1.9;
[x, niter] = puntofijo2(phiV, x02, tol, nmax)