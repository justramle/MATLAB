% TRAM LE
% Homework 8 :

clear all;
format long;

% Algorithm: Rayleigh quotient iteration
% ——————————————————-
% Given v(0), with ∥v(0)∥ = 1
% λ(0) = (v(0))TAv(0)
% for k = 1, 2, 3, ...
% v = (A − λ(k−1)I)−1v(k−1), (i.e., solve (A − λ(k−1)I)v = v(k−1) for v)
% v(k) = v/∥v∥
% λ(k) = v(k)TAv(k)
% end


%TEST
% A = [1, 3, 5; 2, 6, 8; 3, 8, 10];
% v = [1,1,1];
% v = v';
% [lam, v, error] = Rayleigh(A, v)


n = 3;
A = rand(n);
v = randn(n,1);
v = v';
[lam, v, error] = Rayleigh(A, v')
eig(A)

function [lam, v, err] = Rayleigh(A, v0)
v = v0;
error = 1;
lam = v' * A * v;
n = size(A);
err = [];
    while error > 10^-6
        v = inv(A - lam * eye(n)) * v;
        v = v/ norm(v);
        lam = v' * A * v; 
        error = norm(A*v - lam*v);
        err = [err error];
    end
end

