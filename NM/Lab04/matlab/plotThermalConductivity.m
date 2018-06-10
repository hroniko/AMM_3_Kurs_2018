function plotThermalConductivity(x1, x2, t1, t2, Nx, Nt, cicles, type)
% Основная функция для вывода графиков

% x1, x2 - начало и конец отрезка по оси Х
% t1, t2 - начало и конец отрезка по оси T
% Nx - число отрезков разбиения по оси X
% Nt - число отрезков разбиения по оси T
% cicles - количество уиклов пересчета
% type - вариант метода (0 - обычный, 1 - Зейделя)

% 1 Создаем новое окно для графика и подписываем оси
figure; 
xlabel('X'); 
ylabel('T'); 
zlabel('U'); 
hold on; 
grid on; 

% 2 Вычисляем

if type == 0
    [X, T, P, P1] = ThermalConductivitySimpleIteration(x1, x2, t1, t2, Nx, Nt, cicles);
    titleValue = strcat('Метод итераций: Nx=', int2str(Nx), '; Nt=', int2str(Nt), '; cicles=', int2str(cicles));

end
if type == 1
    [X, T, P, P1] = ThermalConductivitySeidelIteration(x1, x2, t1, t2, Nx, Nt, cicles);
    titleValue = strcat('Метод Зейделя: Nx=', int2str(Nx), '; Nt=', int2str(Nt), '; cicles=', int2str(cicles));

end

% 3 Печатаем 3-d график
surf(X, T, P);

% 4 Подписываем легенду
title(titleValue, 'FontName', 'Courier');

colorbar

end