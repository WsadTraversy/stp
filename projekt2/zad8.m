figure;
stairs(y_dmc, 'r', 'LineWidth', 1);
hold on;
stairs(y_gpc, 'b', 'LineWidth', 1);
stairs(y_zad, 'k--');
grid on;
xlabel('k');
ylabel('y(k)');
title('Odpowiedź układu i wartość zadana');
legend('DMC','GPC', 'y_{zad}(k)', 'Location', 'Best');

figure;
stairs(u_dmc, 'r', 'LineWidth', 1);
hold on;
stairs(u_gpc, 'b', 'LineWidth', 1);
grid on;
xlabel('k');
ylabel('u(k)');
title('Sygnał sterowania u(k)');
legend('DMC','GPC', 'Location', 'Best');