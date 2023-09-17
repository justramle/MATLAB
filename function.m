%%
% TRAM LE
% 
%  functions
%%

%%
% 2. Plot function y = sinx on interval x[-2pi,2pi] . Plot 1st term, first 3 terms, first 5 terms and first 7 terms
%%
clear all
format long
x= linspace(-2*pi,2*pi);
y= sin(x);
plot(x,y,'--r','lineWidth',2)
title('Combine Plots')

hold on
% only first term
f1= x; 
% First three terms
f3= f1-x.^3/factorial(3)+x.^5/factorial(5); 
% First five terms
f5= f3-x.^7/factorial(7)+x.^9/factorial(9); 
% First seven terms
f7= f5-x.^11/factorial(11)+x.^13/factorial(13); 

plot(x,f1,'--','linewidth',2)
plot(x,f3,':','linewidth',2)
plot(x,f5,'-b','linewidth',2)
plot(x,f7,'-g','linewidth',2)
axis tight;
hold off


%%
% 3. Estimate the derivative of f(x) = e^x at x = 1 and plot error
%%


% f'(x) = [f(x+h) - f(x)]/ h 
%       = [e^(x+h) - e^x]/ h

% f(x) = e^x when x = 1
f = @(x) exp(x);
f(1)

% h = 10^-1, x = 1, f'(1)
derivativeF1 = @(x) (exp(x + .1) - exp(x))/ .1;
derivativeF1(1)

% h = 10^-2, x = 1, f'(1)
derivativeF2 = @(x) (exp(x + .01) - exp(x))/ .01;
derivativeF2(1)

% h = 10^-3, x = 1, f'(1)
derivativeF3 = @(x) (exp(x + .001) - exp(x))/ .001;
derivativeF3(1)

% h = 10^-4, x = 1, f'(1)
derivativeF4 = @(x) (exp(x + .0001) - exp(x))/ .0001;
derivativeF4(1)

% h = 10^-5, x = 1, f'(1)
derivativeF5 = @(x) (exp(x + .00001) - exp(x))/ .00001;
derivativeF5(1)

% h = 10^-6, x = 1, f'(1)
derivativeF6 = @(x) (exp(x + .000001) - exp(x))/ .000001;
derivativeF6(1)

% h = 10^-7, x = 1, f'(1)
derivativeF7 = @(x) (exp(x + .0000001) - exp(x))/ .0000001;
derivativeF7(1)

% h = 10^-8, x = 1, f'(1)
derivativeF8 = @(x) (exp(x + .00000001) - exp(x))/ .00000001;
derivativeF8(1)

%--------------------------------------------------------------------------
% Calculate error when x = 1
% E(h) = | f'(x) - [(f(x+h) - f(x))/h] |
%  *    = | e^x - [(e^(x+h) - e^x) / h] |
%      = | e^x - [e^x(e^h - 1) / h] |
%      = | e^x (1 - (e^h - 1)h^-1) |

% h = 10^-1, x = 1, E(10^-1)
E1 = @(x) abs(f(x) - derivativeF1(x));
E1(1)

% h = 10^-2, x = 1, E(10^-2)
E2 = @(x) abs(f(x) - derivativeF2(x));
E2(1)

% h = 10^-3, x = 1, E(10^-3)
E3 = @(x) abs(f(x) - derivativeF3(x));
E3(1)

% h = 10^-4, x = 1, E(10^-4)
E4 = @(x) abs(f(x) - derivativeF4(x));
E4(1)  % 1.35..*e^-04 = 0.000135..

% h = 10^-5, x = 1, E(10^-5)
E5 = @(x) abs(f(x) - derivativeF5(x));
E5(1) % 1.35..*e^-05 = 0.0000135..

% h = 10^-6, x = 1, E(10^-6)
E6 = @(x) abs(f(x) - derivativeF6(x));
E6(1) % 1.35..*e^-06 = 0.00000135..

% h = 10^-7, x = 1, E(10^-7)
E7 = @(x) abs(f(x) - derivativeF7(x));
E7(1) 

% h = 10^-8, x = 1, E(10^-8)
E8 = @(x) abs(f(x) - derivativeF8(x));
E8(1) 

%--------------------------------------------------------------------------
% Plot the error
% x-axis is h and y-axis is error
x = [derivativeF1(1) derivativeF2(1) derivativeF3(1) derivativeF4(1)... 
    derivativeF5(1) derivativeF6(1) derivativeF7(1) derivativeF8(1)];
y = [E1(1) E2(1) E3(1) E4(1) E5(1) E6(1) E7(1) E8(1)];

plot(x,y,'LineWidth',2)
title('The Error of Approximation')
%%

%%
% 1. Write a function z take x,y as real number where z = 1 when |x-y| <= 2 and z = 0 when |x-y| > 2. Write a function A take n where n is positive integer, A is nxn matrix, A(i,j) = z(i,j). Print out 10 by 10 matrix


%%


% a.
% test when z = 0
myabs(3,6)
% test when z = 1
myabs(1,3)
% b. test matrix 4x4
mymatrix(4)
% c. test matrix 10x10
mymatrix(10)

function z = myabs(x,y)
if (abs(x-y) <= 2)
    z = 1;
else
    z = 0;
end % end if
end % end function


% b. c. 

function A = mymatrix(n)
A = zeros(n,n);
for i = 1:n
    for j = 1:n
        A(i,j) = myabs(i,j);
    end
end
end


