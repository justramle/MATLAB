%%
% TRAM LE
% 
% HOMEWORK 5: MATLAB Conditions
%%

% a.
clc
clear all
close all
format short e

% Example:
% M = 2 * rand(n) -1;
% for i = 1:n
%     M(i,i) = n;
% end
% b = A * xtrue;
% x = A \ b;
% norm(x-xtrue, inf) / norm(xtrue, inf);
% max(abs((x-xtrue) ./xtrue));
% cond(A, inf)*n*eps
% accuracy: relativeErrorNorm =< cond(A)*n*eps

fprintf('%20s\n', 'PART 1');
fprintf('%-5s %-30s %-40s %-30s\n', 'n', 'Relative Error Norm', 'Relative Componentwise Error', 'Condition Number')
for n=[10,100,1000]

    xtrue=(1:n)';
    A=2*rand(n)-1;
    
       for i=1:n
        A(i,i)= n;
       end

    b=A*xtrue;
    x=A\b;
    relativeErrorNorm = norm(x-xtrue,inf)/norm(xtrue,inf);
    relativeComponentwiseError = max(abs((x-xtrue)./xtrue));
    conditionNumber = cond(A,inf)*n*eps;
  
    fprintf('%-5d %-30.16f %-40.16f %-30.16f\n', n, relativeErrorNorm, relativeComponentwiseError, conditionNumber)

end

%%
% b.

fprintf('\n%20s\n', 'PART 2');
fprintf('%-5s %-30s %-40s %-30s\n', 'n', 'Relative Error Norm', 'Relative Componentwise Error', 'Condition Number')

for n = [10,100,100]

    xtrue=(1:n)';
    A=rand(n);
    b=A*xtrue;
    x=A\b;
    relativeErrorNorm = norm(x-xtrue,inf)/norm(xtrue,inf);
    relativeComponentwiseError = max(abs((x-xtrue)./xtrue));
    conditionNumber = cond(A,inf)*n*eps;

    fprintf('%-5d %-30.16f %-40.16f %-30.16f\n', n, relativeErrorNorm, relativeComponentwiseError, conditionNumber)

end

%%
% c.

fprintf('\n%20s\n', 'PART 3');
fprintf('%-5s %-30s %-40s %-30s\n', 'n', 'Relative Error Norm', 'Relative Componentwise Error', 'Condition Number')
for n=[5,10,15]

    xtrue = (1:n)';
    H = hilb(n);
    b = H*xtrue;
    x = H\b;
    relativeErrorNorm = norm(x - xtrue, inf)/ norm(xtrue, inf);
    relativeComponentwiseError = max(abs((x - xtrue) ./ xtrue));
    conditionNumber = cond(H,inf)*n*eps;

fprintf('%-5d %-30.16f %-40.16f %-30.16f\n', n, relativeErrorNorm, relativeComponentwiseError, conditionNumber)

end