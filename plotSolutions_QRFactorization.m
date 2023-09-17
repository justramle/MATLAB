%%
% TRAM LE
% Homework 6:
clear all
close all
%%
% The most accurate is Householder Triangularization algorithm, 
% then the buildIn algorithm.
% The classical and modified Gram-Schmid is the least accurate 
%%

%%





%%
% 5.

n = 60;
%Matrix A nxn with -1
A = -ones(n,n);
%lower triangular matrix
A = tril(A,-1);
%othoganal matrix 1
A = A + eye(n,n);
% Identity
A(:,n) = ones(n,1);
b = A*ones(n,1);


% true solution
x_true = ones(n,1);

% solution of QR factorization by Householder
[W, R] = house(A);
Q = formQ(W);
x1 = R\(Q'*b);

% solution of QR factorization by classical Gram-Schmid
[Q, R] = clgs(A);
x2 = R\(Q'*b);

% solution of QR factorization by modified Gram-Schmid
[Q, R] = mgs(A);
x3 = R\(Q'*b);

% buildIn solution
x4 = A\b;

hold on 
figure(1)
plot(x_true)
plot(x1)
plot(x2)
plot(x3)
plot(x4)
title('Solutions')
legend('x_true','x1','x2','x3','x4')
hold off

figure(2)
hold on
plot(x_true)
plot(x1)
plot(x2)
plot(x3)
title('Solutions')
legend('x_true','x1','x2','x3')
hold off
function [Q,R] = mgs(A)
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

function [Q, R] = clgs(A)
[m,n] = size(A);
Q = zeros(m,n);
R= triu(A);

    for j=1:n
    v=A(:,j);
        for i=1:j-1
            R(i,j)=Q(:,i)'*A(:,j);
            v=v-R(i,j)*Q(:,i);
        end
    
        R(j,j)=norm(v);
        Q(:,j)=v/R(j,j);
    
    end
end


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

function [Q] = formQ(W)
[m,n] = size(W);
Q = eye(m);

for k = n:-1:1
    vk = W(k:m,k);
    Q(k:m,k:m) = Q(k:m,k:m) - 2*vk*(vk'*Q(k:m,k:m));
end

end