function SEIRPy
close all;
clear;
clc; 

Sy0 =9;
Ey0 = 6;
K0 = 300;
Ry0 = 2;
Pry0 = 1;
P0 = 20;
B0 = 350;

Tspan  = [0 15];    % tiempo de simulacion
y0     = [Sy0; Ey0; K0; Ry0; Pry0; P0;B0];   
[t, y] = ode45(@(t,y) SEIRPyoung(t,y), Tspan, y0);
 
%plot(t, y(:, 8),t, y(:, 3),'--',t, y(:, 9),':',t, y(:, 10),'-.','linewidth', 1.5,'Color',[0 0 0])
plot(t,y,'linewidth', 1.5)
ylim([0 300])
xlabel('Tiempo (semanas)')
ylabel('Población de plantas jóvenes expuestas')
legend('$S_y$','$E_y$','$K$','$R_y$','$P_{ry}$','$P$','$B$','Location','best','interpreter','latex') %,'Ey1','Ey2','Ey3'
end9
