%%
% TRAM LE
% 
% HOMEWORK 3: MATLAB functions
%%
clear all
format long

% % 1.
%roots are x = 1, x = 2, x = 3
n = 3
% cal poly: (x-1)(x-2)(x-3) = x^3-6x^2+11x-6
p = poly(1:n)
%finding roots of poly coefficient equal to vector p
r = roots(p)

% Using the root() in Matlab doesn't obtain the exact original root
% it just gives us the approximation

% %2. 
% n = [5 10 15 20]; 
% %loop thr all n
% for k = 1:length(n)
%     %seperate each graph
%     figure
%     % cal coeffient of poly of the given root above
%     p = poly(1:n(k));
%     % generate 50 perturbed poly and plot them
%     for i = 1:50
%         %tack n+1 to each iterate for n vector
%         for j = 1:n(k)+1
%             %aj= aj+ 10^−10 ∗aj∗(a random number),
%             pertubed_poly(i,j) = p(1,j)+(10^-10)*p(1,j)*rand(1)
%         end
%         %Find roots of perturbed poly by look through all the column in
%         %each row
%         r(i,:) = roots(pertubed_poly(i,:));
%         x = real(r(i,:));
%         y = imag(r(i,:));
%         plot(x,y,'*', LineWidth=2)
%         title('Plot the roots of 50 perturbed polynomials')
%         hold on
%     end
%     %clear each iteration
%     clear r
% end
% % The error get worse when we increase n. Proof by the graph 1 to 4 and
% % hold on on the 4th graph


% % 3.
% % 1<=n<=30; 
% n = 30
% for k = 1:length(n)
%     a = poly(1:n(k))
%     % finding root of poly
%     r = roots(a)
%     % random 2 pertured poly test case
%     for i = 1:50
%         for j = 1:n(k)+1
%             % cal coeffient of perturbed poly
%             a_tilde(i,j) = a(1,j)+(10^-10)*a(1,j)*rand(1)
%             relIn = max(abs((a_tilde(i,j) - a) / a))
%         end
%         % fiding root of perturbed poly
%         r_tilde(i,:) = roots(a_tilde(i,:)) 
%        
%         relOut = max(abs((r_tilde(k) - r)/r))
%         condition = relOut/relIn
%         
%     end
%     clear r_tilde
%     
% end





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
%             relIn(j) = max(abs((a_tilde(j) - a) / a))
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
