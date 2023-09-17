% TRAM LE
% Homework 8 :

clear all;
format long;

% 2.
% Algorithm: Inverse iteration
% ——————————————————-
% Given v(0), with ∥v(0)∥ = 1, and µ (an estimate of eigenvalue λJ )
% for k = 1, 2, 3, ...
% v = (A − µI)−1 v(k−1), (i.e., solve (A − µI)v = v(k−1) for v)
% v(k) = v/∥v∥
% λ(k) = v(k)T Av(k)
% end

%TEST
% A = [1, 3, 5; 2, 6, 8; 3, 8, 10];
% v = [1,1,1];
% v = v';
% mu = 8;
% [lam, v, error] = inverseiter(A, v, mu)

n = 3;
A = rand(n)
v = randn(n,1);
mu = eig(A);
v = v';
[lam, v, error] = inverseiter(A, v', mu)
eig(A)

function [lam, v, err] = inverseiter(A, v0, mu)
v = v0;
error = 1;
mu = 8;
n = size(A);
err = [];
    while error  > 10^-6
        v = inv(A - mu * eye(n)) * v; 
        v = v / norm(v);
        lam = v' * A * v; 
        error = norm(A*v - lam*v);
        err = [err error];
    end
end

