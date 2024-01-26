#Programa Orden

import numpy as np

def ordenar(x,y):
    global b
    global c
    b = x
    c = y
    if(y < x):
        z = y
        c = x
        b = z
    return

print('Este programa ordena de mayor a menor n numeros dados')
print('')
print('Ingrese la cantidad de numeros que desee ordenar: ')
a = int(input())

N = np.zeros(shape = (a))

for i in range(0,a):
    print('Ingrese el numero ' + str(i+1))
    N[i] = float(input())
    
for i in range(0,a):
    for j in range(0,a):
        ordenar(N[i],N[j])
        N[i] = b
        N[j] = c
print('')
print('El orden es el siguiente: ')        
print(N)