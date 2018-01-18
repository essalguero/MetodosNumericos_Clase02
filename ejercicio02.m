f = @(x) x.^7 - x - cos(x) - 1

df = @(x) 7 * x.^6 -1 + sen(x)

ejex = @(x) 0 * x;

tolerancia = 10 ^ -5

I = [0:0.05:1];

plot(I, f(I), I, ejex(I))
axis equal