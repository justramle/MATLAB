

clear all;

% Given an l×l matrix A, apply QR algorithm until A(l,l) converges
% function [Anew] = qralg(A)
% l = length(A)
% while ( |A(l,l −1)|> ε )
% [Q,R] = qr(A)
% A = R ∗Q
% end
% Anew = A

%%
% 2.
A = tridiag(hilb(4));
[Anew] = qralg(A)
eig(A)
Anew(4,4)

function [Anew] = qralg(A)
m = length(A);
tol = 10^-12;

while abs(A(m,m - 1))> tol
    [Q,R] = qr(A);
    A = R*Q;
   
end
Anew = A;
end

function A = tridiag(S)
m = length(S);

for k = 1:m-2

    vk = S(k+1:m,k);
    vk(1) = vk(1) + sign(vk(1))*norm(vk); 
    vk = vk / norm(vk);
  
    S(k+1:m,k:m) = S(k+1:m,k:m) - 2 * vk * (vk' * S(k+1:m,k:m));
    S(k:m,k+1:m) = S(k:m,k+1:m) - 2 * (S(k:m,k+1:m) * vk) * vk';
end
A = S;
end
