import numpy as np
import matplotlib.pyplot as plt

def mitad(b,c):
    global m
    m = ((b + c)/2)
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
    print('Limite derecho: ')
    r = float(input())
    print('Limite izquierdo: ')
    l = float(input())
    funcion(r,P)
    rlim = n
    funcion(l,P)
    llim = n
    while rlim*llim < 0:
        mitad(r,l)
        p = m
        funcion(p,P)
        plim = n
        if (llim*plim < 0):
            r = p
            rlim = plim
            error(p,l)
            er = e
            if (er < 0.05):
                ra = p
                print('La raiz es: ' + str(ra))
                break
        if (llim*plim > 0):
            l = p
            llim = plim
            error(p,r)
            er = e
            if (er < 0.05):
                ra = p 
                print('La raiz es: ' + str(ra))
                break
        if (llim*plim == 0):
            ra = p 
            print('La raiz es: ' + str(ra))
            break
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

