function plotEiler(a, b, N, stPy, stPz, type)
% Основная функция, вычисляет приближение к функциям по одному из
% методов Эйлера (явного или неявного) и строит сравнительные графики для исходной функции и
% приближающей функции, с нанесением узловых точек

% a - начало отрезка
% b - конец отрезка
% N - количество отрезков разбиения
% stPy, stPz - начальные условия, то есть значения Y и Z в точке X=a,
% type - вариант метода Эйлера (0 - если явный, 1 - неявный)

% 1 Создаем новое окно для графика и подписываем оси
figure; 
xlabel('X'); 
ylabel('Y, Z'); 
hold on; 
grid on; 

% 2 Находим приближающие значения метдом Эйлера:
X = zeros(1);
Y = X;
Z = X;    
if (type == 0) % Если явный метод, то
    [X, Y, Z] = EilerExplicitMethod(a, b, N, stPy, stPz);
    titleValue = 'Явный';
end
if (type == 1) % Если НЕявный метод, то
    [X, Y, Z] = EilerImplicitMethod(a, b, N, stPy, stPz);
    titleValue = 'Неявный';
end
if (type == 2) % Если исправленный метод, то
    [X, Y, Z] = EilerCorrectedMethod(a, b, N, stPy, stPz);
    titleValue = 'Исправленный';
end
if (type == 3) % Если модифицированный метод, то
    [X, Y, Z] = EilerModifiedMethod(a, b, N, stPy, stPz);
    titleValue = 'Модифицированный';
end
titleValue = strcat(titleValue, ' метод Эйлера, N=', int2str(N));

% 3 Считаем и печатаем график точных функций:
X1 = a:0.001:b;
[Yt, Zt] = F4(X1);
plot(X1, Yt, 'green');
plot(X1, Zt, 'm');


% 4 Печатаем графики приближений:
plot (X, Y, 'r-o');
plot (X, Z, 'b-o');


% 5 Подписываем легенду
title(titleValue, 'FontName', 'Courier');
h1 = legend('Точное значение Y', 'Точное значение Z', 'Приближенное значение Y',  'Приближенное значение Z');
set(h1, 'FontName', 'Courier');

end