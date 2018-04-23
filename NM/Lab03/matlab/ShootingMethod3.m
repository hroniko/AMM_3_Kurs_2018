function [stPz, k, enPz_rs] = ShootingMethod3(a, b, N, stPy, enPz)
% Метод стрельбы для решения краевой задачи (сведение краевой задачи к
% некоторой задаче Коши для той же системы дифференциальных уравнений)

% a - начало отрезка
% b - конец отрезка
% N - количество отрезков разбиения
% stPy, enPz - краевые условия, то есть значения Y в точке X=a и Z в точке
% X=b

stPz = 0; % начальное приближение к stPz
stPz_l = 0.1; % начальное приближение к stPz слева
stPz_r = 80; % начальное приближение к stPz справа
enPz_rs = 0.5;

k = 0; % счетчик шагов
while true % пока шаг превышет погрешность, считаем дальше    
    stPz = (stPz_l+stPz_r)/2;    
    [Xl, Yl, Zl] = Adams2ExplicitMethod(a, b, N, stPy, stPz_l);   
    [Xr, Yr, Zr] = Adams2ExplicitMethod(a, b, N, stPy, stPz_r);   
    [Xo, Yo, Zo] = Adams2ExplicitMethod(a, b, N, stPy, stPz);
    
    k = k + 1; 
    
    if Zl(N+1) > enPz
        stPz_l = stPz_l + 0.1;
        continue;
    end
    
    if enPz > Zr(N+1)
        stPz_l = stPz_l - 0.1;
        continue;
    end   
    if Zl(N+1) < enPz & enPz < Zo(N+1)
        stPz_r = stPz;        
        enPz_rs = Zo(N+1);        
        continue;
    end    
    if Zo(N+1) < enPz & enPz < Zr(N+1)
        stPz_l = stPz;        
        enPz_rs = Zo(N+1);
        continue;
    end    
    break;

end

end