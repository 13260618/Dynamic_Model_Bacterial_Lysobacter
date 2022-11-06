function dydt = SEIRPfunctionEy(t, y)
    %%%%%% Valores estimados proporcionados por el autor del
    %%%%%% Artículo.
    r = 0.125;
    theta_y = 0.06;
    omega_y = 0.7;    
    g= 0.000125;
    alpha_y = 0.00004;
    alpha_y1 = 0.00006;
    alpha_y2 = 0.02;
    alpha_y3 = 0.06;
    
    phi_y = 0.5;
    iota_y = 0.02;
    chi_y = 0.067;
    gamma = 0.067;
    beta = 0.992;
    Psi = 0.992;
    lambda = 0.48;
    eta = 0.02;
    delta = 0.004;
    mu_y = 0.9;
    mu_p = 0.00018;
    omega_bar = 2387014640356.4;
    q = 2387014640356.4;
    n = 0.125;
    Sy = y(1);
    Ey = y(2);
    K = y(3);
    Ry = y(4);
    Pry = y(5);
    P = y(6);
    B = y(7);
    Ey1 = y(8);
    Ey2 = y(9); 
    Ey3 = y(10);
    Delta_y = (theta_y*K+phi_y*P);
    C = 10;
    N = (r*C)/(r+delta);
    
%EDOs
    dSy = r*(C-N)-Delta_y*Sy-gamma*Sy-delta*Sy-iota_y*Sy*B;
    dEy = Delta_y*Sy-alpha_y*Ey*B-omega_y*Ey-delta*Ey;
    dK = omega_y*Ey - (delta+mu_y)*K;
    dRy = alpha_y*Ey*B - phi_y*Ry - delta*Ry;
    dPry = iota_y*Sy*B + chi_y*Pry - delta*Pry;
    dP = g*P + beta*(P)*(1-(P/q))-(lambda+mu_p*B)*P;
    dB = n*B + Psi*B*(1-(B/omega_bar))-(eta*B);
    dEy1 = Delta_y*Sy-alpha_y1*Ey1*B-omega_y*Ey1-delta*Ey1;
    dEy2 = Delta_y*Sy-alpha_y2*Ey2*B-omega_y*Ey2-delta*Ey2;
    dEy3 = Delta_y*Sy-alpha_y3*Ey3*B-omega_y*Ey3-delta*Ey3;
    dydt = [dSy;dEy;dK;dRy; dPry; dP;dB;dEy1;dEy2;dEy3];
end
