% TRAM LE
% Homework 8 :

clear all;
format long;

% a.
m = 500;
[Q,R] = qr(rand(m));
Lambda = diag(m:-1:1);
A = Q * Lambda * Q';

%Power Iteration  
v0 = ones(m,1);
v0 = v0';
[lam1, v1, error1] = poweriter(A, v0');

%the Inverse Iteration
mu = -0.2;
[lam2, v2, error2] = inverseiter(A, v0', mu);

%Rayleigh Quotient 
[lam3, v3, error3] = Rayleigh(A, v0');

% CHECK
%eig(A);

% b.
%PLOT: the size of error expand to errow
hold on
loglog([1:length(error1)],error1,'k', 'LineWidth',2)
loglog([1:length(error2)],error2,'r', 'LineWidth',2)
loglog([1:length(error3)],error3,'g', 'LineWidth',2)
legend('Power Iteration','Inverse Iteration','Rayleigh Quotient')
title("Error In Iteration")
hold off

% Rayleigh is the fasttest. Power Iteration should converge the largest eigenvalue so it should be
% the slowest and should fail to converge the other eigenvalues. Inverse
% iteration that pick the closest mu of eigenvalues
% and Rayleigh has more converge to pair eigenvalues and eigenvector
%%
function [lam, v, err] = poweriter(A, v0)
v = v0;
error = 1; 
err =[];
tol = 10^-6;

    while error > tol
          v = A * v; 
          v = v / norm(v); 
          lam = v' * A * v; 
          error = norm(A*v - lam*v);
          err = [err error];
    end
end

function [lam, v, err] = inverseiter(A, v0, mu)
v = v0;
error = 1;
mu = -0.2;
n = size(A);
err = [];
    while error  > 10^-6
        v = inv(A - mu * eye(n)) * v; 
        v = v / norm(v);
        lam = v' * A * v; 
        error = norm(A*v - lam*v);
        err = [err error];
    end
end


function [lam, v, err] = Rayleigh(A, v0)
v = v0;
error = 1;
lam = v' * A * v;
n = size(A);
err = [];
    while error > 10^-6
        v = inv(A - lam * eye(n)) * v;
        v = v/ norm(v);
        lam = v' * A * v; 
        error = norm(A*v - lam*v);
        err = [err error];
    end
end
