function d = deltaThermalConductivity(U1, U2)
% Функция вычисления погрешности между значениями функции и значениями 
% приближения

n = size(U1,1) * size(U1,2);
D = U1 - U2; % Матрица разности
Dabs = abs(D);
d = sum(sum(Dabs)) / n;
end