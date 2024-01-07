function x = testSolve(c, s, b)
%TESTSOLVE Wyznacza rozwiazanie ukladu rownan Ax = b funkcja wbudowana linsolve, gdzie A jest macierza
%blokowa [C S; -S C] przy czym C = diag(c), S = diag(s), detC != 0 oraz
%s.^2 + c.^2 = wektor jedynek
%   WEJŚCIE: c, s - poziome wektory tej samej dlugosci - wyznaczaja macierz
%            ukladu
%            b - wektor dlugosci dwa razy wiekszej od dlugosci c - kolumna
%            wyrazow wolnych ukladu
%   WYJŚCIE: x - rozwiazanie ukladu Ax = b

A = [diag(c) diag(s); -diag(s) diag(c)];
x = linsolve(A, b');

end

