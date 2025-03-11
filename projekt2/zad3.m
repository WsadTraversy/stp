% WYZNACZANIE WZMOCNIENIA KRYTYCZNEGO

% %Inicjalizacja macierzy
% iterations = 300;
% u = zeros(1, iterations);
% y = zeros(1, iterations);
% y_zad = ones(1, iterations);
% Kk = 0.509;
% 
% %Pętla
% for k = 13:iterations
%     y(k) = 0.049454*u(k-11) + 0.043698*u(k-12) + 1.6687*y(k-1) + (-0.68983)*y(k-2);
%     e = y_zad(k) - y(k);
%     u(k) = Kk * e;
% end
% 
% figure;
% stairs(y);  
% xlabel('t(s)');
% ylabel('y');
% title('Wyznaczanie wzmocnienia krytycznego');
% grid on;


% PID

% Wzmocnienie krytyczne, okres oscylacji krytycznych
Kk = 0.509;
Tk = 20; 

% Parametry ciągłego regulatora PID
Kr = 0.6 * Kk;
Ti = 0.5 * Tk;
Td = 0.12 * Tk;

% Parametry dyskretnego regulatora PID
r0 = Kr * ( 1 + Tp/(2 * Ti) + Td/Tp );
r1 = Kr * ( Tp/(2 * Ti) - (2 * Td)/Tp - 1 );
r2 = Kr * ( Td/Tp );

disp(r0)
disp(r1)
disp(r2)
% Inicjalizacja macierzy
iterations = 100;
u = zeros(1, iterations);
y = zeros(1, iterations);
e = zeros(1, iterations);
y_zad = zeros(1, iterations); 
y_zad(12:end) = 1; 

for k = 13:iterations 
    y(k) = 0.049454*u(k-11) + 0.043698*u(k-12) + 1.6687*y(k-1) + (-0.68983)*y(k-2);
    e(k) = y_zad(k) - y(k);
    u(k)=r2*e(k-2)+r1*e(k-1)+r0*e(k)+u(k-1);
end

y_pid = y;
u_pid = u;

% Rysowanie wykresu sterowania
figure;
hold on;
grid on;
stairs(u);
xlabel('k');
ylabel('u(k)')
legend('u(k)');
title('Sygnał sterowania u(k)');

% Rysowanie wykresu sygnału wyjściowego i wartości zadanej
figure;
hold on;
grid on;
stairs(y);
stairs(y_zad, ':');
xlabel('k');
ylabel('y(k)')
legend('y(k)', 'y_{zad}(k)');
title('Sygnał wyjściowy y(k) i wartość zadana y_{zad}(k)');
