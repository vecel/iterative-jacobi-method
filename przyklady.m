% Mateusz Karandys

% PRZYKLAD 1
% Widać, że metoda czasem jest zbieżna, a czasem rozbieżna do +/- INF.
% Zbieżna dla c_i bliskich 1
% c = linspace(0.01, 1, 25);
% s = sqrt(1 - c.^2);
% b = rand(1, 50);

% [ct, jt] = porownaj(c, s, b, 1e-10);
% ct
% jt

% PRZYKLAD 2
% Dla wartości c_i >= 0.70727 mamy zbieżność, dla mniejszych rozbieżność
% 0.70727 - dla tego elem zbiega, dla wczesniejszych nie
% c = linspace(0.7, 0.71, 23);
% s = sqrt(1 - c .^ 2);
% b = rand(1, 46) * 100;

% [ct, jt] = porownaj(c, s, b, 1e-10);
% ct
% jt

% PRZYKLAD 3
% Wartości elem b nie wpływają na zbieżność, metoda działa (z ograniczeniem
% z przykładów 1,2) dla dowolnych wartości b. Tutaj przykład dla dużych
% c = rand(1, 100) .* 0.2 + 0.8; % wartości c_i, dla których metoda jest zbieżna
% s = sqrt(1 - c .^ 2);
% b = rand(1, 200) * 10000000;

% [ct, jt, cnt] = porownaj(c, s, b, 1e-10);
% ct
% jt
% cnt

% PRZYKLAD 4
% To się chwilę liczy. Duży rozmiar danych nie wpływa na zbieżność metody.
% c = rand(1, 5000) .* 0.2 + 0.8;
% s = sqrt(1 - c .^ 2);
% b = rand(1, 10000);

% [ct, jt] = porownaj(c, s, b, 1e-10);
% ct
% jt

% PRZYKLAD 5
% Zależność liczby iteracji od rozmiaru macierzy dla metody zbieżnej (1 >= c_i >= 0.8).
% W komórkach tabeli znajdują się liczby iteracji w danej próbie (kolumna)
% dla danego rozmiaru (wiersz)

% R = zeros(6, 10);
% n = [10 20 40 100 200 1000];
% for i=1:10
%     for j=1:6
%         c = rand(1, n(j)) .* 0.2 + 0.8;
%         s = sqrt(1 - c.^ 2);
%         b = rand(1, 2*n(j));
%         [~, ~, cnt] = porownaj(c, s, b, 1e-10);
%         R(j, i) = cnt;
%     end
% end
% array2table([R mean(R, 2)], 'RowNames', {'Rozmiar 10x10', 'Rozmiar 20x20', 'Rozmiar 40x40', 'Rozmiar 100x100', 'Rozmiar 200x200', 'Rozmiar 1000x1000'}, 'VariableNames', {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Średnia'})


% PRZYKLAD 6
% Zależność szybkości zbieżności metody od zakresu wartości elementów c_i
% Im wartości c_i są bliżej 1, tym szybsza jest metoda Jakobiego
% R = zeros(4, 10);
% for i=1:10
%    for j=1:4
%        a = 0.05 * j;
%        b = 1 - a;
%        c = rand(1, 50) .* a + b;
%        s = sqrt(1 - c .^ 2);
%        b = rand(1, 100);
%        [~, ~, cnt] = porownaj(c, s, b, 1e-10);
%        R(j, i) = cnt;
%    end
% end

% array2table([R mean(R, 2)], 'RowNames', {'Zakres 0.95-1', 'Zakres 0.90-1', 'Zakres 0.85-1', 'Zakres 0.80-1'}, 'VariableNames', {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Średnia'})


