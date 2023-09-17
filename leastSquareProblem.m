%%
% TRAM LE
% Homework 7:
clear all
close all
format long

% m = 50;
% n = 20;
% 
% 
% % 1. The x1 and x2 generate the results more close to each other.
% 
% % create x and y
% for i = 1:m
%     x(i) = -1 + 2*(i-1)/(m-1);
%     y(i) = 1/(1+25*x(i).^2);
% end
% 
% A = vander(x);
% % polynomial of n-1 degree
% % the last m column
% A = A(:,m-n+1:m);
% 
% 
% % a. Least square problems. Using Vander and "\"
% x1 = A\y'
% 
% 
% % b. The reduced QR factorization
% [Q,R]=qr(A);
% x2 = R\(Q'*y')
% %x2 = backsubs(R,Q'*y')
% 
% 
% % c. Solution of the normal equation.
% % A^T * A = L^T * L
% % (A^T * A) x = A^T * b
% 
% L = chol(A'*A);
% x3 = L\(L'\(A'*y'))
% 
% % Compare:
% ans1 = x1 - x2
% ans2 = x1 - x3
% 
% %%
% % 2. The graph are almost sit on the top of each other and matching well
% y1 = polyval(x1,x);
% y2 = polyval(x2,x);
% y3 = polyval(x3,x);
% hold on
% plot(x,y,'k')
% plot(x,y1,'r')
% plot(x,y2,'g')
% plot(x,y3,'b')
% 
% hold off



%%

% 3. It doen't match well because the matrix are too large and Chelosky
% doesn't work in this case
m = 50;
n = 50;

% create x and y
for i = 1:m
    x(i) = -1 + 2*(i-1)/(m-1);
    y(i) = 1/(1+25*x(i).^2);
end

A = vander(x);
% polynomial of n-1 degree
% the last m column
A = A(:,m-n+1:m);


% a. Least square problems. Using Vander and "\"
x1 = A\y'


% b. The reduced QR factorization
[Q,R]=qr(A);
x2 = R\(Q'*y')

% Plot
y1 = polyval(x1,x);
y2 = polyval(x2,x);

hold on
% plot(x,y,'k')
plot(x,y1,'r')
plot(x,y2,'g')
title("Fitting Polynomial")
hold off




