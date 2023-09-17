%%
% TRAM LE
% 
% HOMEWORK 4: Part 2
%%
clear all
format long
%2. 
n = [5 10 15 20]
%loop thr all n
for k = 1:length(n)
    %seperate each graph
    figure
    % cal coeffient of poly of the given root above
    p = poly(1:n(k))
    % generate 50 perturbed poly and plot them
    for i = 1:50
        %tack n+1 to each iterate for n vector
        for j = 1:n(k)+1
            %aj= aj+ 10^−10 ∗aj∗(a random number),
            pertubed_poly(i,j) = p(1,j)+(10^-10)*p(1,j)*rand(1)
        end
        %Find roots of perturbed poly by look through all the column in
        %each row
        r(i,:) = roots(pertubed_poly(i,:))
        x = real(r(i,:))
        y = imag(r(i,:))
        plot(x,y,'*', LineWidth=2)
        title('Plot the roots of 50 perturbed polynomials')
        hold on
    end
    %clear each iteration
    clear r
end
% % The error get worse when we increase n. Proof by the graph 1 to 4 and
% % hold on on the 4th graph

% %2. 
% n = [5 10 15 20]
% %loop thr all n
% for k = 1:length(n)
%     %seperate each graph
%     figure
%     % cal coeffient of poly of the given root above
%     p = poly(1:n(k))
%     % generate 50 perturbed poly and plot them
%     for i = 1:50
%         %tack n+1 to each iterate for n vector
%         for j = 1:n(k)+1
%             %aj= aj+ 10^−10 ∗aj∗(a random number),
%             pertubed_poly(i,j) = p(1,j)+(10^-10)*p(1,j)*rand(1)
%         end
%         %Find roots of perturbed poly by look through all the column in
%         %each row
%         r(i,:) = roots(pertubed_poly(i,:))
%         x = real(r(i,:))
%         y = imag(r(i,:))
%         plot(x,y,'*', LineWidth=2)
%         title('Plot the roots of 50 perturbed polynomials')
%         hold on
%     end
%     %clear each iteration
%     clear r
% end
% The error get worse when we increase n. Proof by the graph 1 to 4 and
% hold on on the 4th graph