%%
% TRAM LE
% 
% MIDTERM: MATLAB GUASS
clear all
close all


% 2.
% Algorithm: LU factorization
% for k = 1, . . . , n − 1 % loop over the first n − 1 columns
%     if akk = 0 then stop
%     for i = k + 1, . . . , n % loop over Row k + 1 through Row n
%     aik ← aik/akk % store the multiplier, which gives L
%         for j = k + 1, . . . , n % update other entries of that row
%             aij ← aij − aikakj
%         end
%     end
% end

%%
%square matrix
A = [4 5 3; -2 10 -1; 3 2 4]
[L,U] = computeLU(A)
zeroMatrix = L*U - A

function [L,U]=computeLU(A)
    n=length(A);    
    L=eye(n)
    U=A
%    L = eye(n,n) + tril(A,-1);
%   U = tril(A);
    for i=1:n-1
        for j=i+1:n
            L(j,i)=U(j,i)/U(i,i);
            U(j,i:n)=U(j,i:n)-L(j,i)*U(i,i:n);
        end
    end    
end

