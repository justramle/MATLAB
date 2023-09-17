%%
% TRAM LE
% Homework 6:
clear all
close all

% 4.
% Algorithm: QR factorization by modified Gram-Schmidt
% for j = 1 to n
% v = aj
% for i = 1 to j − 1
% rij = qTi v
% v = v − rijqi
% end
% rjj = ∥v∥2
% qj = v/rjj
% end

A=[1 2 3;4 5 6;7 8 7;4 2 3;4 2 2]
[Q,R] = mgs(A)

function [Q,R] = mgs(A);
[m,n] = size(A);
Q = zeros(m,n);
R= zeros(m,n);

    for j=1:n
    v=A(:,j);
        for i=1:j-1
            R(i,j)=Q(:,i)'*v;
            v=v-R(i,j)*Q(:,i);
        end
    
        R(j,j)=norm(v);
        Q(:,j)=v/R(j,j);
    
    end
end
