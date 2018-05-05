function [stPz, k, enPz_rs] = ShootingMethod(a, b, N, stPy, enPz)
% Метод стрельбы для решения краевой задачи (сведение краевой задачи к
% некоторой задаче Коши для той же системы дифференциальных уравнений)

% a - начало отрезка
% b - конец отрезка
% N - количество отрезков разбиения
% stPy, enPz - краевые условия, то есть значения Y в точке X=a и Z в точке
% X=b

eps = 0.01; % Погрешность расчета, при которой следует остановить вычисления
stPz = 0.001; % начальное приближение к stPz
delta = 0.1; % начальное значение шага по Z
enPz_rs = 0.5;

k = 0; % счетчик шагов
while (delta > eps) % пока шаг превышет погрешность, считаем дальше
    % Вычисляем значение в точке stPz
    [X, Y, Z] = Adams2ExplicitMethod(a, b, N, stPy, stPz);
    enPz_rs = Z(N+1);
    k = k + 1;
    
    [X1, Y1, Z1] = Adams2ExplicitMethod(a, b, N, stPy, stPz-delta);
    delta1 = abs(Z1(N+1)-Z(N+1))
    
    [X2, Y2, Z2] = Adams2ExplicitMethod(a, b, N, stPy, stPz+delta);
    delta2 = abs(Z2(N+1)-Z(N+1))
    
    if (abs(enPz_rs - enPz) < delta2)
        delta = delta / 2;
        continue;
    end
    
    if (enPz_rs < enPz) % Идем вверх
        stPz = stPz + delta;
    end
    
    if (enPz_rs > enPz) % Идем вниз
        stPz = stPz - delta;
    end
    
end

end