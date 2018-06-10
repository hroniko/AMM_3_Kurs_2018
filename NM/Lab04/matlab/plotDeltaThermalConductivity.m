function plotDeltaThermalConductivity(x1, x2, t1, t2, Nx, Nt, cicles_1, cicles_2, type)
% Функция печати графика зависимости погрешности приближения от количества
% циклов пересчета

% x1, x2 - начало и конец отрезка по оси Х
% t1, t2 - начало и конец отрезка по оси T
% Nx - число отрезков разбиения по оси X
% Nt - число отрезков разбиения по оси T
% N - количество отрезков разбиения
% type - вариант метода (0 - обычный, 1 - Зейделя)

% 1 Создаем новое окно для графика и подписываем оси
figure; 
xlabel('Число циклов пересчета, сicles'); 
ylabel('Средняя абсолютная погрешность'); 
grid on; hold on;

[Xcool, Tcool, Pcool, P1cool] = ThermalConductivitySeidelIteration(x1, x2, t1, t2, Nx, Nt, 500000);
  
% 2 Выполняем вычисление
j = 1;
deltaY = cicles_1 : cicles_2;
deltaZ = deltaY;
for cicles = cicles_1 : cicles_2
    if type == 0
        [X, T, P, P1] = ThermalConductivitySimpleIteration(x1, x2, t1, t2, Nx, Nt, cicles);
    end
    if type == 1
        [X, T, P, P1] = ThermalConductivitySeidelIteration(x1, x2, t1, t2, Nx, Nt, cicles);
    end
    delta = deltaThermalConductivity(Pcool, P);
    deltaZ(j) = delta;
    j = j + 1;
end

if type == 0
    titleValue = strcat('Точность метода итераций: Nx=', int2str(Nx), '; Nt=', int2str(Nt));
end
if type == 1
    titleValue = strcat('Точность метода Зейделя: Nx=', int2str(Nx), '; Nt=', int2str(Nt));
end


% 3 Печатаем график погрешности:
plot(deltaY, deltaZ);

% 4 Подписываем легенду
title(titleValue, 'FontName', 'Courier');
h1 = legend('погрешность');
set(h1, 'FontName', 'Courier');

end