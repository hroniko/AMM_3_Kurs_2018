function [Y, Z]=F4(X)
% Точное решение
Y = 2. * exp(X); % Y = 1 + exp(X); % Y = 1 + exp(X); % 
Z = X + 2. * exp(X.*2);% Z = 4.331.*exp(0.6366.*X); % Z = X + 4.311.*exp(0.4638.*X);  % Z = X + exp(X);
end