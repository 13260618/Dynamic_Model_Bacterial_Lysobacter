function dydt=BvsP(t,y,g)
beta = 0.992;%0.99; % Recovery Rate      % gamma
q = 2387014640356.4; %0.347;% Rate at which expos
lambda = 0.48;
mu_p = 0.00018;
n = 0.125;
Psi = 0.992;
omega_bar = 2387014640356.4;
eta = 0.02;
P = y(1);
B = y(2);

%ecs dif Pat & Bioc
dP = g*P + beta*P*(1-(P/q))-(lambda+mu_p*B)*P;
dB = n*B + Psi*B*(1-(B/omega_bar))-(eta*B);
dydt =[dP;dB];

end
