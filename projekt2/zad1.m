s = tf('s');
Gs = (K0*exp(-T0*s))/((T1*s+1)*(T2*s+1));
[num1, den1] = tfdata(Gs, 'v');

GZ = c2d(Gs, Tp, 'zoh');

%step(Gs, '-', GZ, '--')

% Odpowiedź skokowa
figure;
hold on;
step(Gs);
step(GZ);
legend('Ciągła', 'Dyskretna');
title('Porównanie odpowiedzi skokowych');

% Wzmocnienia statyczne
Kc = dcgain(Gs);
Kd = dcgain(GZ);
fprintf('Ciągłe wzmocnienie statyczne: %f\n', Kc);
fprintf('Dyskretne wzmocnienie statyczne: %f\n', Kd);