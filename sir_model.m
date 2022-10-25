%%%%%  Variables del modelo  %%%%


beta =1.36;  % Tasa de transmisión  % beta
gamma =0.31; % Tasa de recuperación % gamma
N = 1000;                          % Total de población
I0 = 10;                           % Número de infectados iniciales
S0 = 990;                          % Número de Susceptibles iniciales
T = 20;                            % Tiempo de observación (Semanas)
R0=beta/gamma;  

%%%%% Valores iniciales y declaración de la función ODE45 %%%%%

y0 = [S0; I0; R0];             % Condiciones iniciales
tspan = [0 T];                 % Intervalo de integración usando ode45
[t,y] = ode45(@(t,y) sir_model(t,y,beta,gamma,N),tspan,y0);  %funcion ode45

%%%%% Gráfico  %%%%%

plot1 = plot(t,y);
xlabel('Weeks'); 
ylabel('Number of individuals');
legend('S','I','R','location', 'best');
title('SIR Model Predictions');
set(plot1(1),'DisplayName','S','LineWidth',1.5,'Color',[0 0 0]);
set(plot1(2),'DisplayName','I','LineStyle','--','LineWidth',1.5,'Color',[0 0 0]);
set(plot1(3),'DisplayName','R','LineStyle',':','LineWidth',1.5,'Color',[0 0 0]);
