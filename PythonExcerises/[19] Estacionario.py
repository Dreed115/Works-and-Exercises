#Programa Estacionario

import numpy as np

A = np.zeros(shape = (12,12))
B = np.zeros(shape = (12,12))
C = np.zeros(shape = (12,12))

for i in range(0,12):
    for j in range(0,12):
        A[i,j] = 47

A[3,8] = 110

for i in range(0,12):
    A[0,i] = 18
    A[11,i] = 18

for i in range(0,12):
    A[i,0] = 18
    A[i,11] = 18

archivo = open("Estacionario.txt", "w")    
archivo.write('La Temperatura de la placa es la siguiente: \n')
archivo.write('\n')
for i in range(0,12):    
    archivo.write('   ' + str(A[i,0]) + '   ' + str(A[i,1]) + '   ' + str(A[i,2]) + '   ' + str(A[i,3]) + '   ' + str(A[i,4]) + '   ' + str(A[i,5]) + '   ' + str(A[i,6]) + '   ' + str(A[i,7]) + '   ' + str(A[i,8]) + '   ' + str(A[i,9]) + '   ' + str(A[i,10]) + '   ' + str(A[i,11]) + '\n')
    
op = 1
d = 1
while (op == 1):
    for i in range(1,11):
        for j in range (1,11):
            B[i,j] = A[i,j]
            A[i,j] = (A[i+1,j] + A[i-1,j] + A[i,j+1] + A[i,j-1])/4
            A[3,8] = 110
            C[i,j]= abs(A[i,j]-B[i,j])
    op = 2
    for i in range(1,11):
        for j in range(1,11):
            if(op == 2):
                if(C[i,j] > 0.001):
                    op = 1
                else:
                    op = 2
    d = d + 1 
archivo.write('\n')    
archivo.write('La temperatura establizada es la siguiente: \n')
archivo.write('Iteraciones: ' + str(d) + '\n')
for i in range(0,12):
    archivo.write('   ' + '{:,.2f}'.format(A[i,0]) + '   ' + '{:,.2f}'.format(A[i,1]) + '   ' + '{:,.2f}'.format(A[i,2]) + '   ' + '{:,.2f}'.format(A[i,3]) + '   ' + '{:,.2f}'.format(A[i,4]) + '   ' + '{:,.2f}'.format(A[i,5]) + '   ' + '{:,.2f}'.format(A[i,6]) + '   ' + '{:,.2f}'.format(A[i,7]) + '   ' + '{:,.2f}'.format(A[i,8]) + '   ' + '{:,.2f}'.format(A[i,9]) + '   ' + '{:,.2f}'.format(A[i,10]) + '   ' + '{:,.2f}'.format(A[i,11]) + '\n')
                        
        



