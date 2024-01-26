#Programa Temperatura

import numpy as np

print('Este programa calcula los valores promedio de las temperaturas de distintos lugares')
a = 'Longuitud'
b = 'Latitud'
print('')

A = np.zeros(shape = (6,6))
L = np.zeros(shape = (6))
S = np.zeros(shape = (6))
Lo = np.zeros(shape = (6))

A[0,0]=68.2 ;A[0,1]=72.1 ;A[0,2]=72.5 ;A[0,3]=74.1 ;A[0,4]=74.4 ;A[0,5]=74.2
A[1,0]=69.4 ;A[1,1]=71.1 ;A[1,2]=71.9 ;A[1,3]=73.1 ;A[1,4]=73.6 ;A[1,5]=73.7
A[2,0]=68.9 ;A[2,1]=70.5 ;A[2,2]=70.9 ;A[2,3]=71.5 ;A[2,4]=72.8 ;A[2,5]=73.0
A[3,0]=68.8 ;A[3,1]=69.9 ;A[3,2]=70.4 ;A[3,3]=70.8 ;A[3,4]=71.5 ;A[3,5]=72.2
A[4,0]=68.1 ;A[4,1]=69.3 ;A[4,2]=69.8 ;A[4,3]=70.2 ;A[4,4]=70.9 ;A[4,5]=71.2
A[5,0]=68.3 ;A[5,1]=68.8 ;A[5,2]=69.6 ;A[5,3]=70.0 ;A[5,4]=70.5 ;A[5,5]=70.9

for i in range(0,6):
    for j in range(0,6):
        L[i] = L[1] + A[j,i]
    L[i] = L[i]/6.0

for i in range(0,6):
    for j in range(0,6):
        S[i] = S[1] + A[i,j]
    S[i] = S[i]/6.0
    
p = 0    
for i in range(0,6):
    p = p + S[i]
p = p/6.0

for i in range(0,6):
    Lo[i] = ((i-1)*(0.5))+ 90

print(a +'                            '+b)
print('')
print('              ' + str(Lo[0]) + '      ' + str(Lo[1]) + '      ' + str(Lo[2]) + '      ' + str(Lo[3]) + '      ' + str(Lo[4]) + '      ' + str(Lo[5]) )
print('')

la = 30
for i in range(0,6):
    la = la + 0.5
    print('  ' + str(la) + '        ' + str(A[i,0]) + '      ' + str(A[i,1]) + '      ' + str(A[i,2]) + '      ' + str(A[i,3]) + '      ' + str(A[i,4]) + '      ' + str(A[i,5]) + '      ' + '{:,.2f}'.format(S[i]))
    
print('')    
print('              ' + '{:,.1f}'.format(L[0]) + '      ' + '{:,.1f}'.format(L[1]) + '      ' + '{:,.1f}'.format(L[2]) + '      ' + '{:,.1f}'.format(L[3]) + '      ' + '{:,.1f}'.format(L[4]) + '      ' + '{:,.1f}'.format(L[5]))

print('')
print('El promedio de todas las ciudades es: ' + '{:,.3f}'.format(p))

