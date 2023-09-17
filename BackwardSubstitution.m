%%
% TRAM LE
% 
% MIDTERM: MATLAB GUASS
clear all
close all

% 1.
% Algorithm: Backward substitution
% for j = n to 1
%     if ujj = 0, then display(‘Error: Singular Matrix’);
%     xj = bj/ujj ;
%     for i = 1 to j − 1
%         bi = bi − uijxj;
%     end
% end

%%
A = rand(3,3)
b = [-2; 5; 13]

% Lower triangular
L = tril(A,0)
x_sol = forwardSub(L,b)

% Upper triangular
U = triu(A,0)
x_sol = backwardSub(U,b)

function x=forwardSub(L,b)
    n=length(b);
    x = zeros(n,1); 
    x(1) = b(1)/L(1,1);
    for i = 2:n
        x(i) = b(i);
            for j = 1:(i-1)
                x(i) = x(i)-L(i,j)*x(j);
            end
            x(i) = x(i)/L(i,i);
    end
end

function x=backwardSub(U,b)
    n=length(b);
    x = zeros(n,1); 
    x(n) = b(n)/U(n,n);
    for i = (n-1):-1:1
        x(i) = b(i);
           for j = (i+1):n
                x(i) = x(i)-U(i,j)*x(j);
            end
            x(i) = x(i)/U(i,i);
    end
end

