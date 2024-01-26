#Programa Matriz Elevada

import numpy as np

def Multiplicar(X,Y,m):
    global Z
    Z = np.zeros(shape = (n,n))
    for i in range(0,m):
        for j in range(0,m):
            for f in range(0,m):
                g = X[i,f]*Y[f,j] 
                Z[i,j] = Z[i,j] + g
    return

print('Este programa eleva una matriz a cierto numero establecido')
print('Ingrese el tamaño de la matriz cuadrada: ')
n = int(input())
print('')
print('Ingrese el exponente al que se va a elevar: ')
k = int(input())

A = np.zeros(shape = (n,n))
B = np.zeros(shape = (n,n))
C = np.zeros(shape = (n,n))

for i in range(0,n):
    for j in range(0,n):
        print('Valor en: ' + str(i+1) + ', ' + str(j+1))
        A[i,j] = float(input())
        
B = A

for i in range(0,k-1):
    Multiplicar(A,B,n)
    C = Z
    A = C
    
print('La matriz resultante es la siguiente: ')    
print(A)









