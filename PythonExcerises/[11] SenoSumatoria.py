#Programa SenoSumatoria

import numpy as np
import math

C = np.zeros(shape = (4))
C[0] = 5
C[1] = 8
C[2] = 10
C[3] = 12

print('Este programa calcula y compara la funcion seno de cualquier angulo dado')
print('Ingrese el angulo en grados: ')
a = float(input())

b = (a/180)*(math.pi)
s = 0

for i in range(0,4):
    for n in range(1,int(C[i]+1)):
        p = (2*n - 1)
        f = 1
        for j in range(0,(p-1)):
            f = f*(p-j)
        d = ((-1)**(n+1))*((b**p)/(f))
        s = s + d
    si = math.sin(b)
    print('El seno de '+ str(a) +' con sumatoria de ' + str(int(C[i])) + ' es ' + str(s))  
    s = 0
print('El seno es: ' + str(si))