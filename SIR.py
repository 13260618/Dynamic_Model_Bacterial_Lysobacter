import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt
 
# Población total
N = 1000
# Condiciones iniciales de plantas infectadas y recuperadas.
I0, R0 = 1, 0
# Población de plantas susceptibles
S0 = N - I0 - R0
# Tasas de contagio y de recuperación
beta, gamma = 1, 0.31
# Tiempo de simulación
t=np.linspace(0, 20, 20)
 
# Ecuaciones diferenciales del modelo
def deriv(y, t, N, beta, gamma):
    S, I, R = y
    dSdt = -beta * S * I / N
    dIdt = beta * S * I / N - gamma * I
    dRdt = gamma * I
    return dSdt, dIdt, dRdt

 
y0 =S0, I0, R0
ret = odeint(deriv, y0, t, args=(N, beta, gamma))  #integración con el método ODE en el intervalo t
S, I, R = ret.T
 
# Gráficos de S(t), I(t) y R(t)
fig = plt.figure()  
ax = fig.add_subplot(111, axisbelow=True) 
ax.plot(t, S/1000,  alpha=0.5, lw=1.5, label='Susceptibles')  
ax.plot(t, I/1000,  alpha=0.5, lw=1.5, label='Infectados')
ax.plot(t, R/1000,  alpha=0.5, lw=1.5, label='Recuperados con inmunidad')
ax.set_xlabel('Días')
ax.set_ylabel('Población (1000s)')
plt.title("Predicciones del modelo SIR con Python")
legend = ax.legend()
plt.show()

