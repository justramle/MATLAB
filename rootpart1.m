%%
% TRAM LE
% 
% HOMEWORK 4: Part 3
%%

% 3.
% 1<=n<=30; 
n = 30;
for k = 1:length(n)
    a = poly(1:n(k))
    % finding root of poly
    r = roots(a)
    % random 2 pertured poly test case
    for i = 1:50
        for j = 1:n(k)+1
            % cal coeffient of perturbed poly
            a_tilde(i,j) = a(1,j)+(10^-10)*a(1,j)*rand(1)
            relIn = max(abs((a_tilde(i,j) - a) / a))
        end
        % fiding root of perturbed poly
        r_tilde(i,:) = roots(a_tilde(i,:)) 
       
        relOut = max(abs((r_tilde(k) - r)/r))
        
     end
    condition = relOut/relIn
    clear r_tilde
    
end




% %TEST CASE of n =3 instead of 30
% %loop thr all n
% n = 3
% for k = 1:length(n)
%     a = poly(1:n(k))
%     % finding root of poly
%     r = roots(a)
%     %random 2 pertured poly test case
%  %   for i = 1:2
%         for j = 1:n(k)+1
%             % cal coeffient of perturbed poly
%        %     a_tilde(i,j) = a(1,j)+(10^-10)*a(1,j)*rand(1)
%             a_tilde(j) = a(j)+(10^-10)*a(j)*rand(1)
%             relIn = max(abs((a_tilde(j) - a) / a))
%         end
%         % fiding root of perturbed poly
%         r_tilde(1,:) = roots(a_tilde(1,:)) 
%        
%         relOut = max(abs((r_tilde(k) - r)/r))
%         
%  %   end
%     % Compute condition
%     % Error. Dimension doesn't match from relOut and relIn
%     %    condition = relOut/relIn
%     clear r_tilde
%     
% end
% 

