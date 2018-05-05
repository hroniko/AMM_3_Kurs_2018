function plotDeltaAdams(a, b, N_start, N_end, stPy, stPz)
% Функция печати графика зависимости погрешности приближения от числа
% узловых точек
% a - начало отрезка
% b - конец отрезка
% N_start - начальное количество отрезков разбиения
% N_end - конечное количество отрезков разбиения
% stPy, stPz - начальные условия, то есть значения Y и Z в точке X=a

% 1 Создаем новое окно для графика и подписываем оси
figure; 
xlabel('Число частичных отрезков разбиения, N'); 
ylabel('Средняя абсолютная погрешность'); 
grid on; hold on;

  
% 2 Выполняем приближение
j = 1;
deltaY = N_start : N_end;
deltaY = deltaY * 0;
deltaZ = deltaY;
for N = N_start : N_end
    [X, Y, Z] = Adams2ExplicitMethod(a, b, N, stPy, stPz);
    [Yt, Zt] = F4(X);
    deltaY(j) = deltaAdams(Yt, Y);
    deltaZ(j) = deltaAdams(Zt, Z);
    j = j + 1;
end
    
titleValue = 'Точность явного метода Адамса 2 порядка';
X = N_start : N_end;

% 3 Печатаем графики погрешностей:
plot(X, deltaY, 'r-o');
plot(X, deltaZ, 'bo');

% 4 Подписываем легенду
title(titleValue, 'FontName', 'Courier');
h1 = legend('погрешность для Y', 'погрешность для Z');
set(h1, 'FontName', 'Courier');

end