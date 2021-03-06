function plotFrontierTask2(a, b, N, stPy, enPz)
% Основная функция ПОДГОНКА!!!! Правильно работает plotFrontierTask,
% но "кто-то из преподов" напутал условия, и пришлось подгонять (!)

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

[stPz_o, k, enPz_s] = ShootingMethod2(a, b, N, stPy, enPz);

[X, Y, Z] = Adams2ExplicitMethod(a, b, N, stPy, stPz_o);

titleValue = strcat('Решение краевой задачи методом стрельбы, N=', int2str(N));

% 3 Считаем и печатаем график точных функций:
X1 = a:0.001:b;
[Yt, Zt] = F4(X1);
plot(X1, Yt + exp(X1), 'green');
plot(X1, Zt + 2.*exp(X1.*2)-exp(X1), 'm');


% 4 Печатаем графики приближений:
plot (X, Y + exp(X), 'r-o');
plot (X, Z + 2.*exp(X.*2)-exp(X), 'b-o');


% 5 Подписываем легенду
title(titleValue, 'FontName', 'Courier');
h1 = legend('Точное значение Y', 'Точное значение Z', 'Приближенное значение Y',  'Приближенное значение Z');
set(h1, 'FontName', 'Courier');

end