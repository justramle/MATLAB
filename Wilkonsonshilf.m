% TRAM LE
% Final 5 : Wilkinson shift in the QR algorithm,


%%

% The Wilkonson shilf has more converage iteration. And when it converage achieved, the matrix will be deflated  and
% remove the last entry then apply QR shilt on deflate matrix to the
% closest mu and it's faster than unshift

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
    [Anew, vec] = QShift(A, vec);
    eigens(k) = Anew(k,k);
  
    A = Anew(1:k-1,1:k-1);
end
    eigens(1) = A(1,1);
end


% QR Shift
function [Anew, vec] = QShift(A, vec)
m = length(A);
tol = 10^-12;
% vec = [];
while abs(A(m,m - 1)) > tol

    delta = (A(m-1,m-1)-A(m,m))/2;
    delta_2 = abs(delta) + sqrt((delta)^2 + A(m,m-1)^2);
    mu = A(m,m) - (sign(delta) * A(m,m-1)^2) / delta_2;
    [Q,R] = qr(A - mu*eye(m));
    A = R*Q + mu*eye(m);
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