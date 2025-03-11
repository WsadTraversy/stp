clear all;
close all;

% Wartości To/To_nom do testowania
To_ratios = [1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9];

% Dane dla PID
PID_op = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
PID_K = [0.489, 0.479, 0.469, 0.459, 0.449, 0.441, 0.433, 0.425, 0.417, 0.410];

% Dane dla GPC
GPC_op = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
GPC_K = [3.167, 3.134, 2.614, 2.041, 1.678, 1.462, 1.372, 1.367, 1.352, 1.343];

% Dane dla DMC
DMC_op = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
DMC_K = [1.983, 1.900, 1.588, 1.025, 0.690, 0.510, 0.424, 0.391, 0.388, 0.381];

% Nominalne wartości K i T
K_nom = 1;
T_nom = 1;

PID_K_ratio = PID_K / K_nom;

DMC_K_ratio = DMC_K / K_nom;

GPC_K_ratio = GPC_K / K_nom;

% Wykres porównawczy dla PID i DMC
figure;
hold on;
plot(To_ratios, GPC_K_ratio, 'r', 'LineWidth', 1.5, 'DisplayName', 'GPC');
%plot(To_ratios, DMC_K_ratio, 'b', 'LineWidth', 1.5, 'DisplayName', 'DMC');
xlabel('To/T_{nom}');
ylabel('K/Ko');
title('Porównanie jakości regulacji GPC');
legend('Location', 'Best');
grid on;
hold off;

