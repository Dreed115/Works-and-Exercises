#Programa Linealizacion

import numpy as np

def Pendiente(X,d,ve,pe,qe):
    global mn
    l = 0
    for i in range(0,d):
        o = (np.log(X[i,0]))**2
        l = l + o
    
    z = qe/d
    zp = pe/d
    mn = (ve-(pe*z))/(l-(pe*zp))
    return

def Coeficiente(Y,e,t,s,g):
    global r
    global rn
    le = 0
    lo = 0
    for i in range(0,e):
        ou = (np.log(Y[i,0]))**2
        ol = (np.log(Y[i,1]))**2
        le = le + ou
        lo = lo + ol
   
    un = (e*le-(s**2))*(e*lo-(g**2))
    rn = (t-s*g)/(np.sqrt(un))

print('Este programa realiza la linealizacion de datos')
print('Ingrese la cantidad de puntos que se tienen: ')
n = int(input())

A = np.zeros(shape = (n,2))

for i in range(0,n):
    print('Valor en independiente y dependiente del punto: ' + str(i+1))
    A[i,0] = float(input())
    A[i,1] = float(input())
    
v = 0
for i in range(0,n):
    w = np.log(A[i,0])*np.log(A[i,1])
    v = v + w 

p = 0
q = 0
for i in range(0,n):
    p = p + np.log(A[i,0])
    q = q + np.log(A[i,1])

Pendiente(A,n,v,p,q)
a = mn
Coeficiente(A,n,v,p,q)
c = rn
print('La pendiente es: ' + str(a))
print('El coeficiente de corelacion es: ' + str(c))

