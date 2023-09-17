%%
% TRAM LE
% 
% MIDTERM: MATLAB GUASS
clear all
close all
format long
%%
% 5.

count = 0; % counter for no. of iterations performed

n_range =10:10:200;

for n = n_range
    
    count = count + 1;

    for i=1:5
    
        A = rand(n);
        b = A*ones(n,1);
    
        % solution with LU factorization without pivoting   
        [L,U]=computeLU(A);   
        y = forwardSub(L,b); 
        x_computed_wpivot = backwardSub(U,y);
        
           
        % solution with LU factorization with pivoting   
        [L,U,P]=computeLUpivot(A);    
        Pb = P*b;    
        y = forwardSub(L,Pb);    
        x_computed_pivot = backwardSub(U,y);
        
         
        % solution with build in function  
        x_buildIn = A\b;

        % true solution  
        x_true = ones(n,1);
          
        % relative error in solution  
        rel_error_wpivot(i) = norm(x_computed_wpivot-x_true)/norm(x_true);
        rel_error_pivot(i) = norm(x_computed_pivot-x_true)/norm(x_true);
        rel_error_builIn(i) = norm(x_buildIn-x_true)/norm(x_true);

    end

    mean_rel_error_wpivot(count) = mean(rel_error_wpivot);
    mean_rel_error_pivot(count) = mean(rel_error_pivot);
    mean_rel_error_buildIn(count) = mean(rel_error_builIn);
 
end


% Plot the results on same figure
semilogy(n_range,mean_rel_error_wpivot)
hold on 
semilogy(n_range,mean_rel_error_pivot)
semilogy(n_range,mean_rel_error_buildIn)
hold off
title('Error in solution')
legend('Without Pivoting','With pivoting','Build In')


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