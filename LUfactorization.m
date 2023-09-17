%%
% TRAM LE
% 
% MIDTERM: MATLAB GUASS
clear all
close all



%%
% 3.
% Algorithm: LU factorization using pivoting
% p = [1 : n];
% for k = 1, . . . , n − 1
%     find the row number i∗, where |ai∗k| = maxk≤i≤n |aik|
%     exchange the two rows A(k, :) ↔ A(i∗, :)
%     exchange the two rows p(k) ↔ p(i∗)
%     for i = k + 1, . . . , n
%         aik ← aik/akk
%         for j = k + 1, . . . , n
%             aij ← aij − aikakj
%         end
%     end
% end


A = randi(4,4)
[L,U,P]=computeLUpivot(A)
[L, U, P] = lu(A)

function [L,U,P]=computeLUpivot(A)
n = length(A); 
L = eye(n); 
P = eye(n); 
    for i=1:n
        % largest abs value [maxval, colind] = max(A(k : n, k)); colind = colind + k −1; ”
        [~,u] = max(abs(A(i:n,i)));
        u = u + i -1;

        temp = A(i,:);
        A(i,:) =A(u,:);
        A(u,:) = temp;

        temp = P(i,:);
        P(i,:) =P(u,:);
        P(u,:) = temp;

        temp = L(i,:);
        L(i,:) =L(u,:);
        L(u,:) = temp;

        % L
        L(i:n,i) = A(i:n,i) / A(i,i);
        % U
        U(i,1:n) = A(i,1:n);
        A(i+1:n,1:n) = A(i+1:n,1:n)-L(i+1:n,i)*A(i,1:n);
    end
%     for j=i+1:n 
%         L(j,i)=A(j,i)/A(i,i);
%         A(j,:)=A(j,:)-L(j,i)*A(k,:);
%     end
U(:,n) = A(:,n);
end