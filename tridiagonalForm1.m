
clear all;
format short;

% Algorithm: Reduction to tridiagonal form
% ||||||||||||||||||-
% for k = 1 to m 2
% x = Ak+1:m,k
% 9
% vk = x + sign(x1)∥x∥2e1
% vk = vk/∥vk∥2
% Ak+1:m,k:m = Ak+1:m,k:m 2vk(vTk Ak+1:m,k:m)
% Ak:m,k+1:m = Ak:m,k+1:m 2(Ak:m,k+1:mvk)vTk
% end
% % 1.
%%

S = hilb(4)
A = tridiag(S)
eig(A)
function A = tridiag(S)
m = length(S);

for k = 1:m-2

    % x = S(k+1:m,k);
    % vk = [x(1) + sign(x(1))*norm(x); x(2:end)];
 %   e = zeros(m,m-k+1)
  %  e(1) = 1

    vk = S(k+1:m,k);
    vk(1) = vk(1) + sign(vk(1))*norm(vk); 
    vk = vk / norm(vk);
  
 
    S(k+1:m,k:m) = S(k+1:m,k:m) - 2 * vk * (vk' * S(k+1:m,k:m));
    S(k:m,k+1:m) = S(k:m,k+1:m) - 2 * (S(k:m,k+1:m) * vk) * vk';
end
A = S;
end
