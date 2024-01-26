#Programa Matriz

import numpy as np

print('Este programa suma dos matrices de acuerdo con el tamaño asignado por el usuario')
print('Cantidad de filas: ')
m = int(input())
print('')
print('Cantidad de columnas: ')
n = int(input())

A = np.zeros(shape=(m,n))
B = np.zeros(shape=(m,n))

for i in range(0,m):
    for j in range(0,n):
        print('Valor ' + str(i+1) + ', ' + str(j+1) + ' de la primera Matriz')
        A[i,j] = float(input())
        
for i in range(0,m):
    for j in range(0,n):
        print('Valor ' + str(i+1) + ', ' + str(j+1) + ' de la segunda Matriz')
        B[i,j] = float(input())

print('')
print('La suma es: ')
print(A+B)
