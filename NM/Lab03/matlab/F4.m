function [Y, Z]=F4(X)
% Точное решение
Y = 1 + exp(X); % Y = 1 + exp(X); % 
Z = 4.331.*exp(0.6366.*X); % Z = X + 4.311.*exp(0.4638.*X);  % Z = X + exp(X);
end