%G = ss(A, B, C, D);
%Gss = tf(G);

syms s
G = C*inv(s*eye(3)-A)*B + D;
assume(s, 'clear');
disp(collect(G));