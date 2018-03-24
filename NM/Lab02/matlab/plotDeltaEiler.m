function plotDeltaEiler(a, b, N_start, N_end, stPy, stPz, type)
% Функция печати графика зависимости погрешности приближения от числа
% узловых точек
% a - начало отрезка
% b - конец отрезка
% N_start - начальное количество отрезков разбиения
% N_end - конечное количество отрезков разбиения
% stPy, stPz - начальные условия, то есть значения Y и Z в точке X=a,
% type - вариант метода Эйлера (0 - если явный, 1 - неявный)

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
    if (type == 0)
        [X, Y, Z] = EilerExplicitMethod(a, b, N, stPy, stPz);
        titleValue = ' явного';
    end
    if (type == 1)
        [X, Y, Z] = EilerImplicitMethod(a, b, N, stPy, stPz);
        titleValue = ' неявного';
    end
    if (type == 2)
        [X, Y, Z] = EilerCorrectedMethod(a, b, N, stPy, stPz);
        titleValue = ' исправленного';
    end
    if (type == 3)
        [X, Y, Z] = EilerModifiedMethod(a, b, N, stPy, stPz);
        titleValue = ' модифицированного';
    end 
    [Yt, Zt] = F4(X);
    deltaY(j) = deltaEiler(Yt, Y);
    deltaZ(j) = deltaEiler(Zt, Z);
    j = j + 1;
end
    
titleValue = strcat('Точность', titleValue, ' метода Эйлера');
X = N_start : N_end;

% 3 Печатаем графики погрешностей:
plot(X, deltaY, 'r-o');
plot(X, deltaZ, 'bo');

% 4 Подписываем легенду
title(titleValue, 'FontName', 'Courier');
h1 = legend('погрешность для Y', 'погрешность для Z');
set(h1, 'FontName', 'Courier');

end