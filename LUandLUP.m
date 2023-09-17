%%
% TRAM LE
% 
% MIDTERM: MATLAB GUASS
clear all
close all

%%
%4.
A = [2 -2 -3; 8 5 -7; 1 -3 4] 
b = [-12; -20; 13] 

% The solution using LU 
[L,U]=computeLU(A)
y = forwardSub(L,b);
x_sol = backwardSub(U,y)

% The solution using LUP 
[L,U,P]=computeLUpivot(A)
Pb = P*b;
y = forwardSub(L,Pb);
x_sol = backwardSub(U,y)

function [L,U]=computeLU(A)
    n=length(A);    
    L=eye(n);
    U=A;
    for i=1:n-1
        for j=i+1:n
            L(j,i)=U(j,i)/U(i,i);
            U(j,i:n)=U(j,i:n)-L(j,i)*U(i,i:n);
        end
    end    
end

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

U(:,n) = A(:,n);
end

function y=forwardSub(L,b)
    n=length(b);
    y = zeros(n,1); 
    y(1) = b(1)/L(1,1);
    for i = 2:n
        y(i) = b(i);
            for j = 1:(i-1)
                y(i) = y(i)-L(i,j)*y(j);
            end
            y(i) = y(i)/L(i,i);
    end
end

function x=backwardSub(U,y)
    n=length(y);
    x = zeros(n,1); 
    x(n) = y(n)/U(n,n);
    for i = (n-1):-1:1
        x(i) = y(i);
           for j = (i+1):n
                x(i) = x(i)-U(i,j)*x(j);
            end
            x(i) = x(i)/U(i,i);
    end
end

