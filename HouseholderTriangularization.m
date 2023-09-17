%%
% TRAM LE
% Homework 6:

clear all
close all
% 1.
% Algorithm: Householder Triangularization
% for k = 1 to n
% x = Ak:m,k
% vk = x + sign(x1)∥x∥2e1
% vk = vk/∥vk∥2
% Ak:m,k:n = Ak:m,k:n − 2vk(vTk Ak:m,k:n)
% end

A=[3 5 7;2 4 6;1 0 8;9 1 9]
[W,R] = house(A)

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