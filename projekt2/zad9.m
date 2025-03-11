% Parametry GPC
D = 50 / Tp;
N = 20;
Nu = 3;
psi = 1;
lambda = 1;
iterations = 1000;

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
y0 = zeros(1, N);

% badane parametry
K_zero = 3.167;
op = 1;

for k=23:iterations
    y(k) = K_zero*0.049454*u(k-11-op) + K_zero*0.043698*u(k-12-op) + 1.6687*y(k-1) + (-0.68983)*y(k-2);
    dk = y(k) - (K_zero*0.049454*u(k-11-op) + K_zero*0.043698*u(k-12-op) + 1.6687*y(k-1) + (-0.68983)*y(k-2));

    for j = 1:N
        if j == 1
            y0(j) = 1.6687 * y(k) - 0.68983 * y(k-1) + 0.049454 * u(k-11+j) + 0.043698 * u(k-12+j) + dk;
        elseif j == 2
            y0(j) = 1.6687 * y0(j-1) - 0.68983 * y(k) + 0.049454 * u(k-11+j) + 0.043698 * u(k-12+j) + dk;
        elseif j >= 3 && j < 11
            y0(j) = 1.6687 * y0(j-1) - 0.68983 * y0(j-2) + 0.049454 * u(k-11+j) + 0.043698 * u(k-12+j) + dk;
        elseif j >= 11
            y0(j) = 1.6687 * y0(j-1) - 0.68983 * y0(j-2) + (0.049454 + 0.043698) * u(k-1) + dk;
        end
    end
    
    % Prawo regulacji
    du = K1 * (y_zad(k) * ones(N,1) - y0(1,:)');
    
    u(k) = u(k-1) + du(1,1);   
end

figure;
plt1 = stairs(y);
hold on
stairs(y_zad,':');
ylabel('y(k)');
xlabel('k');
title("Wyjście y(k) na tle wartości zadanej");
hold off