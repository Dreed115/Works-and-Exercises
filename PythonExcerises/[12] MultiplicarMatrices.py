#Programa Multiplicar Matrices

import numpy as np

print('Este programa multiplica dos matrices cumpliendo sus condiciones')
print('Cantidad de filas de la matriz A')
n = int(input())
print('')
print('Cantidad de columnas de la matriz A')
m = int(input())
print('')
print('Cantidad de filas de la matriz B')
p = int(input())
print('')
print('Cantidad de columnas de la matriz B')
o = int(input())
print('')

while (m != p):
    print('Valor no correspondiente para multiplicar')
    print('Cantidad de filas de la matriz A')
    n = int(input())
    print('')
    print('Cantidad de columnas de la matriz A')
    m = int(input())
    print('')
    print('Cantidad de filas de la matriz B')
    p = int(input())
    print('')
    print('Cantidad de columnas de la matriz B')
    o = int(input())
    print('')

A = np.zeros(shape = (n,m))
B = np.zeros(shape = (m,o))
C = np.zeros(shape = (n,o))
    
for b in range(0,n):
    for c in range(0,m):
        print('Valor del elemento ' + str(b+1) + ' ,' + str(c+1) + ' de la matriz A')
        A[b,c] = float(input())
    
for b in range(0,n):
    for c in range(0,m):
        print('Valor del elemento ' + str(b+1) + ' ,' + str(c+1) + ' de la matriz B')
        B[b,c] = float(input())
        
for b in range(0,n):
    for c in range(0,o):
        for f in range(0,m):
            g = A[b,f]*B[f,c]
            C[b,c] = C[b,c] + g

print('')
print('El resultado de la multiplicacion de A por B es: ')
print(C)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        