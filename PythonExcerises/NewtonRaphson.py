import numpy as np
import matplotlib.pyplot as plt

def newton(b,c,t):
    global m
    m = b -(c/t)
    return

def prima(g,F):
    global w
    w  = 6*F[6]*g**5+5*F[5]*g**4+4*F[4]*g**3+3*F[3]*g**2+2*F[2]*g+F[1]
    return

def error(d,f):
    global e
    e = abs((d-f)/d)*100
    return

print('Este programa enceuntra las raices de una funcion polinomial dada por el ususario')
print('Maximo exponente de la funcion hasta 6: ')
z = int(input())
P = np.zeros(shape = (7))

for i in range(0,z+1):
    print('Coeficeinte del exponente: ' + str(i))
    P[i] = float(input())
    

def funcion(a,P):
    global n
    n = P[6]*a**6+P[5]*a**5+P[4]*a**4+P[3]*a**3+P[2]*a**2+P[1]*a**1+P[0]
    return

op = 1

while(op == 1):
    print('valor inicial en x: ')
    r = float(input())
    er = 1
    while (er > 0.05):
        funcion(r,P)
        rlim = n
        prima(r,P)
        rprima = w
        newton(r,rlim,rprima)
        p = m
        error(p,r)
        er = e
        r = p
    print('La raiz es: ' + str(p))
    print('Oprima 1 para sacar otra raiz: ')
    op = float(input())


x = np.linspace(-10,10,256, endpoint=True)
y = P[6]*x**6+P[5]*x**5+P[4]*x**4+P[3]*x**3+P[2]*x**2+P[1]*x+P[0]

plt.xlim(-15,15)
plt.ylim(-15,15)
plt.plot(x,y, color="red")

ax = plt.gca()  # gca stands for 'get current axis'
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')
ax.xaxis.set_ticks_position('bottom')
ax.spines['bottom'].set_position(('data',0))
ax.yaxis.set_ticks_position('left')
ax.spines['left'].set_position(('data',0))

plt.show
