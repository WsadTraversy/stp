%rysunki zadanie3
%{
figure;
hold on;
grid on;
plot(out.zad3_x1, 'DisplayName', 'x1');
plot(out.zad3_x2, 'DisplayName', 'x2');
plot(out.zad3_x3, 'DisplayName', 'x3');
hold off;
title(['Odpowiedź dla bieguna regulatora s_o = -8']);
xlabel('Czas [s]');
ylabel('Wartości');
legend('x1', 'x2', 'x3', 'Location', 'southeast');

figure 
plot(out.zad3_u)
grid on;
xlabel('t [s]');
ylabel('Wartości');
title('Przebieg u(t)');
legend('u(t)');
%}

%rysunki zadanie 5
%{
figure;
hold on;
grid on;
plot(out.zad5_x1_obs, 'DisplayName', 'x1');
plot(out.zad5_x2_obs, 'DisplayName', 'x2');
plot(out.zad5_x3_obs, 'DisplayName', 'x3');
%plot(out.zad5_x2_obs, 'DisplayName', 'x2');
%plot(out.zad5_x3_obs, 'DisplayName', 'x3');
hold off;
title(['Przebiegi estymowane dla bieguna obserwatora s_o = -6']);
xlabel('Czas [s]');
ylabel('Wartości');
legend('x1(t)', 'x2(t)', 'x3(t)','Location', 'southeast');

figure;
hold on;
grid on;
plot(out.zad5_x1, 'DisplayName', 'x1');
plot(out.zad5_x2, 'DisplayName', 'x2');
plot(out.zad5_x3, 'DisplayName', 'x3');
%plot(out.zad5_x2_obs, 'DisplayName', 'x2');
%plot(out.zad5_x3_obs, 'DisplayName', 'x3');
hold off;
title(['Przebiegi rzeczywiste dla bieguna obserwatora s_o = -6']);
xlabel('Czas [s]');
ylabel('Wartości');
legend('x1(t)', 'x2(t)', 'x3(t)','Location', 'southeast');
%}

%rysunki zadanie 7
%{
figure;
hold on;
grid on;
plot(out.zad7_x1_obs, 'DisplayName', 'x1');
%plot(out.zad7_x2_obs, 'DisplayName', 'x2');
%plot(out.zad7_x3_obs, 'DisplayName', 'x3');
hold off;
title(['Przebiegi zmiennych stanu']);
xlabel('Czas [s]');
ylabel('Wartości');
legend('x1(t)','Location', 'southeast');

figure;
hold on;
grid on;
plot(out.zad7_u, 'DisplayName', 'u');
hold off;
title(['Przebieg sygnału sterującego']);
xlabel('Czas [s]');
ylabel('Wartości');
legend('u(t)','Location', 'southeast');
%}

%zadanie dodatkowe
%{
figure;
hold on;
grid on;
plot(out.dot_u, 'DisplayName', 'u');
hold off;
title(['Przebieg u(t)']);
xlabel('Czas [s]');
ylabel('Wartości');
legend('u(t)','Location', 'southeast');

figure;
hold on;
grid on;
plot(out.dot_y, 'DisplayName', 'y1');
plot(out.y_zad, 'DisplayName', 'y2');
hold off;
title(['Przebieg y(t), yzad(t)']);
xlabel('Czas [s]');
ylabel('Wartości');
legend('y(t)', 'yzad(t)','Location', 'southeast');

figure;
hold on;
grid on;
plot(out.dot_x1, 'DisplayName', 'x1');
plot(out.dot_x2, 'DisplayName', 'x2');
plot(out.dot_x3, 'DisplayName', 'x3');
hold off;
title(['Przebieg zmiennych stanu']);
xlabel('Czas [s]');
ylabel('Wartości');
legend('x1(t)', 'x2(t)', 'x3(t)','Location', 'southeast');
%}

