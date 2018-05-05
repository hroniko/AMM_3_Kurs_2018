function [stPz, k, enPz_rs] = ShootingMethod2(a, b, N, stPy, enPz)
% Метод стрельбы для решения краевой задачи (сведение краевой задачи к
% некоторой задаче Коши для той же системы дифференциальных уравнений)

% a - начало отрезка
% b - конец отрезка
% N - количество отрезков разбиения
% stPy, enPz - краевые условия, то есть значения Y в точке X=a и Z в точке
% X=b

eps = 0.000001; % Погрешность расчета, при которой следует остановить вычисления
stPz = 0.001; % начальное приближение к stPz
delta = 0.5; % начальное значение шага по Z
enPz_rs = 0.5;

k = 0; % счетчик шагов
while (delta > eps) % пока шаг превышет погрешность, считаем дальше
    % Вычисляем значение в точке слева (ниже) от точки stPz
    [Xl, Yl, Zl] = Adams2ExplicitMethod(a, b, N, stPy, stPz-delta);
    
    % Вычисляем значение в точке справа (выше) от точки stPz
    [Xr, Yr, Zr] = Adams2ExplicitMethod(a, b, N, stPy, stPz+delta);

    enPz_l = Zl(N+1); enPz_r = Zr(N+1); 
    
    % Выбираем направление шага:
    if ( abs(enPz-enPz_l) > abs(enPz-enPz_r) ) % нужно идти вправо
        dd0 = abs(enPz-enPz_l); dd1 = abs(enPz-enPz_r);
        while (dd0 > dd1)
            stPz = stPz + delta;
            % Вычисляем значение в точке справа (выше) от точки stPz
            [Xr, Yr, Zr] = Adams2ExplicitMethod(a, b, N, stPy, stPz);
            dd0 = dd1;
            dd1 = abs(enPz-Zr(N+1));
            k = k + 1;
            enPz_rs = Zr(N+1)
        end
        delta = delta / 2;
        continue;        
    end
    if ( abs(enPz-enPz_l) < abs(enPz-enPz_r) ) % нужно идти влево
        dd0 = abs(enPz-enPz_r);
        dd1 = abs(enPz-enPz_l);
        while (dd0 > dd1)
            stPz = stPz - delta;
            % Вычисляем значение в точке слева (ниже) от точки stPz
            [Xl, Yl, Zl] = Adams2ExplicitMethod(a, b, N, stPy, stPz);
            dd0 = dd1;
            dd1 = abs(enPz-Zl(N+1));
            k = k + 1;
            enPz_rs = Zl(N+1)
        end
        delta = delta / 2;
        continue;
    end
end

end