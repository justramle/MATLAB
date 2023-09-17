%%
% TRAM LE
% Homework 6:
clear all
close all

% 2.
% Algorithm: Given b, compute Qb, return the result to x
% x = b
% for k = n : −1 : 1
% xk:m = xk:m − 2vk(vTk xk:m)
% end

A=[1 2 3;4 5 6;7 8 7;4 2 3;4 2 2]
[W,R] = house(A)
Q = formQ(W)

function[W,R] = house(A)
[m,n] = size(A);
W = zeros(m,n);
for k = 1:n
    vk = A(k:m,k);
    vk(1) = vk(1) + sign(vk(1))*norm(vk);
    vk = vk/norm(vk);
    A(k:m,k:n) = A(k:m,k:n) - 2*vk*(vk'*A(k:m,k:n));
    W(k:m,k) = vk;
end

R = triu(A);

end

function [Q] = formQ(W)
[m,n] = size(W);
Q = eye(m);

for k = n:-1:1
    vk = W(k:m,k);
    Q(k:m,k:m) = Q(k:m,k:m) - 2*vk*(vk'*Q(k:m,k:m));
end

end