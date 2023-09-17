
clear all;

% Algorithm: QR algorithm with shift
% ——————————————————-
% A(0) = A
% for k = 1,2,... until convergence
% pick a μ(k) (for example, the Wilkinson shift below)
% Q(k)R(k) = A(k−1) −μ(k)I (Compute QR factorization)
% A(k) = R(k)Q(k) + μ(k)I
% end


%% 

% This plot has less deflation and it improve the coverage that
% corresponding to eigen value which is closet to mu in each iteration

S = hilb(4);
A = tridiag(S);
%[Anew] = qralg(A);
[eigens, vec] = qreigens(A)
semilogy(vec)

function [eigens, vec] = qreigens(A)
m = length(A);
vec = [];
for k = m:-1:2
    [Anew, vec] = QRWilkison(A, vec);
    eigens(k) = Anew(k,k);
  %  entry(k-1) = abs(Anew(k,k - 1));
    A = Anew(1:k-1,1:k-1);
end
    eigens(1) = A(1,1);
end


% QR Wilkison Shift
function [Anew, vec] = QRWilkison(A, vec)
m = length(A);
tol = 10^-12;

while abs(A(m,m - 1)) > tol

    delta = (A(m-1,m-1)-A(m,m))/2;
    delta_2 = abs(delta) + sqrt((delta)^2 + A(m,m-1)^2);
    mu = A(m,m) - (sign(delta) * A(m,m-1)^2) / delta_2;
    [Q,R] = qr(A - mu*eye(m));
    A = R*Q + mu*eye(m);
    vec = [vec abs(A(m,m-1))];
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