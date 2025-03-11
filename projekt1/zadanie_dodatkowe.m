Ar = [A, zeros(size(A, 1), 1); -C, 0];
Br = [[1.2;0;0]; 0];

K = acker(Ar, Br, [-8 -8 -8 -8]);
k1 = K(1);
k2 = K(2);
k3 = K(3);
k4 = K(4);

