%%
% TRAM LE
% 
% HOMEWORK 3: MATLAB functions
%%
clear all
format long

f = @(x) exp(x);
derivativeF = @(x,h) ((f(x+h) - f(x)) / h);
x = 1;
% power
n = 1:16;
% crate h
h = 10.^(-n);

%initilize vector and store error
E = zeros(size(n));


for i = 1:length(n)
    % cal df for h 10^-n
    y = derivativeF(x, h(i));
    % cal Error and store at index
    E(i) = abs(f(x) - y);
    
end

figure(1)
plot(h,E,'LineWidth',2)
grid
title('The Error of Approximation 1')


figure(2)
loglog(h,E,'LineWidth',2)
title('The Error of Approximation 2')
grid

%%