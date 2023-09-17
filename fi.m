% 
S = hilb(4)
A = tridiag(S)
Anew = qralg(A)
[eigenVals, errorCheck] = eigenCalc(A)



function A = tridiag(S)
    A = S; % Makes A modifiable output
    [m,~] = size(A); % Gets loop length 
    for k = 1:m-2
        x = A((k+1):m, k); % Gets column of A
        x(1) = sign(x(1)) * norm(x) + x(1); % Updates initial x values (found from external pages)
        Vk = x/norm(x);

        A(k+1:m,k:m) = A(k+1:m,k:m) - 2*Vk* (Vk' * A(k+1:m,k:m));
        A(k:m, k+1:m) = A(k:m,k+1:m) - 2* (A(k:m,k+1:m) * Vk)* Vk';
    end
end

% Q2
function Anew = qralg(A)
    AStore = {A}; % Stores A0 in AStore(1) <- Will be overwritten
    Q = {0}; 
    R = {0};
    k = 1; % Initializes counter (AStore,Q,R are already initialized)
    % Initializes Q,R as cell arrays
    while abs(AStore{k}(end,end-1)) > (10^-12) % Checks for latest value before proceeding
        [Q{k+1}, R{k+1}] = qr(AStore{k});
        AStore{k+1} = R{k+1}* Q{k+1};
        k = k + 1;
    end
    Anew = AStore{k}; % Outputs matrix of eigenvalues
end

% Q3
function [eigenVals, errorCheck] = eigenCalc(A)
    [ASize,~] = size(A);
    eigenVals = zeros(ASize,1); % Initializes eigenVals to correct size
    % errorCheck cannot be preallocated as the size can be any num

    triA = tridiag(A); % Gets Tridiagonal of A

    AStore = {triA}; % Stores A0 in AStore(1) <- Will be overwritten
    Q = {0}; 
    R = {0};
    k = 1; % Initializes counter (AStore,Q,R are already initialized)
    % Initializes Q,R as cell arrays
    errorCheck(1) = 1; % Initializes k to start matrix
    while abs(AStore{k}(end,end-1)) > (10^-12) % Checks for latest value before proceeding
        [Q{k+1}, R{k+1}] = qr(AStore{k});
        AStore{k+1} = R{k+1} * Q{k+1};
        errorCheck(k) = abs(AStore{k}(end,end-1)); % Sets current error value (initially overwrites the first value)
        k = k + 1;
    end

    eigenMatrix = AStore{k}; % Outputs matrix of eigenvalues
    for i = 1:ASize
        eigenVals(i,1) = eigenMatrix(i,i);
    end
end