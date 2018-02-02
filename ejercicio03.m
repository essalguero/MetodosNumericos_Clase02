clc
clear all

format long

a1 = 10;
a2 = 13;
a3 = 8;
a4 = 10;

nmax = 100;
tolerancia = 10^8;

intervalo = [0, 2 * pi / 3];
incremento = 0.1;

x0 = -0.1;
x1 = (2 * pi) / 3;


printf("niter - zero - res - niter2 - zero2 - res2\n");

for vBeta = [intervalo(1):incremento:intervalo(2)]
  
  f = @(x) (a1 / a2) * cos(vBeta) - (a1 / a4) * cos(x) - cos(vBeta - x) + ...
  ((a1 ^ 2 + a2 ^ 2 + a3 ^ 2 + a4 ^ 2)/(2 * a2 * a4));
  
  df = @(x) 1/4 * sin(x) - sin(vBeta - x);
  
  [zero, res, niter] = newton(f, df, x0, tolerancia, nmax);
%  zero
%  res
%  niter
  [zero2, res2, niter2] = newton(f, df, x1, tolerancia, nmax);
%  zero
%  res
%  niter

  printf("%d - %f - %f - %d - %f - %f\n", niter, zero, res, niter2, zero2, res2);
  
end