import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

# Población total
N = 1000
# Tasas de contagio y de recuperación
beta, gamma = 1, 0.31
# Condiciones iniciales de plantas infectadas y recuperadas.
I0, R0 = 10, beta/gamma
# Población de plantas susceptibles
S0 = N - I0
# Tiempo de simulación
t = np.linspace(0, 20)

# Ecuaciones diferenciales del modelo
def deriv(y, t, N, beta, gamma):
    S, I, R = y
    dSdt = -beta * S * I / N
    dIdt = beta * S * I / N - gamma * I
    dRdt = gamma * I
    return dSdt, dIdt, dRdt

y0 = S0, I0, R0
ret = odeint(deriv, y0, t, args=(N, beta, gamma))  #integración con el método ODE en el intervalo t
S, I, R = ret.T


fig = plt.figure()#facecolor='w'
ax = fig.add_subplot(111, axisbelow=True)#facecolor='#dddddd',
ax.plot(t, S,  alpha=0.5, lw=2, label='S') # 'black',linestyle = 'dashed',
ax.plot(t, I,  alpha=0.5, lw=2, label='I')
ax.plot(t, R,  alpha=0.5, lw=2, label='R')
ax.set_xlabel('Semanas',fontsize = 12)
ax.set_ylabel('Población',fontsize = 12)
plt.title("Predicciones del modelo SIR con Python",fontsize = 14)
legend = ax.legend()
plt.show()
