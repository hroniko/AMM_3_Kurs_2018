function [stPz_o, k, enPz_s] = ShootingMethod2(a, b, N, stPy, enPz)
% Метод стрельбы для решения краевой задачи (сведение краевой задачи к
% некоторой задаче Коши для той же системы дифференциальных уравнений)

% a - начало отрезка
% b - конец отрезка
% N - количество отрезков разбиения
% stPy, enPz - краевые условия, то есть значения Y в точке X=a и Z в точке
% X=b

stPz_l = 1; % начальное приближение к stPz слева
stPz_r = 3; % начальное приближение к stPz справа
enPz_s = 0.1; % начальное приближение к enPz
delta = 0.000001; % Погрешность, при которой следует остановить рассчеты
k_max = 10000; % Максимальное количество шагов, при которых остановить рассчеты

k = 0; % счетчик шагов
while k < k_max % пока шаг превышет погрешность, считаем дальше   
    
    
    stPz_o = (stPz_l+stPz_r)/2;  
    [Xl, Yl, Zl] = Adams2ExplicitMethod(a, b, N, stPy, stPz_l);  % слева 
    [Xr, Yr, Zr] = Adams2ExplicitMethod(a, b, N, stPy, stPz_r);  % справа
    [Xo, Yo, Zo] = Adams2ExplicitMethod(a, b, N, stPy, stPz_o); % в центре
    
    k = k + 1; 
    
    Zleft = enPz - Zl(N+1);
    Zright = enPz - Zr(N+1);
    Zcenter = enPz - Zo(N+1);
    
    if (abs(Zcenter) < delta)
      break;
    end
    
    if (Zleft * Zcenter) < 0
        stPz_r = stPz_o;        
        enPz_s = Zo(N+1);
        continue;
    end
    
    if (Zcenter * Zright) < 0
        stPz_l = stPz_o;        
        enPz_s = Zo(N+1);
        continue;
    end 
    
%     if (enPz < Zl(N+1))
%         stPz_l = stPz_l * 0.5;
%         continue;
%     end
%     
%      if (enPz > Zr(N+1))
%         stPz_r = stPz_r * 0.5;
%         continue;
%     end
    

end


end