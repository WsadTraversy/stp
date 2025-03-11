clear all;
syms s 
g = (s+1)*(s+5)/((s+6)*(s+7)*(s+8));
num = expand((s+1)*(s+5));
den = expand((s+6)*(s+7)*(s+8));
assume(s, 'clear');
num_matrix = [1 6 5];
den_matrix = [1 21 146 336];
[A, B, C, D] = tf2ss(num_matrix, den_matrix);
