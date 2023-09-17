% TRAM LE
% Final 5 : Without Wilkinson shift in the QR algorithm,

clear all;

m = 15;
S = diag(m:-1:1) + ones(m,m);
A = tridiag(S);
[eigens, vec] = qreigens(A);
semilogy(vec)

function [eigens, vec] = qreigens(A)
m = length(A);
vec = [];
for k = m:-1:2
    [Anew, vec] = QRWithoutShift(A, vec);
    eigens(k) = Anew(k,k);
    A = Anew(1:k-1,1:k-1);
end
    eigens(1) = A(1,1);
end


 % QR unshift
function [Anew, vec] = QRWithoutShift(A, vec)
m = length(A);
tol = 10^-12;

while abs(A(m,m - 1)) > tol
    [Q,R] = qr(A);
    A = R*Q;
    vec = [vec abs(A(m-1,m))];

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
