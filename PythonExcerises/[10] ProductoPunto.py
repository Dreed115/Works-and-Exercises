#Programa Producto Punto

import numpy as np

print('Este programa realiza el producto punto de dos vectores')
print('')

print('Componentes del vector A: ')
a1 = float(input())
a2 = float(input())
a3 = float(input())

print('')

print('Componentes del vector B: ')
b1 = float(input())
b2 = float(input())
b3 = float(input())

A = np.array([a1,a2,a3])
B = np.array([b1,b2,b3])

c = A[0]*B[0] + A[1]*B[1] + A[2]*B[2]

print('El producto punto de A y B es: ' + str(c))