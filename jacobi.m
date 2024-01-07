function [x, cnt] = jacobi(c, s, b, stop)
%JACOBI Wyznacza rozwiazanie ukladu rownan Ax = b metoda Jacobiego, gdzie A jest macierza
%blokowa [C S; -S C] przy czym C = diag(c), S = diag(s), detC != 0 oraz
%s.^2 + c.^2 = wektor jedynek
%   WEJŚCIE: c, s - poziome wektory tej samej dlugosci - wyznaczaja macierz
%            ukladu
%            b - wektor dlugosci dwa razy wiekszej od dlugosci c - kolumna
%            wyrazow wolnych ukladu
%            stop - wartosc toleracji bledu
%   WYJŚCIE: x - rozwiazanie ukladu Ax = b
%            cnt - liczba wykonanych iteracji (max 100000)

p = length(c);
x = zeros(1, 2*p);
prev = ones(1, 2*p);
sign = [-ones(1, p) ones(1, p)];
swap = [(p+1):2*p 1:p];
cnt = 0;
cc = [c c];
ss = [s s];

cj = b ./ cc;
bj = ss ./ cc;
bj = bj .* sign;

counter = 100000;
while true
    if counter == 0
        break
    end
    if norma2(x - prev) < stop
        break
    end
    
    prev = x;
    x = x(swap);
    x = bj .* x;
    x = x + cj;
    counter = counter - 1;
    cnt = cnt + 1;
end
x = x';
end

