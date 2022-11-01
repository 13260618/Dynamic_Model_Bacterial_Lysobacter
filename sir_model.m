function dSIRdt = sir_model(t,y,beta,gamma,N)
  S = y(1);
  I = y(2);
  
  dS = (-beta*S*I/N) ;
  dI = (beta*S*(I/N) - gamma*I);
  dR = (gamma*I);
  dSIRdt = [dS;dI;dR];
end
