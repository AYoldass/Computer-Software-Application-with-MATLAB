syms v
vt = dsolve('D2v = -Dv-v+10','Dv(0)= 0,v(0) = 0');
%ezplot(vt,[0 20]);
fplot(vt,[0 20],'LineWidth',2,'Color','g');
title('\bfGraph of the Voltage Change of The Capacitor','FontSize',12)
xlabel('Time(Seconds)')
ylabel('Voltage(V)')
axis([0 20 0 12])
grid on



