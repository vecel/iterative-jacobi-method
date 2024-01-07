function [ct, jt, cnt] = porownaj(c, s, b, d)
%POROWNAJ Porownuje wyniki fukcji jacobi oraz testSolve
%   WEJŚCIE: c, s - poziome wektory tej samej dlugosci - wyznaczaja macierz
%            ukladu
%            b - wektor dlugosci dwa razy wiekszej od dlugosci c - kolumna
%            wyrazow wolnych ukladu
%            stop - wartosc toleracji bledu
%   WYJŚCIE: ct - tablica z wektorami c, s
%            jt - tablica z wynikiem działania metody jakobiego oraz
%            wbudowanej
%            cnt - liczba wykonanych iteracji w metodzie Jacobiego

A = [diag(c) diag(s); -diag(s) diag(c)];

A;
[Jacobi, cnt] = jacobi(c, s, b, d);
WartoscDokladna = testSolve(c, s, b);

c = c';
s = s';

ct = table(c, s);
jt = table(Jacobi, WartoscDokladna);

end

