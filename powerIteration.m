
% TRAM LE
% Homework 8 :


clear all;
format long;

%1.

% Algorithm: Power iteration
% ——————————————————-
% Given initial v(0), with ∥v(0)∥ = 1
% for k = 1, 2, 3, ...
% v = Av(k−1)
% v(k) = v/∥v∥
% λ(k) = v(k)T Av(k)
% end

%Test
A = [1, 3, 5; 2, 6, 8; 3, 8, 10];
v = [1,1,1];
v = v';
[lam, v, error] = poweriter(A, v)

% n = 3;
% A = rand(n);
% v = randn(n,1);
% v = v';
% [lam, v, error] = poweriter(A, v')
eig(A)

function [lam, v, err] = poweriter(A, v0)
v = v0;
error = 1; 
tol = 10^-6;
err = [];
    while error > tol
          v = A * v; 
          v = v / norm(v); 
          lam = v' * A * v; 
          error = norm(A*v - lam*v);
          err = [err error];
    end
end

