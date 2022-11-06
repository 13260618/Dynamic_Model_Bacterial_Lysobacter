function SEIRPplotEy
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
Ey10=300;
Ey11=300;
Ey12 = 300;
Tspan  = [0 15];    % tiempo de simulacion
y0     = [Sy0; Ey0; K0; Ry0; Pry0; P0;B0;Ey10;Ey11;Ey12];   % valores iniciales (12 valores)  
[t, y] = ode45(@(t,y) SEIRPfunctionEy(t,y), Tspan, y0);
 
plot(t, y(:, 8),t, y(:, 3),'--',t, y(:, 9),':',t, y(:, 10),'-.','linewidth', 1.5,'Color',[0 0 0])
plot(t,y,'linewidth', 1.5)
ylim([0 300])
xlabel('Tiempo (semanas)')
ylabel('Población de plantas jóvenes expuestas')
legend('$\alpha_y$=0.0','$\alpha_y$=0.00006','$\alpha_y$=0.0006','$\alpha_y$=0.006','Location','best','interpreter','latex')
end
