function d = deltaByDoubleSolve(a, b, N, stPy, stPz)
% Функция вычисления погрешности между значениями функции и значениями 
% приближения

[X, Y, Z] = Adams2ExplicitMethod(a, b, N, stPy, stPz);   
[X05, Y05, Z05] = Adams2ExplicitMethod(a, b, N*2, stPy, stPz);
DD = Z;
for i = 1:1:N
    DD(i) = abs(Z(i) - Z05(2*i))/3;
    
end
d = max(DD);

end