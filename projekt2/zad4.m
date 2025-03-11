% Parametry DMC
D = 50 / Tp; 
N = 20;
Nu = 3;
psi = 1;
lambda = 1; 
iterations = 150;

% Odpowiedź skokowa
s = tf('s');
Gs = (K0*exp(-T0*s))/((T1*s+1)*(T2*s+1));
Gz = c2d(Gs, Tp, 'zoh');
step_predict=step(Gz, Tp * D);
S=zeros(1,1,D);
for i=1:1
    for j=1:1
        S(i,j,:)=step_predict(2:D+1,i,j); 
    end
end


%Macierz M
M=zeros(N,Nu);
for i = 1:Nu
    for j = i:N
        M(j, i) = S(j-i+1);
    end
end

%Macierz MP
MP=zeros(N,(D-1));
for i=1:D-1
    for j=1:N
        MP(j, i) = S(min(j+i, D)) - S(i);
    end
end

psi_matrix = psi*eye(N, N);
lambda_matrix = lambda * eye(Nu, Nu);
K = (M' * psi_matrix * M + lambda_matrix)^(-1) * M' * psi_matrix;
K1 = K(1:1, :);
Ku=K(1,:)*MP;
Ke=sum(K(1,:));

% Inicjalizacja macierzy do pętli
u = zeros(1, iterations);
y = zeros(1, iterations);
y_zad = zeros(1, iterations);
y_zad(12:end) = 1;
% y_zad(12:end) = 1;
% y_zad(51:end) = -1;
du_past = zeros((D - 1), 1);

noise = zeros(1, iterations);
noise(30:end) = -0.01; 
noise(80:end) = 0.01; 

for k = 13:iterations
    y(k) = 0.049454*u(k-11) + 0.043698*u(k-12) + 1.6687*y(k-1) + (-0.68983)*y(k-2);
    % y(k) = y(k) + noise(k);
    % Prawo regulacji
    du = K1 * (y_zad(k) - y(k) - MP * du_past);
    % Aktualizacja zmian sterowania
    du_past = [du; du_past(1:end-1)];

    u(k) = u(k-1) + du(1,1);
end

y_dmc = y;
u_dmc = u;

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
title('Sygnał wyjściowy y(k) i wartość zadana y_{zad}(k)')