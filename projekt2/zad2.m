[num, den] = tfdata(GZ, 'v');

a = num(2);
b = num(3);
c = -den(2);
d = -den(3);

ystr = ['y(k)=',num2str(a),'*u(k-11) + ',num2str(b),'*u(k-12) + ',num2str(c),'*y(k-1) + (',num2str(d),')*y(k-2)'];

disp(ystr)

