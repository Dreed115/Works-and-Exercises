#Programa Array

import numpy as np

print('Ingrese los valores del primer Vector: ')
a1 = float(input())
a2 = float(input())
a3 = float(input())

print('Ingrese los valores del segundo Vector: ')
b1 = float(input())
b2 = float(input())
b3 = float(input())

print('Ingrese los valores de la Matriz 2x2: ')
c1 = float(input())
c2 = float(input())
c3 = float(input())
c4 = float(input())

A = np.array([a1,a2,a3])
B = np.array([b1,b2,b3])
C = np.array([[c1,c2],[c3,c4]])

print('Valores del primer Vector')
print(A)
print('')
print('Valores del segundo Vector')
print(B)
print('')
print('Valores de la Matriz 2x2')
print(C)