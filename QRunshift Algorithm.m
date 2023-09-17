
clear all;

% function [eigens] = qreigens(A)
% for k = m to 2
% Anew = qralg(A)
% eigens(k) = Anew(k,k)
% A = Anew(1 : k −1,1 : k −1)
% end
% eigens(1) = A(1,1)


%%
 
% After I obtained the function, the eigenvalues has the same with built in
% eig(A).
% After I plot the vector that hold all QR unshift algorithm, I see the zigzag shape that is
% deflation converage corresponding to each iteration of eigenvalue, and
% deflate to the last entry and keep resucing the process untill all eigen
% obtained and it obtained to the matrix less demesion each iteration

 S = hilb(4);
 A = tridiag(S);

 % the rest of eigenvalue
 [eigens, vec] = qreigens(S)
 eig(A)
 % plot
 semilogy(vec);


 function [eigens, vec] = qreigens(A)
m = length(A);
vec = [];
for k = m:-1:2
    [Anew, vec] = qralg(A, vec);
    eigens(k) = Anew(k,k);
    A = Anew(1:k-1,1:k-1);
end
    eigens(1) = A(1,1);

 end

 % QR unshift
function [Anew, vec] = qralg(A, vec)
m = length(A);
tol = 10^-12;

while abs(A(m,m - 1)) > tol
    [Q,R] = qr(A);
    A = R*Q;
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
